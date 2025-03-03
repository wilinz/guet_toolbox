import 'package:common_utils/common_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/common/common_response.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_data.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_questions_response.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:guethub/data/repository/pedagogical_evaluation.dart';
import 'package:guethub/util/list.dart';

class PedagogicalEvaluationEditViewModel extends GetxController {
  final PedagogicalEvaluation pedagogicalEvaluation;

  final data = Rx<PedagogicalEvaluationData?>(null);

  RxList<PedagogicalEvaluationQuestion> questions =
      RxList<PedagogicalEvaluationQuestion>.empty(growable: true);

  final comment = TextEditingController(text: "");

  final isCanSubmit = false.obs;

  bool _isCanSubmit() {
    return pedagogicalEvaluation.chk == 0;
  }

  @override
  void onInit() {
    super.onInit();
    isCanSubmit.value = _isCanSubmit();
  }

  PedagogicalEvaluationEditViewModel(this.pedagogicalEvaluation);

  Future<List<PedagogicalEvaluationQuestion>> getOptions() async {
    return PedagogicalEvaluationRepository.get()
        .getQuestions(pedagogicalEvaluation.term,
            pedagogicalEvaluation.courseno, pedagogicalEvaluation.teacherno)
        .then((value) {
      questions.value = value;
      return value;
    });
  }

  Future<PedagogicalEvaluationData> getCurrent() async {
    return PedagogicalEvaluationRepository.get()
        .getCurrent(
      term: pedagogicalEvaluation.term,
      courseno: pedagogicalEvaluation.courseno,
      teacherno: pedagogicalEvaluation.teacherno,
    )
        .then((value) {
      data.value = value;
      comment.text = value.bz;
      return value;
    });
  }

  Future<CommonResponse> submitQuestions() async {
    final data = questions.where((e) => e.score != null).toList();
    if (data.isEmpty) {
      throw Exception("您还没选择任何选项");
    }
    return PedagogicalEvaluationRepository.get().submitQuestions(
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
    data.value?.score = average;
    update();
    return average;
  }

  Future<CommonResponse> submit(
      {required String comment, required bool isSaveOnly}) async {
    final average = calculateTheScore();
    return PedagogicalEvaluationRepository.get().submit(
        data: pedagogicalEvaluation,
        comment: comment,
        score: average,
        isSaveOnly: isSaveOnly);
  }
}
