import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:guettoolbox/ui/page/campus_network/campus_network.dart';
import 'package:guettoolbox/ui/page/course_detail/course_detail.dart';
import 'package:guettoolbox/ui/page/course_selection/course_selection.dart';
import 'package:guettoolbox/ui/page/login/login.dart';
import 'package:guettoolbox/ui/page/main/main.dart';
import 'package:guettoolbox/ui/page/pedagogical_evaluation/pedagogical_evaluation_edit.dart';
import 'package:guettoolbox/ui/page/splash/splash.dart';

import 'page/pedagogical_evaluation/pedagogical_evaluation.dart';

class AppRoute {
  static String currentPage = splashPage;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String loginPage = "loginPage";

  static const String splashPage = "/";

  static const String mainPage = "mainPage";

  static const String courseSelectionPage = "courseSelectionPage";

  static const String pedagogicalEvaluationPage = "pedagogicalEvaluationPage";

  static const String pedagogicalEvaluationEditPage =
      "pedagogicalEvaluationEditPage";

  static const String campusNetworkPage = "CampusNetworkPage";

  static const String courseDetailPage = "CourseDetailPage";

  ///路由表配置
  static Map<String, WidgetBuilder> routes = {
    loginPage: (context) {
      final args = ModalRoute.of(context)!.settings.arguments!;
      final popUpAfterSuccess = args as bool;
      return LoginPage(popUpAfterSuccess: popUpAfterSuccess);
    },
    splashPage: (context) => const SplashPage(),
    mainPage: (context) => const MainPage(),
    courseSelectionPage: (context) => const CourseSelectionPage(),
    pedagogicalEvaluationPage: (context) => const PedagogicalEvaluationPage(),
    pedagogicalEvaluationEditPage: (BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments;
      final pedagogicalEvaluation = args as PedagogicalEvaluation;
      return PedagogicalEvaluationEditPage(
          pedagogicalEvaluation: pedagogicalEvaluation);
    },
    campusNetworkPage: (context) => const CampusNetworkPage(),
    courseDetailPage: (BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments;
      final schedule = args as SemesterSchedule;
      return CourseDetailPage(schedule: schedule);
    },
  };
}
