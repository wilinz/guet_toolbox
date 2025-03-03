import 'dart:typed_data';
import 'dart:isolate';
import 'dart:io' as io;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:guethub/logger.dart';
import 'package:image/image.dart' as img;

Future<Uint8List> compressImage(Uint8List imageBytes,
    {int minWidth = 1920, int minHeight = 1080}) async {
  var target = 2 * 1024 * 1024; // 2 MB 的大小
  if (imageBytes.length <= target) {
    target = (imageBytes.lengthInBytes * 0.75).toInt();
  }
  return await compressToTargetSize(
    imageBytes,
    target,
    minWidth: minWidth,
    minHeight: minHeight,
  );
}

/// 主入口：根据平台选择压缩方式
Future<Uint8List> compressToTargetSize(Uint8List imageBytes, int targetSize,
    {int minWidth = 1920, int minHeight = 1080}) async {
  if (io.Platform.isAndroid || io.Platform.isIOS || io.Platform.isMacOS) {
    // 使用 flutter_image_compress
    logger.d('使用原生库 flutter_image_compress');
    return await _compressWithNative(
      imageBytes,
      targetSize,
      minWidth: minWidth,
      minHeight: minHeight,
    );
  } else {
    // 使用 Dart 库 image 包并通过 Isolate 处理
    logger.d('使用 Dart 库 image 包');
    return await compressToTargetSizeWithIsolate(
      imageBytes,
      targetSize,
      minWidth: minWidth,
      minHeight: minHeight,
    );
  }
}

/// 使用原生库进行压缩
Future<Uint8List> _compressWithNative(Uint8List imageBytes, int targetSize,
    {int quality = 90, required int minWidth, required int minHeight}) async {
  Uint8List compressedBytes = imageBytes;

  // 使用 flutter_image_compress 逐步压缩图片
  while (compressedBytes.lengthInBytes > targetSize && quality > 10) {
    compressedBytes = await FlutterImageCompress.compressWithList(
      minWidth: minWidth,
      minHeight: minHeight,
      compressedBytes,
      quality: quality,
    );
    quality -= 10; // 每次降低 10% 质量
  }

  return compressedBytes;
}

/// 使用 Isolate 和 Dart 库进行压缩
Future<Uint8List> compressToTargetSizeWithIsolate(
    Uint8List imageBytes, int targetSize,
    {required int minWidth, required int minHeight}) async {
  final receivePort = ReceivePort();

  // 启动 Isolate
  await Isolate.spawn(
    _isolateCompressionEntryPoint,
    CompressionParams(
      TransferableTypedData.fromList([imageBytes]), // 转换为 TransferableTypedData
      targetSize,
      minWidth,
      minHeight,
      receivePort.sendPort,
    ),
  );

  // 等待结果
  final TransferableTypedData result =
      await receivePort.first as TransferableTypedData;

  return result.materialize().asUint8List(); // 返回压缩后的字节数据
}

/// 数据类，用于传递参数
class CompressionParams {
  final TransferableTypedData imageData; // 高效传递 Uint8List
  final int targetSize; // 目标大小
  final int minWidth;
  final int minHeight;
  final SendPort sendPort; // 用于返回结果

  CompressionParams(this.imageData, this.targetSize, this.minWidth,
      this.minHeight, this.sendPort);
}

/// Isolate 的入口函数
void _isolateCompressionEntryPoint(CompressionParams params) async {
  final Uint8List imageBytes =
      params.imageData.materialize().asUint8List(); // 解压数据

  final Uint8List compressedBytes = await _compressWithDartLibrary(
      imageBytes, params.targetSize,
      minWidth: params.minWidth, minHeight: params.minHeight);

  // 将结果发送回主线程
  params.sendPort.send(TransferableTypedData.fromList([compressedBytes]));
}

/// 使用 Dart 库进行实际压缩
Future<Uint8List> _compressWithDartLibrary(Uint8List imageBytes, int targetSize,
    {int quality = 90, required int minWidth, required int minHeight}) async {
  // 解码图片
  img.Image? image = img.decodeImage(imageBytes);
  if (image == null) {
    throw Exception('Failed to decode image');
  }

  int currentWidth = image.width;
  int currentHeight = image.height;

  // 优先调整分辨率
  while ((currentWidth > minWidth || currentHeight > minHeight) &&
      imageBytes.lengthInBytes > targetSize) {
    currentWidth = (currentWidth * 0.8).toInt(); // 每次降低宽度 20%
    currentHeight = (currentHeight * 0.8).toInt(); // 每次降低高度 20%

    // 确保分辨率不会低于最小值
    if (currentWidth < minWidth) currentWidth = minWidth;
    if (currentHeight < minHeight) currentHeight = minHeight;

    // 调整分辨率
    image = img.copyResize(image!, width: currentWidth, height: currentHeight);

    // 再次计算压缩后的大小
    imageBytes = Uint8List.fromList(img.encodeJpg(image, quality: quality));
  }

  // 调整完分辨率后，逐步降低质量
  Uint8List compressedBytes =
      Uint8List.fromList(img.encodeJpg(image!, quality: quality));
  while (compressedBytes.lengthInBytes > targetSize && quality > 10) {
    quality -= 10; // 每次降低 10% 质量
    compressedBytes =
        Uint8List.fromList(img.encodeJpg(image, quality: quality));
  }

  return compressedBytes;
}
