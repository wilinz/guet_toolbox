import 'package:dio/dio.dart';
import 'package:guethub/data/model/teaching_evaluation/teaching_evaluation.dart';
import 'package:guethub/data/model/teaching_evaluation_content/teaching_evaluation_content.dart';
import 'package:guethub/data/model/teaching_evaluation_submit/teaching_evaluation_submit.dart';
import 'package:guethub/data/redirect_interceptor.dart';

class TeachingEvaluationService {
  static Future<TeachingEvaluationResponse> getTeachingEvaluationResponse(
      Dio dio,
      {required int semesterId,
      int startPage = 0,
      int endPage = 100,
      String orderBy = "",
      bool evaluated = false}) async {
    final resp = await dio.get(
        "eams5-evaluation-service/api/v1/for-student/student-summation-forstudent/search",
        queryParameters: {
          "queryPage__": "${startPage},${endPage}",
          "orderBy": orderBy,
          "semesterId": semesterId,
          "evaluated": evaluated
        });
    return TeachingEvaluationResponse.fromJson(resp.data);
  }

  static Future<TeachingEvaluationContentResponse>
      getTeachingEvaluationContentResponse(Dio dio,
          {required String evaluationQuestionnaireId}) async {
    final resp = await dio.get(
      "eams5-evaluation-service/api/v1/for-student/student-summation-forstudent/search-questionnaire/${evaluationQuestionnaireId}",
    );
    return TeachingEvaluationContentResponse.fromJson(resp.data);
  }

  /// {
  ///   "code": 0,
  ///   "msg": "操作成功",
  ///   "data": null,
  ///   "ok": true
  /// }
  static Future<Map<String, dynamic>> submit(Dio dio,
      {required TeachingEvaluationSubmit body}) async {
    final resp = await dio.post(
        "eams5-evaluation-service/api/v1/for-student/student-summation-forstudent/submit",
        data: body.toJson());
    return resp.data;
  }

  static Future<String> getToken(Dio dio) async {
    final resp = await dio.get(
        "student/for-std/extra-system/student-summation-forstudent/index",
        options: Options(extra: {RedirectInterceptor.followRedirects: false}));
    final location = resp.headers.value('location');
    if (location == null) {
      throw Exception("获取token失败");
    }
    final uri = Uri.parse(location.replaceAll(
        "?bizTypeId=2#", Uri.encodeComponent("?bizTypeId=2#")));
    final token = uri.queryParameters["token"];
    if (token == null) {
      throw Exception("获取token失败");
    }
    return token;
  }
}
