import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:guethub/data/model/teaching_evaluation/teaching_evaluation.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_info/textbook_evaluate_info.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_item/textbook_evaluate_item.dart';
import 'package:guethub/data/model/textbook_evaluate/textbook_evaluate_result/textbook_evaluate_result.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/teaching_evaluation.dart';
import 'package:guethub/data/repository/textbook_evaluate.dart';
import 'package:guethub/ui/util/toast.dart';

import '../../../data/model/semesters/semesters.dart';
import 'package:guethub/logger.dart';

class TextbookEvaluateController extends GetxController {
  final textbookEvaluateItems = <TextbookEvaluateItem>[].obs;
  final textbookEvaluateInfo = Rxn<TextbookEvaluateInfo>();
  var isLoading = false.obs; // Tracks loading state
  var hasError = false.obs; // Tracks if there's an error
  final semester = <Semester>[].obs;
  final currentSemester = Rxn<Semester>();

  Future<void> changeCurrentSemester(Semester semester) async {
    currentSemester(semester);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    currentSemester.listen((semester) async {
      if (semester != null) {
        await getTextbookEvaluateListData(semester);
      }
    });
    await getData();
  }

  Future<void> getTextbookEvaluateListData(Semester semester) async {
    try {
      isLoading(true);
      hasError(false);
      final task1 = TextbookEvaluateRepository.get()
          .getTextbookEvaluateInfo(semesterId: semester.id);
      final task2 = TextbookEvaluateRepository.get()
          .getTextbookEvaluateResult(semesterId: semester.id);
      final responses = await Future.wait([task1, task2], eagerError: true);
      final resp1 = responses[0] as TextbookEvaluateInfo;
      final resp2 = responses[1] as TextbookEvaluateResult;
      textbookEvaluateInfo.value = resp1;
      textbookEvaluateItems.value = resp1.data
              .map((e) => TextbookEvaluateItem.formTextbookEvaluateInfoData(e))
              .toList() +
          resp2.data
              .map(
                  (e) => TextbookEvaluateItem.formTextbookEvaluateResultData(e))
              .toList();
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
        await getTextbookEvaluateListData(currentSemester.value!);
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
