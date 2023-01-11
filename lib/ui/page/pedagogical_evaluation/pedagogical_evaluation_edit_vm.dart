import 'package:common_utils/common_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:guettoolbox/data/model/common_response.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation_data.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation_questions_response.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation_response.dart';
import 'package:guettoolbox/data/repository/pedagogical_evaluation.dart';
import 'package:guettoolbox/data/service/pedagogical_evaluation.dart';
import 'package:guettoolbox/util/list.dart';
import 'dart:math';

import 'package:logger/logger.dart';

class PedagogicalEvaluationEditViewModel extends ChangeNotifier {
  final PedagogicalEvaluation pedagogicalEvaluation;

  PedagogicalEvaluationData? data = null;

  bool isLoading = false;
  List<PedagogicalEvaluationQuestion> questions = [];

  final comment = TextEditingController(text: "");

  PedagogicalEvaluationEditViewModel(this.pedagogicalEvaluation);

  notify() => notifyListeners();

  Future<List<PedagogicalEvaluationQuestion>> getOptions() async {
    return PedagogicalEvaluationRepository.getInstance()
        .getQuestions(pedagogicalEvaluation.term,
            pedagogicalEvaluation.courseno, pedagogicalEvaluation.teacherno)
        .then((value) {
      questions = value;
      notifyListeners();
      return value;
    });
  }

  Future<PedagogicalEvaluationData> getCurrent() async {
    return PedagogicalEvaluationRepository.getInstance()
        .getCurrent(
      term: pedagogicalEvaluation.term,
      courseno: pedagogicalEvaluation.courseno,
      teacherno: pedagogicalEvaluation.teacherno,
    )
        .then((value) {
      data = value;
      comment.text = value.bz;
      notifyListeners();
      return value;
    });
  }

  Future<CommonResponse> submitQuestions() async {
    final data = questions.where((e) => e.score != null).toList();
    if (data.isEmpty) {
      throw Exception("您还没选择任何选项");
    }
    return PedagogicalEvaluationRepository.getInstance().submitQuestions(
        term: pedagogicalEvaluation.term,
        courseid: pedagogicalEvaluation.courseid,
        courseno: pedagogicalEvaluation.courseno,
        teacherno: pedagogicalEvaluation.teacherno,
        lb: pedagogicalEvaluation.lb,
        questions: data);
  }

  num calculateTheScore() {
    var average =
        questions.where((e) => e.score != null).map((e) => e.score!).average();
    average = double.parse(
        NumUtil.getNumByValueDouble(average.toDouble(), 1)!.toStringAsFixed(1));
    data?.score = average;
    return average;
  }

  Future<CommonResponse> submit(
      {required String comment, required bool isSaveOnly}) async {
    final average = calculateTheScore();
    return PedagogicalEvaluationRepository.getInstance().submit(
        data: pedagogicalEvaluation,
        comment: comment,
        score: average,
        isSaveOnly: isSaveOnly);
  }
}
