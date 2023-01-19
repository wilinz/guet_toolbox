import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guettoolbox/data/model/term/term_response.dart';

part 'schedule_datetime.freezed.dart';

@freezed
class ScheduleDatetime with _$ScheduleDatetime {
  const ScheduleDatetime._();
  const factory ScheduleDatetime(
      {required Term term,
      required DateTime dateTime,
      required int week,
      required int weekDay}) = _ScheduleDatetime;

  bool isCurrentWeek() {
    final now = DateTime.now();
    final weekInYear0 = now.difference(DateTime(now.year)).inDays ~/ 7;
    final weekInYear1 = dateTime.difference(DateTime(now.year)).inDays ~/ 7;
    return weekInYear0 == weekInYear1;
  }

  // factory ScheduleDatetime.fromJson(Map<String, dynamic> json) =>
  //     _$ScheduleDatetimeFromJson(json);
}
