import 'package:guethub/logger.dart';

int calculateWeekNumber(DateTime startDate, DateTime targetDate) {
  logger.d(
      "start: ${startDate.toIso8601String()} ${startDate.timeZoneOffset} end: ${targetDate.toIso8601String()} ${targetDate.timeZoneOffset}");

  // 移除时间部分，只保留日期部分
  DateTime startDateOnly =
      DateTime(startDate.year, startDate.month, startDate.day);
  DateTime targetDateOnly =
      DateTime(targetDate.year, targetDate.month, targetDate.day);

  // 获取起始日期所在的周的星期一
  DateTime startOfWeek =
      startDateOnly.subtract(Duration(days: startDateOnly.weekday - 1));

  // 获取目标日期所在的周的星期一
  DateTime targetStartOfWeek =
      targetDateOnly.subtract(Duration(days: targetDateOnly.weekday - 1));

  // 计算两个日期之间的差异天数
  int differenceInDays = targetStartOfWeek.difference(startOfWeek).inDays;

  // 计算差异周数
  int weekNumber = differenceInDays ~/ 7;

  logger.d(
      "start: ${startOfWeek.toIso8601String()} ${startOfWeek.timeZoneOffset} end: ${targetStartOfWeek.toIso8601String()} ${targetStartOfWeek.timeZoneOffset}");

  logger.d("weeks: ${weekNumber}");
  return weekNumber;
}
