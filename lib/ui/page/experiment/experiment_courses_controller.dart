import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:guethub/data/model/current_semesters/current_semesters.dart';
import 'package:guethub/data/model/experiment/experiment_courses_response/experiment_courses_response.dart';
import 'package:guethub/data/model/experiment/teacher_calendar_response/teacher_calendar_response.dart';
import 'package:guethub/data/model/teaching_evaluation/teaching_evaluation.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_info/textbook_evaluate_info.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_item/textbook_evaluate_item.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_result/textbook_evaluate_result.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/experiment.dart';
import 'package:guethub/data/repository/teaching_evaluation.dart';
import 'package:guethub/data/repository/textbook_evaluate.dart';
import 'package:guethub/ui/util/toast.dart';

import '../../../data/model/semesters/semesters.dart';
import 'package:guethub/logger.dart';

class ExperimentCoursesController extends GetxController {
  final experimentCourseRecords = <ExperimentCourseRecord>[].obs;

  var isLoading = false.obs; // Tracks loading state
  var hasError = false.obs; // Tracks if there's an error

  final teacherCalendarOptions = <TeacherCalendarOption>[].obs;
  final currentTeacherCalendarOptions = Rxn<TeacherCalendarOption>();

  final semester = <Semester>[].obs;
  final currentSemester = Rxn<Semester>();

  Future<void> changeCurrentSemester(TeacherCalendarOption semester) async {
    currentTeacherCalendarOptions(semester);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    currentTeacherCalendarOptions.listen((semester) async {
      if (semester != null) {
        await getTextbookEvaluateListData(semester);
      }
    });
    await getData();
  }

  Future<void> getTextbookEvaluateListData(
      TeacherCalendarOption semester) async {
    try {
      isLoading(true);
      hasError(false);
      experimentCourseRecords
          .value = (await ExperimentRepository.get().getExperimentCourses(
              teacherCalendarId: semester.value))
          .result
          .records;
    } catch (e) {
      logger.e(e);
      hasError(true);
      toastFailure0("获取数据失败", error: e);
    } finally {
      isLoading(false);
    }
  }

  getData({bool isFlush = false}) async {
    try {
      isLoading(true);
      hasError(false);
      if(teacherCalendarOptions.isEmpty) {
        teacherCalendarOptions.value =
            (await ExperimentRepository.get().getTeacherCalendar()).result;
        semester.value =
            await CourseRepository.get().getSemesters(isFlush: false);

        if (currentTeacherCalendarOptions.value == null ||
            currentSemester.value == null) {
          currentSemester.value =
              await CourseRepository.get().getCurrentSemester(semester, true);
          currentTeacherCalendarOptions
              .value = teacherCalendarOptions.firstWhereOrNull(
                  (it) => it.syncId == currentSemester.value!.id.toString()) ??
              teacherCalendarOptions.first;
        }
      }
      if (isFlush) {
        await getTextbookEvaluateListData(currentTeacherCalendarOptions.value!);
      }
    } catch (e) {
      logger.e(e);
      hasError(true);
      toastFailure0("获取数据失败", error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshData() async {
    await getData(isFlush: true);
    if (!hasError.value) {
      toastSuccess0("刷新成功");
    } else {
      toastFailure0("刷新失败");
    }
  }
}
