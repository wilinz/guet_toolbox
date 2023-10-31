import 'package:get/get.dart';
import 'package:guettoolbox/data/model/exam_scheduling/exam_schedule.dart';
import 'package:guettoolbox/data/model/exam_scores/exam_scores.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/data/repository/exam_schedule_repository.dart';
import 'package:guettoolbox/data/repository/exam_scores.dart';

class ExamScheduleController extends GetxController {
  final terms = <Term>[].obs;
  final currentTerm = Rx<Term?>(null);
  final examSchedule = <ExamSchedule>[].obs;

  getTermList() async {
    terms.value =
        (await CourseRepository.get().getTermList()).reversed.toList();
    currentTerm.value = CourseRepository.get().getCurrentTerm(terms, false);
  }

  getExamSchedule() async {
    final resp = await ExamScheduleRepository.get()
        .getExamSchedule(term: currentTerm.value!.term);
    examSchedule.value = resp.data;
  }

  @override
  void onInit() async {
    super.onInit();
    await getTermList();
    getExamSchedule();
  }
}
