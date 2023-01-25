import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_proxy_plugin/dio_proxy_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/repository/login.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:guettoolbox/main.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:guettoolbox/util/ext.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DioExt on Dio {
  Dio setFollowRedirects(bool followRedirects) {
    options.followRedirects = followRedirects;
    if (followRedirects) {
      options.validateStatus =
          (int? status) => status != null && status >= 200 && status < 300;
    } else {
      options.validateStatus =
          (int? status) => status != null && status >= 200 && status < 400;
    }
    return this;
  }
}

class AppNetwork {
  static const String baseUrl = "https://bkjw.guet.edu.cn/";
  static const String webVpnUrl = "https://v.guet.edu.cn/";
  static const String typeUrlEncode = "application/x-www-form-urlencoded";
  static const String userAgent =
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36";
  static final String baseUrlInWebVpn =
      Uri.parse(baseUrl).toWebVpnUrl().toString();
  late Dio _dio;

  AppNetwork._create();

  static AppNetwork? _instance = null;

  static Future<Dio> getDio({bool followRedirects = false}) async {
    var appNetwork = await getInstance();
    return followRedirects ? appNetwork.redirectDio : appNetwork.dio;
  }

  get redirectDio => _dio.setFollowRedirects(true);

  get dio => _dio.setFollowRedirects(false);

  late CookieJar cookieJar;

  static Future<AppNetwork> getInstance() async {
    if (_instance == null) {
      var dio = Dio(BaseOptions(
        baseUrl: baseUrlInWebVpn,
        headers: {"User-Agent": userAgent},
        followRedirects: false,
        validateStatus: (int? status) =>
            status != null && status >= 200 && status < 400,
      ));
      CookieJar cookieJar;
      if (!kIsWeb) {
        var dir = await getApplicationSupportDirectory();
        cookieJar =
            PersistCookieJar(storage: FileStorage(join(dir.path, "cookies")));
      } else {
        cookieJar = CookieJar();
      }

      dio.interceptors.add(CookieManager(cookieJar));
      if (!kReleaseMode) {
        //获取系统代理
        //设置dio proxy
        var httpProxyAdapter =
            HttpProxyAdapter(ipAddr: "127.0.0.1", port: 8888);
        // dio.httpClientAdapter = httpProxyAdapter;
      }
      dio.interceptors.add(MyInterceptor());
      dio.interceptors.add(LoginInterceptor(dio));
      dio.interceptors.add(dioLoggerInterceptor);
      _instance = AppNetwork._create();
      _instance!._dio = dio;
      _instance!.cookieJar = cookieJar;
    }
    return Future(() => _instance!);
  }
}

class UnauthorizedException implements Exception {
  final String msg;

  UnauthorizedException(this.msg);

  @override
  String toString() => msg;
}

class LoginInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    var newResp = await _onResponse(response, handler);
    handler.next(newResp);
    // if (response.headers.value("Location") == "/login") {
    //   handler.reject(DioError(
    //       requestOptions: response.requestOptions, error: UnauthorizedException("请登录")));
    // }
    // handler.next(response);
  }

  Future<Response> _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // Location: /login
    print(jsonEncode(response.data));
    var h = response.headers.value("location");
    final contentType = response.headers.value("content-type");
    print("content-type: $contentType");
    print("head: ${h}");
    if (h != null) {
      var uri = Uri.parse(h);
      var path = uri.path;
      if ((path.endsWith("/login") || path.endsWith("/Login")) &&
          (uri.query.isEmpty || uri.queryParameters["ReturnUrl"] != null)) {
        var sp = await SharedPreferences.getInstance();
        var username = sp.getString(AppKey.username);
        var password = sp.getString(AppKey.password);
        if (username != null && password != null) {
          for (var i = 0; i < 5; i++) {
            try {
              var success = await LoginRepository()
                  .loginAcademicAffairsSystem(username, password);
              if (!success) throw LogonFailedException("登录失败");
              await Future.delayed(Duration(milliseconds: 500));
              var newResp = await dio
                  .setFollowRedirects(false)
                  .fetch(response.requestOptions);
              if (newResp.headers
                      .value("content-type")
                      ?.contains("application/json") !=
                  true) {
                throw LogonFailedException("登录失败");
              }
              return newResp;
            } catch (e) {
              print(e);
              if (i == 4 && AppRoute.currentPage != AppRoute.loginPage) {
                AppRoute.navigatorKey.currentState
                    ?.pushNamed(AppRoute.loginPage);
              }
            }
          }
        }
      }
    }

    return response;
  }

  final Dio dio;

  LoginInterceptor(this.dio);
}

class MyInterceptor extends Interceptor {
  String? referer = null;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (referer != null) {
      referer = AppNetwork.baseUrlInWebVpn;
    }
    options.headers.addAll({"Referer": AppNetwork.baseUrlInWebVpn});
    referer = options.uri.scheme + "://" + options.uri.path;
    handler.next(options);
  }
}
