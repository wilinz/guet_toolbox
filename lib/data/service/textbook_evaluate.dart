import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_detail/textbook_evaluate_detail.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_info/textbook_evaluate_info.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_result/textbook_evaluate_result.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_save/textbook_evaluate_save.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_save_result/textbook_evaluate_save_result.dart';
import 'package:html/parser.dart';
import 'package:json5/json5.dart';
import 'package:kt_dart/kt.dart';

class TextbookEvaluateService {

  static Future<TextbookEvaluateSaveResult> saveTextbookEvaluate(Dio dio, {required TextbookEvaluateSave data}) async {
    final resp = await dio
        .post("student/for-std/textbook-evaluate/save", data: data.toJson());
    return TextbookEvaluateSaveResult.fromJson(resp.data);
  }

  static Future<TextbookEvaluateResult> getTextbookEvaluateResult(Dio dio, {
    required int studentId,
    required int semesterId,
  }) async {
    final resp = await dio
        .get("student/for-std/textbook-evaluate-result/search", queryParameters: {
      "studentId": studentId,
      "semesterId": semesterId,
    });
    return TextbookEvaluateResult.fromJson(resp.data);
  }

  static Future<TextbookEvaluateInfo> getTextbookEvaluateInfo(Dio dio, {
    required int studentId,
    required int semesterId,
  }) async {
    final resp = await dio
        .get("student/for-std/textbook-evaluate/search", queryParameters: {
      "studentId": studentId,
      "semesterId": semesterId,
    });
    return TextbookEvaluateInfo.fromJson(resp.data);
  }

  static Future<List<TextbookEvaluateDetail>?> getTextbookEvaluateDetail(Dio dio,
      {required int studentId,
      required int semesterId,
      required int batchId,
      required int courseId,
      required int textbookId,
      String? redirectUrl}) async {
    redirectUrl ??=
        "/for-std/textbook-evaluate/search-index/${studentId}?source=false";
    final resp = await dio
        .get("student/for-std/textbook-evaluate/evaluate", queryParameters: {
      "studentId": studentId,
      "semesterId": semesterId,
      "batchId": batchId,
      "courseId": courseId,
      "textbookId": textbookId,
      "REDIRECT_URL": redirectUrl
    });
    return await parseEvaluateDetailAsync(resp.data);
  }

  static Future<List<TextbookEvaluateDetail>?> parseEvaluateDetailAsync(
      String html) async {
    return await compute<String, List<TextbookEvaluateDetail>?>(
        _parseEvaluateDetail, html);
  }

  static List<TextbookEvaluateDetail>? _parseEvaluateDetail(String html) {
    final doc = parse(html);
    final scripts = doc
        .querySelectorAll('script:not([src])')
        .map((e) => e.text)
        .toList()
        .join('\n\n');
    return _extractEvaluateDetail(scripts)
        ?.let((it) => textbookEvaluateDetailListFormJson(it));
  }

  static List<dynamic>? _extractEvaluateDetail(String jsCode) {
    RegExp currentSemesterRegExp = RegExp(
        r'(var|let|const)\s+evaluateDetail\s*=\s*(.*);',
        multiLine: true);

    RegExpMatch? evaluateDetailMatch = currentSemesterRegExp.firstMatch(jsCode);
    if (evaluateDetailMatch != null) {
      String evaluateDetailJson = evaluateDetailMatch.group(2)!.trim();
      return json5Decode(evaluateDetailJson);
    } else {
      return null;
    }
  }

}
