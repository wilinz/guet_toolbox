import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

import '../../../data/network.dart';
import '../../util/toast.dart';

class FeedbackController extends GetxController {
  var contact = ''.obs; // 联系方式内容
  var contactType = ''.obs; // 联系方式类型
  final contactTypeOptions = ['邮箱', 'QQ', '微信']; // 可选的联系方式类型

  var feedback = ''.obs;
  var label = ''.obs; // 当前选择的标签
  final labelOptions = ['建议', '出错', '求助']; // 标签选项

  var images = <XFile>[].obs;
  final isLoading = false.obs;
  GlobalKey formKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  // 联系方式类型映射表
  final Map<String, String> contactTypeKeyMap = {
    '手机号': 'mobile_phone',
    '邮箱': 'email',
    'QQ': 'qq',
    '微信': 'wechat',
  };

  // 获取英文形式的联系方式类型
  String getContactTypeKey(String type) {
    return contactTypeKeyMap[type] ?? 'unknown';
  }

  // 验证输入的联系方式是否符合对应类型
  bool isValidContact(String input, String type) {
    switch (type) {
      case '手机号':
        final RegExp phoneRegExp = RegExp(r'^\d{11}$');
        return phoneRegExp.hasMatch(input);
      case '邮箱':
        final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
        return emailRegExp.hasMatch(input);
      case 'QQ':
      // QQ号必须为5-10位纯数字，且首位不能为0
        final RegExp qqRegExp = RegExp(r'^[1-9][0-9]{4,9}$');
        return qqRegExp.hasMatch(input);
      case '微信':
      // 微信号可以是手机号或者符合微信号规则
        final RegExp phoneRegExp = RegExp(r'^\d{11}$');
        final RegExp weChatRegExp =
        RegExp(r'^[a-zA-Z]([-_a-zA-Z0-9]{5,19})$');
        return phoneRegExp.hasMatch(input) || weChatRegExp.hasMatch(input);
      default:
        return false;
    }
  }

  void pickImage() async {
    if (images.length < 10) {
      final pickedFile = await picker.pickMultiImage();
      if (pickedFile != null) {
        images.addAll(pickedFile);
      }
    } else {
      Get.snackbar('错误', '您只能上传最多10张图片。');
    }
  }

  void submitFeedback() async {
    try {
      final formState = formKey.currentState as FormState;
      if (!formState.validate()) {
        toastFailure(message: '请检查您的输入');
        return;
      }
      isLoading.value = true;
      final dio = AppNetwork.get().appDio;

      // 获取英文形式的联系方式类型
      final String contactTypeKey = getContactTypeKey(contactType.value);

      FormData formData = FormData.fromMap({
        'contact': contact.value,
        'contact_type': contactTypeKey,
        'label': label.value, // 提交标签
        'feedback': feedback.value,
      });
      for (int i = 0; i < images.length; i++) {
        formData.files.add(MapEntry(
          'pictures',
          await MultipartFile.fromFile(images[i].path,
              filename: images[i].name),
        ));
      }

      Response response = await dio.post(
        'app/feedback',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        toastSuccess(message: '反馈已成功提交');
      } else {
        toastFailure(message: '未能提交反馈', error: response.data);
      }
    } catch (e) {
      toastFailure(message: '未能提交反馈', error: e);
    } finally {
      isLoading.value = false;
    }
  }
}