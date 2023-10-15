import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:guettoolbox/data/repository/login.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:guettoolbox/util/ext.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_test/flutter_test.dart';

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

  static Future<CookieJar> getCookieJar() async {
    CookieJar cookieJar;
    if (!kIsWeb) {
      var dir = await getApplicationSupportDirectory();
      cookieJar =
          PersistCookieJar(storage: FileStorage(join(dir.path, "cookies")));
    } else {
      cookieJar = CookieJar();
    }
    return cookieJar;
  }

  static Future<Dio> setupUstcGuetDio(Dio dio, CookieJar cookieJar) async {
    dio.options = BaseOptions(
      baseUrl: "http://utsc.guet.edu.cn/",
      headers: {
        "User-Agent": userAgent,
        "Referer": "http://utsc.guet.edu.cn/EmptyClassRoom.aspx"
      },
      followRedirects: true,
      validateStatus: (int? status) => status != null,
    );
    dio.interceptors.add(CookieManager(cookieJar));
    // _proxy(dio);
    if (kDebugMode) {
      // setDioLogger(dio);
    }
    return dio;
  }

  static void setDioLogger(Dio dio) {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 200));
  }

  static Future<Dio> setupDio(Dio dio, CookieJar cookieJar) async {
    dio.options = BaseOptions(
      baseUrl: await baseUrl,
      headers: {"User-Agent": userAgent},
      followRedirects: false,
      validateStatus: (int? status) =>
          status != null && status >= 200 && status < 400,
    );
    dio.interceptors.add(BaseUrlInterceptor());
    dio.interceptors.add(CookieManager(cookieJar));
    // _proxy(dio);
    dio.interceptors.add(RefererInterceptor());
    if (kDebugMode) {
      setDioLogger(dio);
    }
    dio.interceptors.add(JsonpInterceptor());
    dio.interceptors.add(LoginInterceptor(dio));
    return dio;
  }

  static void _proxy(Dio dio) {
    if (!kReleaseMode &&
        (Platform.isWindows || Platform.isMacOS || Platform.isAndroid)) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          // 这里设置代理地址和端口号
          return "PROXY 192.168.1.5:18888";
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  static Future<String> get baseUrlAutoAdapt async {
    final isCampusNetwork =
        await NetworkDetectionRepository.get().isCampusNetwork;
    if (isCampusNetwork == true) return baseUrl;
    return Uri.parse(baseUrl).toWebVpnUrl().toString();
  }

  late Dio _dio;
  late Dio _dio1;
  late Dio _dio2;
  late Dio utscGuetDio;

  AppNetwork._create();

  static AppNetwork? _instance = null;

  static Future<Dio> getDio() async {
    var appNetwork = await getInstance();
    Dio dio = appNetwork.redirect2Dio;
    return dio;
  }

  factory AppNetwork.get() => _instance!;

  static Future<void> init({bool isTest = false}) async {
    await getInstance(isTest: isTest);
  }

  Dio get redirectDio => _dio;

  Dio get dio => _dio1;

  Dio get redirect2Dio => _dio2;

  late CookieJar cookieJar;

  static Future<AppNetwork> getInstance({bool isTest = false}) async {
    if (_instance == null) {
      _instance = AppNetwork._create();
      _instance!.cookieJar = !isTest ? await getCookieJar() : CookieJar();

      _instance!._dio = await setupDio(Dio(), _instance!.cookieJar);
      _instance!._dio.setFollowRedirects(true);

      _instance!._dio1 = await setupDio(Dio(), _instance!.cookieJar);
      _instance!._dio1.setFollowRedirects(false);

      _instance!.utscGuetDio =
          await setupUstcGuetDio(Dio(), _instance!.cookieJar);

      final dio2 = Dio();
      _instance!._dio2 = await setupDio(dio2, _instance!.cookieJar);
      _instance!._dio2.setFollowRedirects(false);
      _instance!._dio2.interceptors.add(RedirectInterceptor(dio2));
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
  static const String allowCheckingLogin = "allowCheckingLogin";

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final isAllowCheckingLogins =
        response.requestOptions.extra[allowCheckingLogin] as bool? ?? true;
    if (!isAllowCheckingLogins) {
      handler.next(response);
      return;
    }
    if (!_isRedirect(response.statusCode ?? 0)) return handler.next(response);
    var location = response.headers.value("location");
    if (location != null) {
      var uri = Uri.parse(location);
      var path = uri.path;
      if ((path.endsWith("/login") || path.endsWith("/Login")) &&
          (uri.query.isEmpty || uri.queryParameters["ReturnUrl"] != null)) {
        var user = await UserRepository.get().getActiveUser();
        var username = user?.username;
        var password = user?.password;
        if (username != null && password != null) {
          for (var i = 0; i < 2; i++) {
            try {
              print("正在登录");
              var success = await LoginRepository.get()
                  .loginAcademicAffairsSystem(username, password);
              if (!success) throw LogonFailedException("登录失败");
              await Future.delayed(Duration(milliseconds: 500));
              var newResp = await dio.fetch(response.requestOptions);
              final isJsonResponse = newResp.headers
                      .value("content-type")
                      ?.contains("application/json") ==
                  true;
              if (!isJsonResponse) {
                throw LogonFailedException("登录失败");
              }
              handler.resolve(newResp);
              return;
            } catch (e) {
              // if (/*i == 4 && */ AppRoute.currentPage != AppRoute.loginPage) {
              //   AppRoute.navigatorKey.currentState
              //       ?.pushNamed(AppRoute.loginPage, arguments: true);
              // }
            }
          }
        }
      }
    }

    handler.next(response);
  }

  bool _isRedirect(int statusCode) {
    return statusCode == 301 ||
        statusCode == 302 ||
        statusCode == 303 ||
        statusCode == 307 ||
        statusCode == 308;
  }

  final Dio dio;

  LoginInterceptor(this.dio);
}

class BaseUrlInterceptor extends Interceptor {
  final hosts = ["bkjw.guet.edu.cn"];

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (hosts.contains(options.uri.host)) {
      final isCampusNetwork =
          await NetworkDetectionRepository.get().isCampusNetwork;
      if (isCampusNetwork != true) {
        final newOptions = options.copyWith(
            baseUrl: Uri.parse(options.baseUrl).toWebVpnUrl().toString());
        handler.next(newOptions);
        return;
      }
    }
    handler.next(options);
  }
}

