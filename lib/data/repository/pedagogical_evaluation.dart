import 'package:guethub/data/model/common/common_response.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_data.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_questions_response.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:guethub/data/service/pedagogical_evaluation.dart';

class PedagogicalEvaluationRepository {

  @Deprecated("Old system")
  Future<List<PedagogicalEvaluation>> getList(String term) async {
    return PedagogicalEvaluationService.get(term);
  }

  @Deprecated("Old system")
  Future<List<PedagogicalEvaluationQuestion>> getQuestions(
      String term, String courseno, String teacherno) async {
    return PedagogicalEvaluationService.getQuestions(term, courseno, teacherno);
  }

  @Deprecated("Old system")
  Future<CommonResponse> submitQuestions(
      {required String term,
      required String courseid,
      required String courseno,
      required String teacherno,
      required int lb,
      required List<PedagogicalEvaluationQuestion> questions}) async {
    return PedagogicalEvaluationService.submitQuestions(
        term: term,
        courseid: courseid,
        courseno: courseno,
        teacherno: teacherno,
        lb: lb,
        questions: questions);
  }

  @Deprecated("Old system")
  Future<CommonResponse> submit(
      {required PedagogicalEvaluation data,
      required String comment,
      required num score,
      required bool isSaveOnly}) async {
    return PedagogicalEvaluationService.submit(
        data: data, comment: comment, score: score, isSaveOnly: isSaveOnly);
  }

  @Deprecated("Old system")
  Future<PedagogicalEvaluationData> getCurrent(
      {required String term,
      required String courseno,
      required String teacherno}) async {
    return PedagogicalEvaluationService.getCurrent(
        term: term, courseno: courseno, teacherno: teacherno);
  }

  PedagogicalEvaluationRepository._();

  static PedagogicalEvaluationRepository? _instance = null;

  factory PedagogicalEvaluationRepository.get() =>
      _instance ??= PedagogicalEvaluationRepository._();
}
