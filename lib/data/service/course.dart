import 'package:dio/dio.dart';
import 'package:guettoolbox/data/model/course_response.dart';

import '../model/template.dart';
import '../network.dart';

class CourseService {
  static Future<List<Course>> getCourseList(String term) async {
    var resp = await (await AppNetwork.getDio()).get(
        "student/getstutable?vpn-12-o2-bkjw.guet.edu.cn&_dc=1671744659558&page=1&start=0&limit=25",
        queryParameters: {"term": term});
    var respData = ResponseTemplate<List<Course>, Course>.fromJson(
        resp.data, (e) => Course.fromJson(e));
    return Future(() => respData.data);
  }
}
