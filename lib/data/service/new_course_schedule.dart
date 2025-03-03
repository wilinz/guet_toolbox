import 'package:dio/dio.dart';
import 'package:guethub/data/model/new_schedule/new_schedule.dart';

class NewCourseService {
  static Future<NewSchedule> getPrintData(
      {required Dio dio,
      required int semesterId,
      bool hasExperiment = true}) async {
    final resp = await dio.get(
        "student/for-std/course-table/semester/${semesterId}/print-data",
        queryParameters: {
          "semesterId": semesterId,
          "hasExperiment": hasExperiment
        });
    return NewSchedule.fromJson(resp.data);
  }
}
