import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guethub/data/repository/log_upload.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:kt_dart/kt.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/v4.dart';

extension LocaleExtensions on Locale {
  String toLocaleCode() {
    String languageCode = this.languageCode;
    String countryCode = this.countryCode ?? "";
    return "${languageCode}_$countryCode";
  }

  static Locale? LocaleFromCode(String? code) {
    if (code == null) return null;
    final localeParts = code.split('_');
    if (localeParts.length == 2) {
      return Locale(localeParts[0], localeParts[1]);
    }
    return null;
  }
}

class SettingsKeys {
  static const themeKey = 'theme';
  static const languageKey = 'language';
  static const debugModeKey = 'debug_mode';
  static const debugDeviceIdKey = 'debug_device_id';
  static const lastChangeDebugModeUnixTimestampKey =
      'last_change_debug_mode_unix_timestamp';
}

class SettingsController extends GetxController {
  final GetStorage _storage;
  final _themeKey = SettingsKeys.themeKey;
  final _languageKey = SettingsKeys.languageKey;
  final _debugModeKey = SettingsKeys.debugModeKey;

  final isDebugMode = false.obs;

  final RxInt tapCount = 0.obs;
  var themeMode = ThemeMode.system.obs;
  var locale = LocaleExtensions.LocaleFromCode(null).obs;
  final debugDeviceId = RxnString("");
  final isLogUploading = false.obs;

  SettingsController(this._storage);

  @override
  void onInit() {
    super.onInit();
    // 从存储中加载主题设置和语言设置
    _storage.read<int?>(_themeKey)?.let((it) {
      themeMode.value = ThemeMode.values[it];
    });

    _storage.read<bool?>(_debugModeKey)?.let((it) {
      isDebugMode(it);
    });

    _storage.read<String?>(SettingsKeys.debugDeviceIdKey)?.let((it) {
      debugDeviceId(it);
    });

    LocaleExtensions.LocaleFromCode(_storage.read(_languageKey))
        ?.let((it) => locale.value = it);
  }

  void setDebugMode(bool isDebug) {
    _storage.write(_debugModeKey, isDebug);
    _storage.write(SettingsKeys.lastChangeDebugModeUnixTimestampKey,
        DateTime.now().millisecondsSinceEpoch);
    isDebugMode(isDebug);
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
    // Get.changeThemeMode(option);
    // 将主题设置保存到存储中
    _storage.write(_themeKey, mode.index);
  }

  void changeLanguage(String? newLocale) {
    locale.value = LocaleExtensions.LocaleFromCode(newLocale);
    if (newLocale != null) {
      Get.updateLocale(locale.value!);
    } else {
      Get.deviceLocale?.let((it) => Get.updateLocale(it));
    }
    // 将语言设置保存到存储中
    _storage.write(_languageKey, locale.value?.toLocaleCode());
  }

  Future<void> uploadLogs() async {
    isLogUploading(true);
    try {
      toast("正在上传日志");
      String debugDeviceId = _storage.read(SettingsKeys.debugDeviceIdKey);
      final dir = await getApplicationSupportDirectory();
      var file = File(join(dir.path, 'app.log'));
      final resp = await LogUploadRepository.get().uploadLog(debugDeviceId, file);
      if(resp.success) {
        toast("上传日志成功");
      }else {
        toastFailure0("上传日志失败", error: resp.msg);
      }
    } catch (e) {
      logger.e(e);
      toastFailure0("上传日志失败", error: e);
    } finally {
      isLogUploading(false);
    }
  }

  Future<void> resetLogs() async {
    try {
      // Get the application support directory
      final dir = await getApplicationSupportDirectory();

      // Define the path to the log file
      var file = File(join(dir.path, 'app.log'));

      // Check if the file exists before attempting to clear it
      if (await file.exists()) {
        // Write an empty string to the file to reset it
        await file.writeAsString("", mode: FileMode.write, flush: true);
        toastSuccess0("成功");
      } else {
        toastFailure0("未找到日志文件");
      }
    } catch (e) {
      toastFailure0("失败", error: e);
    }
  }

}
