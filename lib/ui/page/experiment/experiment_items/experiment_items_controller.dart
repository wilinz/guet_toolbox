import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:guethub/data/model/experiment/experiment_items_response/experiment_items_response.dart';
import 'package:guethub/data/repository/experiment.dart';
import 'package:guethub/ui/page/experiment/experiment_items/experiment_items.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:guethub/logger.dart';

class ExperimentItemsController extends GetxController {
  final experimentItems = <ExperimentItems>[].obs;

  var isLoading = false.obs; // Tracks loading state
  var hasError = false.obs;

  final ExperimentItemsPageArgs args;

  ExperimentItemsController({required this.args}); // Tracks if there's an error

  @override
  Future<void> onInit() async {
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    try {
      isLoading(true);
      hasError(false);
      experimentItems.value =
          (await ExperimentRepository.get().getExperimentItems(taskId: args.taskId));
    } catch (e) {
      logger.e(e);
      hasError(true);
      toastFailure0("获取数据失败", error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshData() async {
    await getData();
    if (!hasError.value) {
      toastSuccess0("刷新成功");
    } else {
      toastFailure0("刷新失败");
    }
  }

  Future<void> unselect({required String subjectId, required String stuId}) async {
    final resp = await ExperimentRepository.get().dropExperimentCourse(
        subjectId: subjectId, taskId: args.taskId, stuId: stuId);
    toast(resp.message);
  }
}
