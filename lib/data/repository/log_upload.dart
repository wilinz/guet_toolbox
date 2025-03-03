import 'dart:io';

import 'package:dio/dio.dart';
import 'package:guethub/data/model/app/app_common_response/app_common_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/service/log_upload.dart';

class LogUploadRepository {
  Future<AppCommonResponse> uploadLog(String deviceId, File file) async {
    final copiedFile = await file.copy(file.path + ".copy.log");
    final mFile = await MultipartFile.fromFile(copiedFile.path);
    return LogUploadService.uploadLog(AppNetwork.get().appDio, deviceId, mFile);
  }

  LogUploadRepository._create();

  static LogUploadRepository? _instance;

  factory LogUploadRepository.get() =>
      _instance ??= LogUploadRepository._create();
}
