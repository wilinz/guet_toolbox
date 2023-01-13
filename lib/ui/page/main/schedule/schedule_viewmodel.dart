import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/index.dart';
import 'package:guettoolbox/data/model/term_response.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/util/datetime.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<Term> termList = List.empty();
  Term? _currentTerm;

  Term? get currentTerm => _currentTerm;

  final colorsMap = {};
  List<Color> colors = [
    Color(0xFF03DAC5), // Vivid Cyan
    Color(0xFF00B0FF), // Vivid Sky Blue
    Color(0xFF00E5FF), // Vivid Light Blue
    Color(0xFF1DE9B6), // Vivid Green
    Color(0xFF00E676), // Vivid Light Green
    Color(0xFF76FF03), // Vivid Lime
    Color(0xFFFFEA00), // Vivid Amber
    Color(0xFFB388FF), // Vivid Purple
    Color(0xFF00E5FF), // Vivid Light Blue
    Color(0xFF00B8D4), // Vivid Cyan
    Color(0xFF00BFA5), // Vivid Teal
    Color(0xFF00C853), // Vivid Lime
    Color(0xFF64DD17), // Vivid Green
    Color(0xFFFFD600), // Vivid Yellow
    Color(0xFF0091EA), // Vivid Cyan
    Color(0xFF00B8D4), // Vivid Cyan
    Color(0xFF00BFA5), // Vivid Teal
    Color(0xFF00C853), // Vivid Lime
  ];

  ScheduleViewModel() {
    colorsBackup = List.of(colors);
  }

  List<Color> colorsBackup = [];

  set currentTerm(Term? value) {
    _currentTerm = value;
    notifyListeners();
  }

  List<List<SemesterSchedule>> courseList = [];

  Future<List<Term>> getData() {
    return CourseRepository.getInstance().getTermList().then((terms) async {
      termList = terms;
      try {
        currentTerm =
            CourseRepository.getInstance().getCurrentTerm(terms, true);
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

  Future<List<SemesterSchedule>> getCourseList(String term) {
    return CourseRepository.getInstance()
        .getSemesterSchedule(term)
        .then((value) {
      courseList.clear();
      for (var i = 0; i < 35; i++) {
        var column = (i + 1) % 7;
        if (column == 0) column = 7;
        var row = i ~/ 7 + 1;
        var courses = value
            .where((e) => e.weekday == column && e.section == row)
            .toList();
        courseList.add(courses);
        if (courses.isNotEmpty) {
          if (colorsMap[courses.first.courseNo] == null) {
            final index = Random().nextInt(colors.length);
            final color = colors[index];
            colorsMap[courses.first.courseNo] = color;
            colors.removeAt(index);
            if (colors.isEmpty) colors = colorsBackup;
          }
        }
      }
      notifyListeners();
      return value;
    });
  }
}
