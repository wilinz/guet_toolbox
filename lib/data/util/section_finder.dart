import 'package:intl/intl.dart';

class SectionTime {
  final int section;
  final DateTime startTime;
  final DateTime endTime;

  SectionTime(this.section, this.startTime, this.endTime);
}

// 定义所有的 Section 时间段
List<SectionTime> getSectionTimes(DateTime date) {
  String dateStr = DateFormat('yyyy-MM-dd').format(date);
  return [
    SectionTime(
      1,
      DateTime.parse('$dateStr 08:25'),
      DateTime.parse('$dateStr 10:00'),
    ),
    SectionTime(
      2,
      DateTime.parse('$dateStr 10:25'),
      DateTime.parse('$dateStr 12:00'),
    ),
    SectionTime(
      3,
      DateTime.parse('$dateStr 14:30'),
      DateTime.parse('$dateStr 16:05'),
    ),
    SectionTime(
      4,
      DateTime.parse('$dateStr 16:30'),
      DateTime.parse('$dateStr 18:05'),
    ),
    SectionTime(
      5,
      DateTime.parse('$dateStr 19:30'),
      DateTime.parse('$dateStr 21:10'),
    ),
  ];
}

// 查找最接近的 Section
SectionTime? findClosestSection(DateTime givenStartTime, DateTime givenEndTime) {
  DateTime date = DateTime(givenStartTime.year, givenStartTime.month, givenStartTime.day);
  List<SectionTime> sections = getSectionTimes(date);

  SectionTime? closestSection;
  Duration minTotalDifference = Duration(hours: 24); // 初始化为一天的最大差值

  for (var section in sections) {
    // 计算开始时间和结束时间的差值
    Duration startDiff = givenStartTime.difference(section.startTime).abs();
    Duration endDiff = givenEndTime.difference(section.endTime).abs();
    Duration totalDiff = startDiff + endDiff;

    if (totalDiff < minTotalDifference) {
      minTotalDifference = totalDiff;
      closestSection = section;
    }
  }

  return closestSection;
}