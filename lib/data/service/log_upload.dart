import 'dart:io';

import 'package:dio/dio.dart';
import 'package:guethub/data/model/app/app_common_response/app_common_response.dart';
import 'package:guethub/logger.dart';

class LogUploadService {
  static Future<AppCommonResponse> uploadLog(Dio dio, String deviceId, MultipartFile file) async {
    final formData = FormData.fromMap({
      'file': file,
      'device_id': deviceId,
      'operating_system': Platform.operatingSystem,
      'operating_system_version': Platform.operatingSystemVersion
    });

    final resp = await dio.post(
      'log/upload',
      data: formData,
    );
    return AppCommonResponse.fromJson(resp.data);
  }
}
