import 'dart:convert';

import 'package:guettoolbox/common/json.dart';
import 'package:guettoolbox/data/model/exam_scores/exam_scores.dart';
import 'package:guettoolbox/data/model/exam_scores_sort/exam_scores_sort.dart';
import 'package:guettoolbox/data/network.dart';

class ExamScoresService {
  static Future<ExamScoresResponse> getExamScores({
    required String term,
    List<ExamScoresSort>? sort = null,
    int page = 1,
    int start = 0,
    int limit = 100,
  }) async {
    final result = await AppNetwork.get().dio.get("Student/GetStuScore", queryParameters: {
      "_dc": DateTime.timestamp().millisecondsSinceEpoch,
      "term": term,
      "page": page,
      "start": start,
      "limit": limit,
      "sort": sort != null
          ? jsonEncode(sort.toJson())
          : """[{"property":"stid","direction":"ASC"},{"property":"term","direction":"ASC"}]"""
    });
    return ExamScoresResponse.fromJson(result.data);
  }
}
