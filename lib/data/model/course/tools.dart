import 'package:guethub/data/model/course/semester_schedule.dart';

List<WeekRange> mergeWeeks(List<int> weekIndexes) {
  if (weekIndexes.isEmpty) return [];

  weekIndexes.sort();
  List<WeekRange> result = [];
  int startWeek = weekIndexes[0];
  int endWeek = startWeek;

  for (int i = 1; i < weekIndexes.length; i++) {
    if (weekIndexes[i] == endWeek + 1) {
      // 如果当前周与前一周是连续的，则更新 endWeek
      endWeek = weekIndexes[i];
    } else {
      // 否则，将前一段范围加入结果，并更新 startWeek 和 endWeek
      result.add(WeekRange(startWeek, endWeek));
      startWeek = weekIndexes[i];
      endWeek = startWeek;
    }
  }
  // 最后一段范围需要加入结果
  result.add(WeekRange(startWeek, endWeek));

  return result;
}
