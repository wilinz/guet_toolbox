import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:guettoolbox/util/ext.dart';
import 'package:path_provider/path_provider.dart';

class AppNetwork {
  static const String baseUrl = "https://bkjw.guet.edu.cn/";
  static const String webVpnUrl = "https://v.guet.edu.cn/";
  static const String typeUrlEncode = "application/x-www-form-urlencoded";
  static final String baseUrlInWebVpn =
      Uri.parse(baseUrl).toWebVpnUrl().toString();
  late Dio dio;

  AppNetwork._create() {
    dio = Dio(BaseOptions(baseUrl: baseUrlInWebVpn));
    getApplicationSupportDirectory().then((value) {
      var cookieJar =
          PersistCookieJar(storage: FileStorage(value.path + "/cookies"));
      dio.interceptors.add(CookieManager(cookieJar));
    });
  }

  static final _instance = AppNetwork._create();

  factory AppNetwork() => _instance;
}
