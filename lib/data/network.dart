import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_proxy_plugin/dio_proxy_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/repository/login.dart';
import 'package:guettoolbox/ui/route.dart';
import 'package:guettoolbox/util/ext.dart';
import 'package:logger/logger.dart';
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

  static Future<AppNetwork> getInstance() async {
    if (_instance == null) {
      final option = BaseOptions(
        baseUrl: baseUrlInWebVpn,
        headers: {"User-Agent": userAgent},
        followRedirects: false,
        validateStatus: (int? status) =>
            status != null && status >= 200 && status < 400,
      );
      Dio dio;
      if (kIsWeb) {
        dio = DioForBrowser(option);
        var adapter = BrowserHttpClientAdapter();
        // This property will automatically set cookies
        adapter.withCredentials = true;
        dio.httpClientAdapter = adapter;
      } else {
        dio = Dio(option);
        var dir = await getApplicationSupportDirectory();
        final cookieJar =
        PersistCookieJar(storage: FileStorage(join(dir.path, "cookies")));
        dio.interceptors.add(CookieManager(cookieJar));
      }

      if (!kReleaseMode) {
        //获取系统代理
        //设置dio proxy
        var httpProxyAdapter =
            HttpProxyAdapter(ipAddr: "127.0.0.1", port: 8888);
        // dio.httpClientAdapter = httpProxyAdapter;
      }
      dio.interceptors.add(MyInterceptor());
      if (kIsWeb) {
        dio.interceptors.add(WebProxyInterceptor());
      }
      dio.interceptors.add(LoginInterceptor(dio));
      dio.interceptors.add(dioLoggerInterceptor);
      _instance = AppNetwork._create();
      _instance!._dio = dio;
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

class WebProxyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kIsWeb) {
      final newOption = options.copyWith(baseUrl: "http://127.0.0.1:9999/");
      newOption.path = "/proxy";
      newOption
        ..queryParameters.clear()
        ..queryParameters["url"] = options.uri.toString();
      _replaceHeader(newOption, ["Referer", "User-Agent"]);
      handler.next(newOption);
      return;
    }
    handler.next(options);
  }

  void _replaceHeader(RequestOptions newOption, List<String> keys) {
    keys.forEach((key) {
      var referer = newOption.headers[key];
      Logger().d(referer);
      if (referer != null) {
        newOption.headers["X-$key"] = referer.toString();
        newOption.headers.remove(key);
      }
    });
  }
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
    var h = response.headers.value("Location");
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
          try {
            var login = await LoginRepository()
                .loginAcademicAffairsSystem(username, password);
            var newResp = await dio
                .setFollowRedirects(false)
                .fetch(response.requestOptions);
            return newResp;
          } catch (e) {
            print(e);
            if (AppRoute.currentPage != AppRoute.loginPage) {
              AppRoute.navigatorKey.currentState?.pushNamed(AppRoute.loginPage);
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
