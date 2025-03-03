import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:guethub/data/model/app/upload_pictures_response/upload_pictures_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/util/image.dart';
import 'package:guethub/util/random.dart';
import 'package:image_picker/image_picker.dart';

class UploadRepository {
  Future<UploadPicturesResponse> uploadPictures(
      {List<XFile>? xfileImages,
      List<Uint8List>? bytesImages,
      String? category}) async {
    final dio = AppNetwork.get().appDio;

    // 使用 List.map 和 Future.wait 进行并发处理
    final multipartFiles = await Future.wait(
      xfileImages?.map((image) async {
        // 读取文件为 Uint8List
        Uint8List imageBytes = await image.readAsBytes();
        // 压缩图片
        Uint8List compressedBytes = await compressImage(imageBytes);
        // 创建 MultipartFile
        return MultipartFile.fromBytes(compressedBytes,
            filename: image.name);
      }).toList() ??
          [],
    );

    final bytesFiles = await Future.wait(
      (bytesImages ?? []).map((image) async {
        // 压缩图片
        Uint8List compressedBytes = await compressImage(image);
        // 创建 MultipartFile
        return MultipartFile.fromBytes(compressedBytes,
            filename: randomString(12) + ".jpg");
      }),
    );

    // 创建 FormData 对象
    final formData = FormData.fromMap({
      'pictures': multipartFiles + bytesFiles,
      if (category != null) 'category': category
    });

    final resp = await dio.post(
      '/upload/pictures',
      data: formData,
    );

    return UploadPicturesResponse.fromJson(resp.data);
  }

  UploadRepository._create();

  static UploadRepository? _instance;

  factory UploadRepository.get() => _instance ??= UploadRepository._create();
}
