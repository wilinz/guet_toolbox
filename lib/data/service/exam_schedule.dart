import 'package:guettoolbox/data/model/exam_scheduling/exam_schedule.dart';
import 'package:guettoolbox/data/network.dart';

class ExamScheduleService {
  static Future<ExamScheduleResponse> getExamSchedule({
    String term = "",
    int page = 1,
    int start = 0,
    int limit = 100,
  }) async {
    final resp =
        await AppNetwork.get().dio2.get("student/getexamap", queryParameters: {
      "_dc": DateTime.timestamp().millisecondsSinceEpoch,
      "term": term,
      "page": page,
      "start": start,
      "limit": limit,
    });
    return ExamScheduleResponse.fromJson(resp.data);
  }
}
