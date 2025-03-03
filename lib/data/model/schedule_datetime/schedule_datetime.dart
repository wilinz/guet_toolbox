import 'package:guethub/data/model/semesters/semesters.dart';
import 'package:guethub/data/model/term/term.dart';

class ScheduleDatetime {
  Term? term;
  Semester? semester;
  DateTime dateTime;
  int week;
  int weekDay;

  ScheduleDatetime(
      {this.term,
      this.semester,
      required this.dateTime,
      required this.week,
      required this.weekDay});

  bool isCurrentWeek() {
    final now = DateTime.now();
    final weekInYear0 = now.difference(DateTime(now.year)).inDays ~/ 7;
    final weekInYear1 = dateTime.difference(DateTime(now.year)).inDays ~/ 7;
    return weekInYear0 == weekInYear1;
  }

// factory ScheduleDatetime.fromJson(Map<String, dynamic> json) =>
//     _$ScheduleDatetimeFromJson(json);
}
