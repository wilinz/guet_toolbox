import 'dart:convert';

import 'package:guethub/data/model/background_image/background_image.dart';
import 'package:guethub/data/repository/settings.dart';
import 'package:kt_dart/standard.dart';
import 'package:rxdart/rxdart.dart';

class BackgroundImageRepository {
  static const String backgroundImageInfoKey = 'backgroundImageInfo';

  BehaviorSubject<BackgroundImageInfo?> _backgroundImageInfoController =
      BehaviorSubject<BackgroundImageInfo?>();

  ValueStream<BackgroundImageInfo?> get backgroundImageInfoListener =>
      _backgroundImageInfoController.stream;

  void setBackgroundImageInfo(BackgroundImageInfo? info) {
    _backgroundImageInfoController.add(info);
  }

  Future<String?> get backgroundImageInfo async {
    final _box = (await SettingsRepository.get()).settingsStorage;
    return _box.read(backgroundImageInfoKey);
  }

  Future<void> init() async {
    final _box = (await SettingsRepository.get()).settingsStorage;
    final String? backgroundImageInfo = _box.read(backgroundImageInfoKey);
    final BackgroundImageInfo? info = backgroundImageInfo
        ?.let((it) => BackgroundImageInfo.fromJson(jsonDecode(it)));
    final imagePath = info?.path;
    if (imagePath != null && !imagePath.startsWith("background-image/")) {
      final index = imagePath.indexOf("background-image/");
      info?.path = imagePath.substring(index);
      _box.write(backgroundImageInfoKey, jsonEncode(info));
    }
    _backgroundImageInfoController.add(info);
  }

  BackgroundImageRepository._();

  static BackgroundImageRepository? _instance = null;

  factory BackgroundImageRepository.get() {
    return _instance ??= BackgroundImageRepository._();
  }
}
