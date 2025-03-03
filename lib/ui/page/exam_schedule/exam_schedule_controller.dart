import 'package:get/get.dart';
import 'package:guethub/data/model/exam_scores/exam_scores.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/exam_schedule_repository.dart';
import 'package:guethub/data/repository/exam_scores.dart';
import 'package:guethub/ui/util/toast.dart';

import '../../../data/model/exam_schedule/exam_schedule.dart';

class ExamScheduleController extends GetxController {

  final examSchedule = <ExamSchedule>[].obs;
  final isLoading = false.obs;
  final isLoadFailed = false.obs;

  Future<void> fetchData({bool isShowToast = true}) async {
    try {
      isLoading(true);
      await getExamSchedule();
      isLoadFailed(false);
    } catch (e) {
      isLoadFailed(true);
      if (isShowToast) toastFailure(message: "加载数据失败", error: e);
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  getExamSchedule() async {
    final resp = await ExamScheduleRepository.get()
        .getExamScheduleNew(isFlush: true);
    examSchedule.value = resp;
  }

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }
}
