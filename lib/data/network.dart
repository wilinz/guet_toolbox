import 'dart:html';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class AppNetwork {
  var baseUrl = "";
  var webVpnUrl = "";
  var dio = Dio();
  var typeUrlEncode = "application/x-www-form-urlencoded";

  AppNetwork._create() {
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
  }

  static final _instance = AppNetwork._create();

  factory AppNetwork() => _instance;
}
