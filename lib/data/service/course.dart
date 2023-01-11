import 'package:dio/dio.dart';
import 'package:guettoolbox/data/model/course_lab_response.dart';
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/model/plan_course_detail_response.dart';
import 'package:guettoolbox/data/model/plan_course_response.dart';

import '../model/template.dart';
import '../network.dart';

class CourseService {
  static Future<List<Course>> getCourseList(String term) async {
    final resp = await (await AppNetwork.getDio())
        .get("student/getstutable", queryParameters: {"term": term});
    final respData = CourseResponse.fromJson(resp.data);
    return respData.data;
  }

  static Future<List<CourseLab>> getCourseLabList(String term) async {
    final resp = await (await AppNetwork.getDio())
        .get("student/getlabtable", queryParameters: {"term": term});
    final respData = CourseLabResponse.fromJson(resp.data);
    return respData.data;
  }

  static Future<List<PlanCourse>> getPlan(
    String term,
    String grade,
    String dptno,
    String spno,
  ) async {
    final resp = await (await AppNetwork.getDio()).get("student/GetPlan",
        queryParameters: {
          "term": term,
          "grade": grade,
          "dptno": dptno,
          "spno": spno,
          "stype": "正常"
        });
    final data = PlanCourseResponse.fromJson(resp.data).data;
    return data;
  }

  static Future<List<PlanCourseDetail>> getPlanCourseDetail(String id, String courseid) async {
    final resp = await (await AppNetwork.getDio())
        .get("student/GetPlanCno", queryParameters: {
      "id": id,
      "courseid": courseid,
      // "term": term,
    });
    final data = PlanCourseDetailResponse.fromJson(resp.data);
    return data.data;
  }
}
