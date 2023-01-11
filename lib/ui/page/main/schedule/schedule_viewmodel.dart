import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/model/index.dart';
import 'package:guettoolbox/data/model/term_response.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/util/datetime.dart';
import 'package:guettoolbox/util/list.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<Term> termList = List.empty();
  Term? _currentTerm;

  Term? get currentTerm => _currentTerm;

  final colors = [
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.greenAccent,
    Colors.red,
    Colors.lightBlueAccent,
    Colors.lightGreen,
    Colors.tealAccent
  ];

  set currentTerm(Term? value) {
    _currentTerm = value;
    notifyListeners();
  }

  List<SemesterSchedule?> courseList = List.empty();

  Future<List<Term>> getTermList() {
    return CourseRepository.getInstance().getTermList().then((terms) async {
      termList = terms;
      try {
        currentTerm = terms.firstWhere((term) {
          var start = DateTimeUtil.parseDate(term.startdate);
          var end = DateTimeUtil.parseDate(term.enddate);
          var today = DateTime.now();
          return today.isAfter(start) && today.isBefore(end);
        });
      } catch (e) {
        print(e);
      }
      if (currentTerm != null) {
        await getCourseList(currentTerm!.term);
      }
      notifyListeners();
      return terms;
    });
  }

  Future<List<SemesterSchedule?>> getCourseList(String term) {
    return CourseRepository.getInstance()
        .getSemesterSchedule(term)
        .then((value) {
      courseList = List<SemesterSchedule?>.generate(35, (i) {
        var column = (i + 1) % 7;
        if (column == 0) column = 7;
        var row = i ~/ 7 + 1;

        var course = value.firstWhereOrNull((e) =>
            e.lessons.any((e) => e.weekday == column && e.section == row));


        return course;
      });
      notifyListeners();
      return value;
    });
  }
}
