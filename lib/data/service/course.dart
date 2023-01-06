import 'package:dio/dio.dart';
import 'package:guettoolbox/data/model/course_response.dart';

import '../model/template.dart';
import '../network.dart';

class CourseService {
  static Future<List<Course>> getCourseList(String term) async {
    final resp = await (await AppNetwork.getDio())
        .get("student/getstutable", queryParameters: {"term": term});
    final respData = CourseResponse.fromJson(resp.data);
    return respData.data;
  }

  static Future<String> getPlan(
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
        },
        options: Options(responseType: ResponseType.plain));
    return resp.data;
  }
}
