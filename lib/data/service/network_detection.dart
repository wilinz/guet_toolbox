import 'package:dio/dio.dart';

import '../network.dart';

class NetworkDetectionService {
  static Future<bool> isCampusNetwork() async {
    final dio = Dio();
    dio.options.validateStatus = (int? status) => status != null;
    try {
      final resp1 = await dio.get<String>("http://10.0.1.5/",
          options: Options(
              sendTimeout: Duration(seconds: 5),
              receiveTimeout: Duration(seconds: 5)));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
    // return resp.statusCode != 403;
  }
}
