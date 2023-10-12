import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kt_dart/kt.dart';

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

class SettingsController extends GetxController {
  final GetStorage _storage;
  final _themeKey = 'theme';
  final _languageKey = 'language';

  var themeMode = ThemeMode.system.obs;
  var locale = LocaleExtensions.LocaleFromCode(null).obs;

  SettingsController(this._storage);

  @override
  void onInit() {
    super.onInit();
    // 从存储中加载主题设置和语言设置
    _storage.read<int?>(_themeKey)?.let((it) {
      themeMode.value = ThemeMode.values[it];
    });

    LocaleExtensions.LocaleFromCode(_storage.read(_languageKey))
        ?.let((it) => locale.value = it);
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
}
