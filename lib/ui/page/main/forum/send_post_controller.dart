import 'dart:async';
import 'dart:io';

// import 'package:amap_flutter_location/amap_flutter_location.dart';
// import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:fl_amap/fl_amap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:guethub/data/model/app/forum/forum_categories_response/forum_categories_response.dart';
import 'package:guethub/data/model/app/forum/location.dart';
import 'package:guethub/data/model/app/upload_pictures_response/upload_pictures_response.dart';
import 'package:guethub/data/model/common/common_response.dart';
import 'package:guethub/data/repository/app/upload.dart';
import 'package:guethub/data/repository/app_user.dart';
import 'package:guethub/data/repository/forum_repository.dart';
import 'package:guethub/ui/page/main/forum/send_post_page.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kt_dart/standard.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../data/network.dart';
import 'package:guethub/logger.dart';

class SendPostController extends GetxController {
  final contentController = TextEditingController();
  final imagePicker = ImagePicker();
  var contentIsNotBlank = false.obs;
  var textNum = 0.obs;
  var images = <XFile>[].obs;
  var upLoading = false.obs;

  var categories = <ForumCategory>[].obs;
  var selectedCategory = Rx<ForumCategory?>(null);
  var isEmojiVisible = false.obs;
  var selectedVisibility = 'public'.obs;
  final location = Rxn<Location>();
  var allowReplies = true.obs;

  final SendPostPageArgs? args;

  SendPostController({this.args});

  void changeVisibility(String visibility) {
    selectedVisibility.value = visibility;
  }

  void toggleEmojiPicker() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    await Future.delayed(Duration(milliseconds: 10));
    isEmojiVisible.value = !isEmojiVisible.value;
  }

  Future<void> loadCategories() async {
    try {
      final categoriesResp = await ForumRepository.get().getCategories();
      categories.value = categoriesResp.data;
      if (categories.isNotEmpty) {
        selectedCategory.value = categories.first;
      }
    } catch (e) {
      logger.e(e);
    }
  }

  void pickImage() async {
    if (images.length < 9) {
      final pickedFile = await imagePicker.pickMultiImage();
      images.addAll(pickedFile);
    } else {
      toastFailure(
          error: '\n一次最多上传9张图片捏',
          message: '图片已达到上限',
          gravity: ToastGravity.TOP);
    }
  }

  Future<UploadPicturesResponse> uploadPictures() async {
    final resp = await UploadRepository.get()
        .uploadPictures(xfileImages: images, category: 'forum-post-image');
    return resp;
  }

  Future<void> uploadPost(BuildContext context, String? parentId) async {
    List<String> imgUrls = [];
    showLoadingDialog();
    try {
      final dio = AppNetwork.get().appDio;
      String content = contentController.text.toString();
      if (images.length > 0) {
        final imgResult = await uploadPictures();
        if (imgResult.success) {
          imgUrls = imgResult.data;
        } else {
          toastFailure0("上传图片失败",
              error: imgResult.msg, gravity: ToastGravity.TOP);
          return;
        }
      }
      final location = this.location.value;

      Map<String, dynamic> data = {
        "category_id": selectedCategory.value?.id,
        "images": imgUrls,
        "parent_id": parentId,
        "text": content,
        // "topic_id_list": [
        //   "string"
        // ],
        // "videos": [
        //   "string"
        // ],
        "allow_replies": this.allowReplies.value,
        "visibility": selectedVisibility.value,
        if (location != null) "latitude": location.latitude,
        if (location != null) "longitude": location.longitude,
        if (location != null) "address": location.address
      };
      final resp = await dio.post('/forum/post', data: data);
      final response = CommonResponse.fromJson(resp.data);
      if (response.success) {
        clearAll();
        hideLoadingDialog();
        Navigator.pop(context);
        toastSuccess(message: "上传成功", gravity: ToastGravity.TOP);
      } else {
        toastFailure0('上传失败', error: response.msg, gravity: ToastGravity.TOP);
      }
    } on Exception catch (e) {
      logger.d(e.toString());
      toastFailure0('上传失败：', error: e, gravity: ToastGravity.TOP);
    } finally {
      hideLoadingDialog();
    }
  }

  void clearAll() {
    contentController.clear();
    images.clear();
  }

  void showLoadingDialog() {
    if (Get.isDialogOpen != true) {
      Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text("加载中，请稍候..."),
            ],
          ),
        ),
      );
    }
  }

  void hideLoadingDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  Future<(double?, double?, Map<String, dynamic>?)> locationUseAmap() async {
    // Completer<(double, double, Map<String, Object>)> completer = Completer();

    /// 初始化AMap
    final bool data = await FlAMapLocation().initialize();
    if (data) {
      logger.d('初始化成功');
    }

    final location = await FlAMapLocation().getLocation();

    logger.d(location?.toMap());
    return Future.value((
      location?.latitude,
      location?.longitude,
      location?.toMap(),
    )); // TODO
    // AMapFlutterLocation locationPlugin = AMapFlutterLocation();

    // locationPlugin.onLocationChanged().listen((location) {
    //   // location type see https://lbs.amap.com/api/flutter/guide/positioning-flutter-plug-in/interface-info
    //   final latitude = location['latitude'].toString().toDoubleOrNull();
    //   final longitude = location['longitude'].toString().toDoubleOrNull();
    //   if (latitude == null || longitude == null) {
    //     completer.completeError(Exception("定位失败: ${location}"));
    //     return;
    //   }
    //   logger.d(location);
    //   completer.complete((latitude, longitude, location));
    // });
    // locationPlugin
    //   ..setLocationOption(AMapLocationOption(
    //     onceLocation: true,
    //   ))
    //   ..startLocation();
    //
    // return completer.future;
  }

  getLocation() async {
    var status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      logger.d("开始定位");
      final (lat, lng, info) = await locationUseAmap();
      if(lat == null || lng == null || info == null || (info['city'] as String?).isNullOrWhiteSpace){
        toastFailure0("定位失败，请重试");
        return;
      }
      location.value = Location(
          latitude: lat,
          longitude: lng,
          address: "${info['city']} - ${info['description']}");
      logger.d("结束定位");
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    contentController.addListener(() {
      textNum.value = contentController.value.text.length;
      contentIsNotBlank.value = contentController.text.isNotBlank;
    });
    args?.text?.let((it) {
      contentController.text = it;
    });
    loadCategories();
    final user = await AppUserRepository.get().getActiveAppUser();
    if (user == null) {
      toast("您未登录App账户，将无法发送帖子或评论", gravity: ToastGravity.CENTER);
    }
  }
}
