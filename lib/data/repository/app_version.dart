import 'dart:io';

import 'package:guethub/data/model/app/app_version/app_version.dart';
import 'package:guethub/data/network.dart';

class AppRepository {
  Future<AppVersionResponse> getAppVersion() async {
    final response = await AppNetwork.get().appDio.get("/app/app_version",
        queryParameters: {
          "appid": "com.wilinz.guethub",
          "platform": Platform.operatingSystem.toLowerCase()
        });
    return AppVersionResponse.fromJson(response.data);
  }

  AppRepository._create();

  static AppRepository? _instance;

  factory AppRepository.get() => _instance ??= AppRepository._create();
}
