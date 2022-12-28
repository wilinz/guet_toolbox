import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_proxy_plugin/dio_proxy_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:guettoolbox/util/ext.dart';
import 'package:path_provider/path_provider.dart';

class AppNetwork {
  static const String baseUrl = "https://bkjw.guet.edu.cn/";
  static const String webVpnUrl = "https://v.guet.edu.cn/";
  static const String typeUrlEncode = "application/x-www-form-urlencoded";
  static const String userAgent =
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36";
  static final String baseUrlInWebVpn =
      Uri.parse(baseUrl).toWebVpnUrl().toString();
  late Dio dio;

  AppNetwork._create() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrlInWebVpn, headers: {"User-Agent": userAgent}));
    getApplicationSupportDirectory().then((value) {
      var cookieJar =
          PersistCookieJar(storage: FileStorage(value.path + "/cookies"));
      dio.interceptors.add(CookieManager(cookieJar));
    });
    // dio.interceptors.add(Interceptor{})
    if (!kReleaseMode) {
      //获取系统代理
      //设置dio proxy
      var httpProxyAdapter = HttpProxyAdapter(ipAddr: "127.0.0.1", port: 8888);
      // dio.httpClientAdapter = httpProxyAdapter;
    }
    dio.interceptors.add(MyInterceptor());
  }

  static final _instance = AppNetwork._create();

  factory AppNetwork() => _instance;
}

class LoginInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Location: /login
    if (response.headers.value("Location") == "/login") {
      // Navigator
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}
}

class MyInterceptor extends Interceptor {
  String? referer = null;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (referer != null) {
      options.headers.addAll({"Referer": AppNetwork.baseUrlInWebVpn});
    }
    referer = options.uri.scheme + "://" + options.uri.path;
    handler.next(options);
  }
}
