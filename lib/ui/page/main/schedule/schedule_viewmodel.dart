import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/course.dart';
import 'package:guettoolbox/data/model/term.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/util/datetime.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<Term> termList = List.empty();
  Term? _currentTerm;

  Term? get currentTerm => _currentTerm;

  set currentTerm(Term? value) {
    _currentTerm = value;
    notifyListeners();
  }

  List<Course?> courseList = List.empty();

  Future<List<Term>> getTermList() {
    return CourseRepository().getTermList().then((terms) async {
      termList = terms;
      currentTerm = terms.firstWhere((term) {
        var start = DateTimeUtil.parseDate(term.startdate);
        var end = DateTimeUtil.parseDate(term.enddate);
        var today = DateTime.now();
        return today.isAfter(start) && today.isBefore(end);
      });
      if (currentTerm != null) {
        await getCourseList(currentTerm!.term);
      }
      notifyListeners();
      return terms;
    });
  }

  Future<List<Course>> getCourseList(String term) {
    return CourseRepository().getCourseList(term).then((value) {
      courseList = List<Course?>.generate(35, (i) {
        var column = (i + 1) % 7;
        if (column == 0) column = 7;
        var row = i ~/ 7 + 1;

        var courses =
            value.where((e) => e.week == column && e.seq == row.toString());
        Course? course = null;
        if (courses.length > 0) {
          course = courses.first;
          course.croomno = courses
              .map((e) => e.croomno)
              .where((e) => e != null)
              .toSet()
              .toList()
              .join(",");
        }
        return course;
      });
      notifyListeners();
      return value;
    });
  }
}
