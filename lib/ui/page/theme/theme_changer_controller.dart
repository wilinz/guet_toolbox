import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:guethub/data/model/background_image/background_image.dart';
import 'package:guethub/data/repository/background_image.dart';
import 'package:guethub/data/repository/settings.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/path.dart';
import 'package:guethub/ui/page/theme/crop.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kt_dart/standard.dart';
import 'package:path/path.dart';

class ThemeController extends GetxController {
  late GetStorage _box;
  static const String themeModeKey = 'themeMode';
  static const String lightColorKey = 'lightPrimaryColor';
  static const String darkColorKey = 'darkPrimaryColor';

  String get backgroundImageInfoKey =>
      BackgroundImageRepository.backgroundImageInfoKey;

  final backgroundImage = Rx<XFile?>(null);
  final lastBackgroundImage = Rxn<XFile>();

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  Rx<Color> lightPrimaryColor = Colors.blue.shade400.obs;
  Rx<Color> darkPrimaryColor = Colors.blue.shade700.obs;

  late Rx<ThemeData?> theme = Rx(null);

  ThemeData getTheme({Brightness brightness = Brightness.light}) =>
      ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
            seedColor: brightness == Brightness.light
                ? lightPrimaryColor.value
                : darkPrimaryColor.value,
            brightness: brightness,
            primary: brightness == Brightness.light
                ? lightPrimaryColor.value
                : darkPrimaryColor.value),
      );

  @override
  Future<void> onInit() async {
    super.onInit();
    await initializeTheme();
  }

  Future<void> clearCacheFile() async {
    final currentInfo =
        BackgroundImageRepository.get().backgroundImageInfoListener.valueOrNull;
    final backgroundImagePath = join(
        applicationSupportDirectory.path, currentInfo?.path);
    if (backgroundImagePath != backgroundImage.value?.path) {
      backgroundImage.value?.path.let((it) async {
        await File(it).delete();
      });
      backgroundImage.value = null;
    }
  }

  Future<void> initializeTheme() async {
    _box = (await SettingsRepository.get()).settingsStorage;
    themeMode.value = _themeModeFromString(_box.read(themeModeKey) ?? 'system');
    lightPrimaryColor.value =
        Color(_box.read(lightColorKey) ?? Colors.blue.shade400.value);
    darkPrimaryColor.value =
        Color(_box.read(darkColorKey) ?? Colors.blue.shade700.value);

    final String? infoJson = _box.read(backgroundImageInfoKey);
    infoJson?.let((it) {
      final info = BackgroundImageInfo.fromJson(jsonDecode(it));
      backgroundImage.value = XFile(join(applicationSupportDirectory.path,info.path));
      lastBackgroundImage.value = backgroundImage.value;
    });
    Get.changeThemeMode(themeMode.value);
    theme.value = _getTheme(themeMode.value);
    Get.changeTheme(theme.value!);
    Get.forceAppUpdate();
  }

  void changeThemeMode(ThemeMode themeMode) {
    this.themeMode.value = themeMode;
    Get.changeThemeMode(themeMode);

    theme.value = _getTheme(themeMode);
    Get.changeTheme(theme.value!);
    _saveThemeMode();
    Get.forceAppUpdate();
  }

  void changeLightPrimaryColor(Color color) {
    lightPrimaryColor.value = color;
    theme.value = _getTheme(themeMode.value);
    Get.changeTheme(theme.value!);
    _saveLightColor();
    Get.forceAppUpdate();
  }

  void changeDarkPrimaryColor(Color color) {
    darkPrimaryColor.value = color;
    theme.value = _getTheme(themeMode.value);
    Get.changeTheme(theme.value!);
    _saveDarkColor();
    Get.forceAppUpdate();
  }

  Future<void> changeThemeToImageBackground() async {
    try {
      final relativePath = join("background-image",
          "${DateTime.timestamp().millisecondsSinceEpoch}.jpg");
      final newFile = File(join(
        applicationSupportDirectory.path,
        relativePath
      ));

      final parent = newFile.parent;

      await deleteLastFile();

      if (!(await parent.exists())) {
        await parent.create(recursive: true);
      }

      File(backgroundImage.value!.path).rename(newFile.path);
      backgroundImage.value = XFile(newFile.path);
      lastBackgroundImage.value = backgroundImage.value;

      final backgroundImageInfo =
          BackgroundImageInfo(path: relativePath, enable: true);
      _box.write(backgroundImageInfoKey, jsonEncode(backgroundImageInfo));
      BackgroundImageRepository.get()
          .setBackgroundImageInfo(backgroundImageInfo);
      toastSuccess0("设置背景图片成功");
    } catch (e) {
      logger.e(e);
      toastFailure0("设置背景图片失败", error: e);
    }
  }

  Future<void> deleteLastFile() async {
    try {
      final lastFile = lastBackgroundImage.value;
      if (lastFile != null) {
        await File(lastFile.path).delete();
      }
    } catch (e) {
      logger.e(e);
    }
  }

  void _saveThemeMode() {
    _box.write(themeModeKey, themeMode.value.toString().split('.').last);
  }

  void _saveLightColor() {
    _box.write(lightColorKey, lightPrimaryColor.value.value);
  }

  void _saveDarkColor() {
    _box.write(darkColorKey, darkPrimaryColor.value.value);
  }

  ThemeData _getTheme(ThemeMode themeMode) {
    return getTheme(
        brightness:
            themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);
  }

  pickBackgroundImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final String result =
          await Get.to<dynamic>(CropImagePage(imagePath: image.path)) as String;
      logger.d("result:${result}");
      backgroundImage(XFile(result));
      logger.d(image.path);
    }
  }

  cancelBackgroundImageToNull() async {
    try {
      deleteLastFile();
      File(backgroundImage.value!.path).delete();
    } catch (e) {
      logger.e(e);
    }
    backgroundImage.value = null;
    _box.write(BackgroundImageRepository.backgroundImageInfoKey, null);
    BackgroundImageRepository.get().setBackgroundImageInfo(null);
    toastSuccess0("取消背景图片成功");
  }

  ThemeMode _themeModeFromString(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
