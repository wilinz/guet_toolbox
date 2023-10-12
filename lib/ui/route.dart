import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:guettoolbox/ui/page/campus_network/campus_network.dart';
import 'package:guettoolbox/ui/page/course_detail/course_detail.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection.dart';
import 'package:guettoolbox/ui/page/login/login.dart';
import 'package:guettoolbox/ui/page/main/main.dart';
import 'package:guettoolbox/ui/page/pedagogical_evaluation/pedagogical_evaluation_edit.dart';
import 'package:guettoolbox/ui/page/splash/splash.dart';
import 'package:guettoolbox/ui/settings/settings_page.dart';
import 'package:guettoolbox/ui/widget/window_caption.dart';

import 'page/pedagogical_evaluation/pedagogical_evaluation.dart';

class AppRoute {
  static String currentPage = splashPage;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String loginPage = "/loginPage";

  static const String splashPage = "/";

  static const String mainPage = "/mainPage";

  static const String settingsPage = "/SettingsPage";

  static const String courseSelectionPage = "/courseSelectionPage";

  static const String pedagogicalEvaluationPage = "/pedagogicalEvaluationPage";

  static const String pedagogicalEvaluationEditPage =
      "/pedagogicalEvaluationEditPage";

  static const String campusNetworkPage = "/CampusNetworkPage";

  static const String courseDetailPage = "/CourseDetailPage";

  static List<GetPage> routes = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(popUpAfterSuccess: Get.arguments as bool),
    ),
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: settingsPage,
      page: () => SettingsPage(),
    ),
    GetPage(
      name: mainPage,
      page: () => const MainPage(),
    ),
    GetPage(
      name: courseSelectionPage,
      page: () => CourseSelectionPage(),
    ),
    GetPage(
      name: pedagogicalEvaluationPage,
      page: () => PedagogicalEvaluationPage(),
    ),
    GetPage(
      name: pedagogicalEvaluationEditPage,
      page: () => PedagogicalEvaluationEditPage(
          pedagogicalEvaluation: Get.arguments as PedagogicalEvaluation),
    ),
    GetPage(
      name: campusNetworkPage,
      page: () => CampusNetworkPage(),
    ),
    GetPage(
      name: courseDetailPage,
      page: () => CourseDetailPage(schedule: Get.arguments as SemesterSchedule),
    ),
  ].map((e) => e.copy(middlewares: [WindowTopBarMiddleWare()])).toList();
}

class WindowTopBarMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  //该函数将在调用 GetPage.page 函数后立即调用，并为您提供函数的结果。并获取将显示的小部件
  @override
  Widget onPageBuilt(Widget page) {
    if (GetPlatform.isDesktop && !GetPlatform.isWeb) {
      return Scaffold(
        appBar: buildWindowTopBar('app_name'.tr),
        body: page,
      );
    } else {
      return page;
    }
  }

  PreferredSizeWidget buildWindowTopBar(String title) {
    if (GetPlatform.isMacOS) {
      return PreferredSize(
        child: SizedBox(
          height: kWindowCaptionHeight,
          child: Center(child: Text(title)),
        ),
        preferredSize: const Size.fromHeight(kWindowCaptionHeight),
      );
    } else {
      return PreferredSize(
        child: WindowCaption(
          brightness: Get.theme.brightness,
          title: Text(title),
        ),
        preferredSize: const Size.fromHeight(kWindowCaptionHeight),
      );
    }
  }
}
