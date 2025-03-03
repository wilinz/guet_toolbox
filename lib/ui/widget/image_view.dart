import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black, // 设置状态栏颜色
          statusBarIconBrightness: Brightness.light, // 设置状态栏图标颜色
        ),
      ),
      backgroundColor: Colors.black,
      body: InkWell(
        onTap: () {
          Get.back();
        },
        onLongPress: () {
          showBottomSheet(context);
        },
        child: Center(
            child: Container(
                width: double.infinity,
                child: ExtendedImage.network(
                  widget.imgUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                  cacheRawData: true,
                  mode: ExtendedImageMode.gesture,
                  loadStateChanged: (ExtendedImageState state) {
                    final loadState = state.extendedImageLoadState;
                    if (loadState == LoadState.failed) {
                      return Icon(Icons.error);
                    }else if(loadState == LoadState.loading){
                      return Center(child: CircularProgressIndicator());
                    }
                    return null;
                  },
                ),
            )),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                saveNetworkImage();
                Navigator.pop(context);
              },
              child: Container(
                  width: double.infinity,
                  height: 65,
                  child: Center(
                      child: Text(
                    '保存图片',
                    style: TextStyle(fontSize: 20),
                  ))),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: double.infinity,
                  height: 65,
                  child: Center(
                      child: Text(
                    '取消',
                    style: TextStyle(fontSize: 20),
                  ))),
            ),
          ],
        );
      },
      isScrollControlled: false,
      isDismissible: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      useRootNavigator: false,
    );
  }

  saveNetworkImage() async {
    if (GetPlatform.isDesktop) {
      toastFailure(message: '保存失败', error: "暂不支持非移动端"); // todo
      return;
    }
    bool isGranted;
    if (Platform.isAndroid) {
      final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
      isGranted = await (sdkInt > 33 ? Permission.photos : Permission.storage)
          .request()
          .isGranted;
    } else {
      isGranted = await Permission.photosAddOnly.request().isGranted;
    }

    if (isGranted) {
      String picturesPath =
          DateTime.timestamp().millisecondsSinceEpoch.toString() + ".jpg";;
      final data = await getNetworkImageData(widget.imgUrl, useCache: true);
      if(data == null){
        toastFailure0("保存失败", error: "获取图片失败");
      }
      final result = await SaverGallery.saveImage(
        data!,
        quality: 100,
        name: picturesPath,
        androidRelativePath: "Pictures/GuetHub",
        androidExistNotSave: false,
      );
      if (result.isSuccess) {
        toastSuccess(message: '保存成功');
      } else {
        toastFailure(message: '保存失败', error: result.errorMessage);
      }
    } else {
      toastFailure(message: '保存失败', error: "权限不允许");
    }
  }
}
