import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/pedagogical_evaluation_response.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/data/repository/pedagogical_evaluation.dart';

class PedagogicalEvaluationViewModel extends ChangeNotifier {
  List<Term> terms = [];
  List<PedagogicalEvaluation> pedagogicalEvaluations = [];
  Term? _currentTerm;

  Term? get currentTerm => _currentTerm;

  set currentTerm(Term? value) {
    _currentTerm = value;
    notifyListeners();
  }

  Future<List<Term>> getTermList() {
    return CourseRepository.getInstance().getTermList().then((value) {
      terms = value;
      currentTerm = CourseRepository.getInstance().getCurrentTerm(terms, false);
      notifyListeners();
      return value;
    });
  }

  notify() => notifyListeners();

  Future<List<PedagogicalEvaluation>> getList(String term) async {
    return PedagogicalEvaluationRepository.getInstance()
        .getList(term)
        .then((value) {
      pedagogicalEvaluations = value;
      notifyListeners();
      return value;
    });
  }
}
