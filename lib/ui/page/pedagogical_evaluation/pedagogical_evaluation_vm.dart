import 'package:get/get.dart';
import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/pedagogical_evaluation.dart';

class PedagogicalEvaluationViewModel extends GetxController {
  final terms = <Term>[].obs;
  final pedagogicalEvaluations = <PedagogicalEvaluation>[].obs;
  final currentTerm = Rx<Term?>(null);

  Future<List<Term>> getTermList() {
    return CourseRepository.get().getTermList(isFlush: true).then((value) {
      terms.value = value;
      currentTerm.value = CourseRepository.get().getCurrentTerm(terms, false);
      return value;
    });
  }

  Future<List<PedagogicalEvaluation>> getList(String term) async {
    return PedagogicalEvaluationRepository.get()
        .getList(term)
        .then((value) {
      pedagogicalEvaluations.value = value;
      return value;
    });
  }
}
