import 'package:dio/dio.dart';
import 'package:guethub/data/model/experiment/experiment_batch_response/experiment_batch_response.dart';
import 'package:guethub/data/model/experiment/experiment_common_response/experiment_common_response.dart';
import 'package:guethub/data/model/experiment/experiment_courses_response/experiment_courses_response.dart';
import 'package:guethub/data/model/experiment/experiment_items_response/experiment_items_response.dart';
import 'package:guethub/data/model/experiment/teacher_calendar_response/teacher_calendar_response.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/redirect_interceptor.dart';
import 'package:guethub/data/service/experiment.dart';

class ExperimentRepository {
  Dio get dio => AppNetwork.get().bkjwTestDio;

  /// 获取实验课程列表
  ///
  /// [teacherCalendarId] 示例: "1712296043783131138"
  Future<ExperimentCoursesResponse> getExperimentCourses(
          {required String teacherCalendarId}) async =>
      ExperimentService.getExperimentCourses(dio,
          teacherCalendarId: teacherCalendarId);

  /// 获取实验项目列表
  ///
  /// [taskId] 示例: "sync252750"
  Future<List<ExperimentItems>> getExperimentItems(
      {required String taskId}) async {
    final resp =
        await ExperimentService.getExperimentItems(dio, taskId: taskId);

    for (final e in resp.result) {
      for (final item in e.list) {
        item.type = e.type;
      }
    }

    return resp.result.expand((e) => e.list).toList();
    ;
  }

  /// 获取实验批次列表
  ///
  /// [subjectId] 示例: "1858683920732598273"
  /// [taskId] 示例: "sync252750"
  Future<ExperimentBatchResponse> getExperimentBatch(
          {required String subjectId, required String taskId}) async =>
      ExperimentService.getExperimentBatch(dio,
          subjectId: subjectId, taskId: taskId);

  /// 选课
  ///
  /// [itemIds] 示例: 示例: "1859789772523085825, 1859789772728606722"
  /// [selectWey] 示例: "1"
  /// [taskId] 示例: "sync252750"
  /// [stuId] 示例: "1712296052754747400"
  Future<ExperimentCommonResponse> selectExperimentCourse(
          {required List<String> itemIds,
          required int selectWey,
          required String taskId,
          required String stuId}) async =>
      ExperimentService.selectExperimentCourse(dio,
          itemIds: itemIds, selectWey: selectWey, taskId: taskId, stuId: stuId);

  /// 退课
  ///
  /// [stuId] 示例: "1712296052754747400"
  /// [subjectId] 示例: "1858683920732598273"
  /// [taskId] 示例: "sync252750"
  Future<ExperimentCommonResponse> dropExperimentCourse(
          {required String stuId,
          required String subjectId,
          required String taskId}) async =>
      ExperimentService.dropExperimentCourse(dio,
          stuId: stuId, subjectId: subjectId, taskId: taskId);

  Future<TeacherCalendarResponse> getTeacherCalendar() =>
      ExperimentService.getTeacherCalendar(dio);

  ExperimentRepository._create();

  static ExperimentRepository? _instance;

  factory ExperimentRepository.get() =>
      _instance ??= ExperimentRepository._create();
}
