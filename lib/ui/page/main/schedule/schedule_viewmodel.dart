import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guettoolbox/data/model/index.dart';
import 'package:guettoolbox/data/model/schedule_datetime/schedule_datetime.dart';
import 'package:guettoolbox/data/model/term/term_response.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:kt_dart/kt.dart';

class ScheduleViewModel extends ChangeNotifier {
  List<Term> termList = List.empty();
  Term? _currentTerm;

  set currentTerm(Term? value) {
    _currentTerm = value;
  }

  Term? get currentTerm => _currentTerm;


  ScheduleDatetime? scheduleDatetime;

  List<String> dateList = List.filled(7, "");
  var weekday = 1;

  getWeekday(DateTime dateTime) {
    var monday = 1;
    var mondayTime = dateTime;

    //获取本周星期一是几号
    while (mondayTime.weekday != monday) {
      mondayTime = mondayTime.subtract(new Duration(days: 1));
    }

    mondayTime.year; //2020 年
    mondayTime.month; //6(这里和js中的月份有区别，js中是从0开始，dart则从1开始，我们无需再进行加一处理) 月
    mondayTime.day; //6 日
    // nowTime.hour ;//6 时
    // nowTime.minute ;//6 分
    // nowTime.second ;//6 秒
    for (int i = 0; i < 7; i++) {
      dateList[i]=(
          mondayTime.month.toString() + "/" + (mondayTime.day + i).toString());
      if ((mondayTime.day + i) == dateTime.day) {
        weekday = i + 1;
      }
    }
  }

  // int _currentWeek = 0;

  // int get currentWeek => _currentWeek;

  // DateTime _currentDateTime = DateTime.now();

  // DateTime get currentDateTime => _currentDateTime;

  // setCurrentWeek(Term term, DateTime dateTime) {
  //   // _currentWeek = CourseRepository.getInstance().getWeek(term, dateTime);
  // }

  toTerm(Term term) {
    update(term.startDate, term: term);
  }

  toToday() {
    update(DateTime.now());
  }

  toNextWeek() {
    // _currentWeek += 1;
    // _currentDateTime = currentDateTime.add(Duration(days: 7));
    // setDate();
    // getCourseList(currentTerm!.term);
    scheduleDatetime?.let((it) {
      update(it.dateTime.add(Duration(days: 7)));
    });
  }

  toPreviousWeek() {
    // _currentWeek -= 1;
    // _currentDateTime = currentDateTime.subtract(Duration(days: 7));
    // setDate();
    // getCourseList(currentTerm!.term);
    scheduleDatetime?.let((it) {
      update(it.dateTime.subtract(Duration(days: 7)));
    });
  }

  var currentWeekdayIndex = 0;

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

  List<List<SemesterSchedule>> courseList = [];

  update(DateTime dateTime, {Term? term}) async {
    getWeekday(dateTime);
    Term currentTerm;
    if (term == null) {
      if (this.currentTerm == null) {
        final terms = await getTerms();
        _currentTerm =
            CourseRepository.getInstance().getCurrentTerm(terms, true);
      }
      currentTerm = this.currentTerm!;
    } else {
      currentTerm = term;
    }

    final week = CourseRepository.getInstance().getWeek(currentTerm, dateTime);
    scheduleDatetime = ScheduleDatetime(
        term: currentTerm,
        dateTime: dateTime,
        week: week,
        weekDay: getWeekday1(DateTime.now()));
    await getCourseList(currentTerm.term, week);
    notifyListeners();
  }

  int getWeekday1(DateTime dateTime) {
    var monday = 1;
    var mondayTime = dateTime;

    //获取本周星期一是几号
    while (mondayTime.weekday != monday) {
      mondayTime = mondayTime.subtract(new Duration(days: 1));
    }

    mondayTime.year; //2020 年
    mondayTime.month; //6(这里和js中的月份有区别，js中是从0开始，dart则从1开始，我们无需再进行加一处理) 月
    mondayTime.day; //6 日
    // nowTime.hour ;//6 时
    // nowTime.minute ;//6 分
    // nowTime.second ;//6 秒
    for (int i = 0; i < 7; i++) {
      if ((mondayTime.day + i) == dateTime.day) {
        return i + 1;
      }
    }
    return 1;
  }

  Future<List<Term>> getTerms() {
    return CourseRepository.getInstance().getTermList().then((terms) async {
      termList = terms;
      return terms;
    });
  }

  Future<List<SemesterSchedule>> getCourseList(String term, int week) {
    return CourseRepository.getInstance()
        .getSemesterSchedule(term)
        .then((value) {
      courseList.clear();
      for (var i = 0; i < 35; i++) {
        var column = (i + 1) % 7;
        if (column == 0) column = 7;
        var row = i ~/ 7 + 1;
        var courses = value
            .where((e) =>
                e.weekday == column &&
                e.section == row &&
                e.startWeek <= week &&
                e.endWeek >= week)
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
