import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/repository/course.dart';

import '../../../data/model/course.dart';
import '../../../data/model/term.dart';

class MainViewModel extends ChangeNotifier {
  List<Term> termList = List.empty();
  List<Course?> courseList = List.empty();

  Future<List<Term>> getTermList() {
    return CourseRepository().getTermList().then((value) {
      termList = value;
      notifyListeners();
      return value;
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
          course.croomno =
              courses.map((e) => e.croomno).where((e) => e != null).toSet().toList().join(",");
        }
        return course;
      });
      notifyListeners();
      return value;
    });
  }
}
