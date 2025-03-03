import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

class ImageListViewerArgs {
  final List<String> imageList;
  final int initialIndex;

  ImageListViewerArgs({
    required this.imageList,
    this.initialIndex = 0,
  });
}

class ImageListViewer extends StatefulWidget {
  final ImageListViewerArgs args;

  const ImageListViewer({Key? key, required this.args}) : super(key: key);

  @override
  State<ImageListViewer> createState() => _ImageListViewerState();
}

class _ImageListViewerState extends State<ImageListViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.args.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
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
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.args.imageList.length,
        itemBuilder: (context, index) {
          final imageUrl = widget.args.imageList[index];
          return InkWell(
            onTap: () {
              Get.back();
            },
            onLongPress: () {
              showBottomSheet(context, imageUrl);
            },
            child: Center(
                child: Container(
                  width: double.infinity,
                  child: ExtendedImage.network(
                    imageUrl,
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
          );
        },
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context, String imageUrl) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImageOptionsSheet(
          onSave: () {
            saveNetworkImage(imageUrl);
          },
          onCancel: () {
            Navigator.pop(context);
          },
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

  saveNetworkImage(String imageUrl) async {
    if (GetPlatform.isDesktop) {
      toastFailure(message: '保存失败', error: "暂不支持非移动端");
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
          DateTime.timestamp().millisecondsSinceEpoch.toString() + ".jpg";

      final data = await getNetworkImageData(imageUrl, useCache: true);
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

class ImageOptionsSheet extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const ImageOptionsSheet({
    Key? key,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onSave();
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 65,
            child: Center(
              child: Text(
                '保存图片',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
        InkWell(
          onTap: () {
            onCancel();
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: 65,
            child: Center(
              child: Text(
                '取消',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
