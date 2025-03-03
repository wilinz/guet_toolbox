import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:guethub/data/repository/app_user.dart';
import 'package:guethub/data/model/app/user/user_profile_response/user_profile_response.dart';

import 'package:intl/intl.dart';
import 'package:kt_dart/standard.dart';

import 'crop_image_screen.dart';import 'package:guethub/logger.dart';

class UserProfileController extends GetxController {
  var userProfile = Rxn<UserProfile>();
  var isLoading = true.obs;
  final isLoadFailed = true.obs;
  final ImagePicker _picker = ImagePicker();
  final imageBaseUrl = AppNetwork.appOSSBaseUrl;
  final _datetimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      await loadUserProfile();
    } catch (e) {
      logger.e(e);
    }
  }

  String? reformatDateTime(String? dateTime) {
    if (dateTime == null) return null;
    return DateTime.tryParse(dateTime)
        ?.toLocal()
        .let((it) => _datetimeFormat.format(it));
  }

  Future<void> loadUserProfile() async {
    try {
      isLoading(true);
      final profile = await AppUserRepository.get().getUserProfile();
      if (profile.success) {
        userProfile.value = profile.data;
        isLoadFailed.value = false;
      } else {
        isLoadFailed.value = true;
        toastFailure0("加载失败", error: profile.msg);
      }
    } catch (e) {
      isLoadFailed.value = true;
      toastFailure0("加载失败", error: e);
    } finally {
      isLoading(false);
    }
  }

  void updateNickname(String newNickname) {
    final updatedProfile = userProfile.value!.copyWith(nickname: newNickname);
    saveUserProfile(updatedProfile);
  }

  Future<void> pickNewAvatar() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final cropImage =
          await Get.to(() => CropImageScreen(imagePath: pickedFile.path));
      _uploadCroppedAvatar(cropImage);
    }
  }

  Future<void> _uploadCroppedAvatar(Uint8List croppedImage) async {
    try {
      // 假设上传新头像并获取新头像的URL
      final newAvatarUrlResp =
          await AppUserRepository.get().uploadUserAvatar(croppedImage);
      if (newAvatarUrlResp.success) {
        final updatedProfile =
            userProfile.value!.copyWith(avatar: newAvatarUrlResp.data.first);
        saveUserProfile(updatedProfile);
        toastSuccess0("更新头像成功");
      } else {
        toastFailure0("更新头像失败", error: newAvatarUrlResp.msg);
      }
    } catch (e) {
      toastFailure0("更新头像失败", error: e);
      logger.e(e);
    }
  }

  Future<void> saveUserProfile(UserProfile updatedProfile) async {
    try {
      isLoading(true);
      // 调用保存用户资料的API
      final result =
          await AppUserRepository.get().updateUserProfile(updatedProfile);
      if (result.success) {
        // 成功后更新本地数据
        userProfile(updatedProfile);
        toastSuccess0("更新用户资料成功");
      } else {
        toastFailure0("更新用户资料失败", error: result.msg);
      }
    } catch (e) {
      toastFailure0("更新用户资料失败", error: e);
    } finally {
      isLoading(false);
    }
  }
}
