import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:guethub/data/model/teaching_evaluation/teaching_evaluation.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/teaching_evaluation.dart';
import 'package:guethub/ui/util/toast.dart';

import '../../../data/model/semesters/semesters.dart';
import 'package:guethub/logger.dart';

class TeachingEvaluationController extends GetxController {
  final teachingEvaluationData = <TeachingEvaluationItem>[].obs;
  var isLoading = false.obs; // Tracks loading state
  var hasError = false.obs; // Tracks if there's an error
  final semester = <Semester>[].obs;
  final currentSemester = Rxn<Semester>();

  @override
  Future<void> onInit() async {
    super.onInit();
    currentSemester.listen((semester) async {
      if (semester != null) {
        await getTeachingListData(semester);
      }
    });
    await getData();
  }

  Future<void> getTeachingListData(Semester semester) async {
    try {
      isLoading(true);
      hasError(false);
      final resp = await TeachingEvaluationRepository.get()
          .getTeachingEvaluationResponse(
              semesterId: semester.id, evaluated: true);
      teachingEvaluationData.value = resp.data.data;
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
      semester.value =
          await CourseRepository.get().getSemesters(isFlush: false);
      if (currentSemester.value == null) {
        currentSemester.value =
            await CourseRepository.get().getCurrentSemester(semester, true);
      }
      if (isFlush) {
        await getTeachingListData(currentSemester.value!);
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
