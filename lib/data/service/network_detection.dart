
import '../network.dart';

class NetworkDetectionService{
  static Future<bool> isCampusNetwork() async {
    final dio = await AppNetwork.getDio();
    dio.options.validateStatus = (int? status) => status != null;
    final resp = await dio.get("https://bkjw.guet.edu.cn/");
    return resp.statusCode != 403;
  }
}