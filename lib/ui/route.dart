import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/ui/page/login/login.dart';
import 'package:guettoolbox/ui/page/main/main.dart';
import 'package:guettoolbox/ui/page/splash/splash.dart';

class AppRoute {
  static const String loginPage = "loginPage";

  static const String splashPage = "/";

  static const String mainPage = "mainPage";

  ///路由表配置
  static Map<String, WidgetBuilder> routes = {
    loginPage: (context) => const LoginPage(),
    splashPage: (context) => const SplashPage(),
    mainPage: (context) => const MainPage(),
  };
}
