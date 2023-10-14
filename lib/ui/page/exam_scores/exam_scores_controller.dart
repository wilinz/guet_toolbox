import 'package:get/get.dart';
import 'package:guettoolbox/data/model/exam_scores/exam_scores.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/data/repository/exam_scores.dart';

class ExamScoresController extends GetxController {
  final terms = <Term>[].obs;
  final currentTerm = Rx<Term?>(null);
  final examScores = <ExamScore>[].obs;

  getTermList() async {
    terms.value = (await CourseRepository.get().getTermList()).reversed.toList();
    currentTerm.value = CourseRepository.get().getCurrentTerm(terms, false);
  }

  getExamScores() async {
    final term = currentTerm.value;
    if (term == null) return;
    final resp =
    await ExamScoresRepository.get().getExamScores(term: term.term);
    examScores.value = resp.data;
  }

  @override
  void onInit() {
    super.onInit();
    getTermList();
  }

  void toPrevious() {
    final term = currentTerm.value;
    if (term == null) return;
    final index = terms.indexOf(term) - 1;
    if (index < 0 || index >= terms.length) return;
    final newItem = terms.elementAtOrNull(index);
    currentTerm.value = newItem;
    getExamScores();
  }

  void toNext() {
    final term = currentTerm.value;
    if (term == null) return;
    final index = terms.indexOf(term) + 1;
    if (index < 0 || index >= terms.length) return;
    final newItem = terms.elementAtOrNull(index);
    currentTerm.value = newItem;
    getExamScores();
  }

}