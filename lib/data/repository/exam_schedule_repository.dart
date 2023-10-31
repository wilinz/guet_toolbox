import 'package:guettoolbox/data/model/exam_scheduling/exam_schedule.dart';
import 'package:guettoolbox/data/service/exam_schedule.dart';

class ExamScheduleRepository {
  Future<ExamScheduleResponse> getExamSchedule({
    String term = "",
    int page = 1,
    int start = 0,
    int limit = 100,
  }) =>
      ExamScheduleService.getExamSchedule(
          term: term, page: page, start: start, limit: limit);

  ExamScheduleRepository._();

  static ExamScheduleRepository? _instance;

  factory ExamScheduleRepository.get() =>
      _instance ??= ExamScheduleRepository._();
}