class RefererInterceptor extends Interceptor {
  String? referer = null;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (referer != null) {
      referer = await AppNetwork.baseUrlAutoAdapt;
    }
    options.headers.addAll({"Referer": await AppNetwork.baseUrlAutoAdapt});
    referer = options.uri.scheme + "://" + options.uri.path;
    handler.next(options);
  }
}

/// options: Options(extra: {JsonpInterceptor.UseJsonpParser: true})
class JsonpInterceptor extends Interceptor {
  static const String UseJsonpParser = "use_jsonp_parser";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final useJsonpParser = options.extra[UseJsonpParser] as bool? ?? false;
    if (useJsonpParser) {
      options.responseType = ResponseType.plain;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final useJsonpParser =
        response.requestOptions.extra[UseJsonpParser] as bool? ?? false;
    if (useJsonpParser) {
      response.data = json.decode(_removeJsonpWrapper(response.data));
    }
    handler.next(response);
  }

  String _removeJsonpWrapper(String jsonp) {
    int functionStart = jsonp.indexOf('(') + 1;
    int functionEnd = jsonp.lastIndexOf(')');
    String jsonString = jsonp.substring(functionStart, functionEnd);
    return jsonString;
  }
}

typedef RedirectCallback = bool Function(
    Response response, ResponseInterceptorHandler handler);

class RedirectInterceptor extends Interceptor {
  final Dio _dio;
  RedirectCallback? _redirectCallback;
  static const String followRedirects = "followRedirects";
  static const String rawUri = "rawUri";
  static const String redirectCount = "redirectCount";

  RedirectInterceptor(this._dio, {RedirectCallback? onRedirect})
      : _redirectCallback = onRedirect;

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final isFollowRedirects =
        response.requestOptions.extra[followRedirects] as bool? ?? true;
    if (!isFollowRedirects) {
      handler.next(response);
      return;
    }

    final rawUriValue = response.requestOptions.extra[rawUri] as Uri?;
    if (rawUriValue == null) {
      response.requestOptions.extra[rawUri] = response.requestOptions.uri;
    }

    if (_isRedirect(response.statusCode ?? 0)) {
      try {
        final redirectCountValue =
            response.requestOptions.extra[redirectCount] ?? 0;
        if (redirectCountValue >= 20) {
          handler.next(response);
          return;
        }
        if (_redirectCallback != null &&
            !_redirectCallback!.call(response, handler)) {
          return;
        }
        final location = response.headers.value('location');
        if (location == null) throw Exception("Redirect location is null");
        final requestOptions = response.requestOptions;
        final rawUri = requestOptions.uri.toString();
        final newUri = Uri.parse(_parseHttpLocation(rawUri, location));
        response.requestOptions.extra[redirectCount] = redirectCountValue + 1;

        final option = Options(
          sendTimeout: requestOptions.sendTimeout,
          receiveTimeout: requestOptions.receiveTimeout,
          extra: requestOptions.extra,
          headers: requestOptions.headers,
          responseType: requestOptions.responseType,
          contentType: requestOptions.contentType,
          validateStatus: requestOptions.validateStatus,
          receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
          followRedirects: requestOptions.followRedirects,
          maxRedirects: requestOptions.maxRedirects,
          persistentConnection: requestOptions.persistentConnection,
          requestEncoder: requestOptions.requestEncoder,
          responseDecoder: requestOptions.responseDecoder,
          listFormat: requestOptions.listFormat,
        );

        final redirectResponse = await _dio.getUri(
          newUri,
          options: option,
        );
        return handler.next(redirectResponse);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }
    return handler.next(response);
  }

  bool _isRedirect(int statusCode) {
    return statusCode == 301 ||
        statusCode == 302 ||
        statusCode == 303 ||
        statusCode == 307 ||
        statusCode == 308;
  }

  String _parseHttpLocation(final String rawUri, final String location) {
    var location1 = location;
    String uri;
    if (!location1.contains("://")) {
      final schemaEndIndex = rawUri.indexOf("://") + 3;
      var index = location1.startsWith("/")
          ? rawUri.indexOf("/", schemaEndIndex)
          : rawUri.substring(schemaEndIndex).lastIndexOf("/") + schemaEndIndex;
      if (index == -1) index = rawUri.length - 1;
      var baseUrl = rawUri.substring(0, index + 1);
      if (baseUrl.endsWith("/")) {
        baseUrl = baseUrl.substring(0, baseUrl.length - 1);
      }
      if (location1.startsWith("/")) {
        location1 = location1.substring(1);
      }
      uri = baseUrl + "/" + location1;
    } else {
      uri = location1;
    }
    return uri;
  }
}
