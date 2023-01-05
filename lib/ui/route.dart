import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection.dart';
import 'package:guettoolbox/ui/page/login/login.dart';
import 'package:guettoolbox/ui/page/main/main.dart';
import 'package:guettoolbox/ui/page/splash/splash.dart';

class AppRoute {
  static String currentPage = splashPage;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String loginPage = "loginPage";

  static const String splashPage = "/";

  static const String mainPage = "mainPage";

  static const String courseSelectionPage = "courseSelectionPage";

  ///路由表配置
  static Map<String, WidgetBuilder> routes = {
    loginPage: (context) => const LoginPage(),
    splashPage: (context) => const SplashPage(),
    mainPage: (context) => const MainPage(),
    courseSelectionPage: (context) => const CourseSelectionPage()
  };
}
