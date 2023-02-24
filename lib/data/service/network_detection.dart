
import 'package:dio/dio.dart';

import '../network.dart';

class NetworkDetectionService{
  static Future<bool> isCampusNetwork() async {
    final dio = Dio();
    dio.options.validateStatus = (int? status) => status != null;
    final resp = await dio.get("https://bkjw.guet.edu.cn/");
    return resp.statusCode != 403;
  }
}