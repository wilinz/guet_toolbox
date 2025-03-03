import 'dart:io';
import 'package:extended_image/extended_image.dart';
import 'package:guethub/util/crop_circle.dart';
import 'package:guethub/util/crop_editor_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class CropImageScreen extends StatelessWidget {
  final String imagePath;
  final ImageEditorController editorController = ImageEditorController();

  CropImageScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽高比
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenAspectRatio = screenWidth / screenHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text('裁剪图片'),
        actions: [
          IconButton(
            icon: Icon(Icons.rotate_left),
            onPressed: () {
              editorController.rotate(degree: -90, animation: true, rotateCropRect: false);
            },
          ),
          // Rotate right button
          IconButton(
            icon: Icon(Icons.rotate_right),
            onPressed: () {
              editorController.rotate(degree: 90, animation: true, rotateCropRect: false);
            },
          ),
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () async {
              await cropImage();
            },
          ),
        ],
      ),
      body: ExtendedImage.file(
        File(imagePath),
        fit: BoxFit.contain,
        mode: ExtendedImageMode.editor,
        cacheRawData: true,
        initEditorConfigHandler: (state) {
          return EditorConfig(
            maxScale: 8.0,
            cropRectPadding: EdgeInsets.all(20.0),
            hitTestSize: 20.0,
            cropAspectRatio: 1,
            cropLayerPainter: CircleEditorCropLayerPainter(),
            controller: editorController,
          );
        },
      ),
    );
  }

  Future<void> cropImage() async {
    final EditImageInfo fileData = await cropImageData(controller: editorController);
    // 返回裁剪后的图片路径
    Get.back(result: fileData.data);
  }
}
