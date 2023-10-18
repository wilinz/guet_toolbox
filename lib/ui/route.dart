import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:guettoolbox/ui/page/campus_network/campus_network.dart';
import 'package:guettoolbox/ui/page/course_detail/course_detail.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection.dart';
import 'package:guettoolbox/ui/page/empty_classroom/empty_classroom.dart';
import 'package:guettoolbox/ui/page/exam_scores/exam_scores_page.dart';
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

  static const String examScoresPage = "/ExamScoresPage";

  static const String emptyClassroomPage = "/EmptyClassroomPage";

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
      page: () => CourseDetailPage(schedule: Get.arguments as List<SemesterSchedule>),
    ),
    GetPage(
      name: examScoresPage,
      page: () => ExamScoresPage(),
    ),
    GetPage(
      name: emptyClassroomPage,
      page: () => EmptyClassroomPage(),
    ),
  ].map((e) => e.copy(middlewares: [WindowTopBarMiddleWare()])).toList();
}

class WindowTopBarMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  //该函数将在调用 GetPage.page 函数后立即调用，并为您提供函数的结果。并获取将显示的小部件
  @override
  Widget onPageBuilt(Widget page) {
    return GetPlatform.isDesktop && !GetPlatform.isWeb
        ? DesktopWindow(page: page, title: Text('app_name'.tr))
        : page;
  }
}

class DesktopWindow extends StatefulWidget {
  const DesktopWindow({super.key, required this.page, required this.title});

  final Widget page;
  final Widget title;

  @override
  State<DesktopWindow> createState() => _DesktopWindowState();
}

class _DesktopWindowState extends State<DesktopWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: GetPlatform.isMacOS
            ? SizedBox(
                height: kWindowCaptionHeight,
                child: Center(child: widget.title),
              )
            : WindowCaption(
                brightness: Get.theme.brightness,
                title: widget.title,
              ),
        preferredSize: const Size.fromHeight(kWindowCaptionHeight),
      ),
      body: widget.page,
    );
  }
}
