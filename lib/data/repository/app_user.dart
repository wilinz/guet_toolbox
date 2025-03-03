import 'dart:typed_data';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:guethub/data/model/app/upload_pictures_response/upload_pictures_response.dart';
import 'package:guethub/data/model/app/user/app_user.dart';
import 'package:guethub/data/model/app/user/login_response/login_response.dart';
import 'package:guethub/data/model/app/user/user_profile_response/user_profile_response.dart';
import 'package:guethub/data/model/common/common_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/repository/app/upload.dart';
import 'package:guethub/logger.dart';
import '../database/database.dart';

class AppUserRepository {
  Future<AppUser?> getRecentAppUser() async {
    final db = appDatabase;
    final AppUser = await db.appUserDao.getRecent();
    return AppUser.firstOrNull;
  }

  Stream<AppUser?> getRecentAppUserStream() {
    final db = appDatabase;
    final AppUser = db.appUserDao.getRecentStream();
    return AppUser.map((e) => e.firstOrNull);
  }

  Stream<AppUser?> getActiveAppUserStream() {
    final db = appDatabase;
    final AppUser = db.appUserDao.getActiveStream();
    return AppUser;
  }

  Future<void> login(String username, LoginResult loginResult) async {
    final db = await getDatabase();
    var user = await db.appUserDao.get(username);
    if (user != null) {
      user.isActive = true;
      db.appUserDao.offlineOtherUser(username);
      db.appUserDao.updateUser(user);
    } else {
      user = AppUser(
          id: loginResult.userId.toIntOrNull()!,
          updateTime: DateTime.now(),
          username: username,
          password: "",
          isActive: true);
      db.appUserDao.offlineOtherUser(username);
      db.appUserDao.insertUser(user);
    }
  }

  Future<dynamic> logout() async {
    final resp = await AppNetwork.get().appDio.delete("/account/logout");
    logger.d(resp.data['code'] == 200);
    if (resp.data['code'] == 200) {
      appDatabase.appUserDao.offlineCurrent();
      // final AppUser = await appDatabase.appUserDao.getActive();
      // if (AppUser != null) {
      //   AppUser.isActive = false;
      //   appDatabase.appUserDao.updateAppUser(AppUser);
      // }
    }
    return resp.data;
  }

  Future<AppUser?> getActiveAppUser() async {
    final db = await getDatabase();
    return db.appUserDao.getActive();
  }

  Future<UserProfileResponse> getUserProfile() async {
    final resp = await AppNetwork.get().appDio.get("account/user_profile");
    return UserProfileResponse.fromJson(resp.data);
  }

  Future<CommonResponse> updateUserProfile(UserProfile profile) async {
    final resp = await AppNetwork.get()
        .appDio
        .put("account/user_profile", data: profile.toJson());
    return CommonResponse.fromJson(resp.data);
  }

  Future<UploadPicturesResponse> uploadUserAvatar(Uint8List bytesImage) async =>
      UploadRepository.get()
          .uploadPictures(bytesImages: [bytesImage], category: 'user-avatar');

  AppUserRepository._create();

  static AppUserRepository? _instance;

  factory AppUserRepository.get() => _instance ??= AppUserRepository._create();
}
