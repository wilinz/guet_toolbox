import 'dart:convert';

import 'package:guettoolbox/common/json.dart';
import 'package:guettoolbox/data/model/exam_scores/exam_scores.dart';
import 'package:guettoolbox/data/model/exam_scores_sort/exam_scores_sort.dart';
import 'package:guettoolbox/data/network.dart';
import 'package:guettoolbox/data/service/exam_scores.dart';

class ExamScoresRepository {

  Future<ExamScoresResponse> getExamScores({
    String term = "",
    List<ExamScoresSort>? sort = null,
    int page = 1,
    int start = 0,
    int limit = 100,
  }) async {
    return ExamScoresService.getExamScores(
        term: term, sort: sort, page: page, start: start, limit: limit);
  }

  ExamScoresRepository._();

  static ExamScoresRepository? _instance;

  factory ExamScoresRepository.get() => _instance ??= ExamScoresRepository._();
}
