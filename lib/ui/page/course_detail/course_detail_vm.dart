import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:guethub/data/database/database.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';

class CourseDetailController extends GetxController {
  RxList<SemesterSchedule> schedules;

  CourseDetailController(List<SemesterSchedule> schedules)
      : this.schedules = schedules.obs;

  Future<bool> deleteSchedule(SemesterSchedule schedule) async {
    try {
      CourseRepository.get().deleteSemesterSchedule(schedule);
      schedules.remove(schedule);
      toastSuccess0("删除成功");
      return true;
    } catch (e) {
      logger.e(e);
      toastFailure0("删除失败", error: e);
      return false;
    }
  }
}
