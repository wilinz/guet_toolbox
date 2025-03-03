import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guethub/data/model/course/semester_schedule.dart';
import 'package:guethub/data/model/exam_schedule/exam_schedule.dart';
import 'package:guethub/data/model/schedule_datetime/schedule_datetime.dart';
import 'package:guethub/data/model/semesters/semesters.dart';
import 'package:guethub/data/model/term/term.dart';
import 'package:guethub/data/model/user/user.dart';
import 'package:guethub/data/repository/course.dart';
import 'package:guethub/data/repository/exam_schedule_repository.dart';
import 'package:guethub/data/repository/login.dart';
import 'package:guethub/data/repository/user.dart';
import 'package:guethub/data/util/lunar.dart';
import 'package:guethub/logger.dart';
import 'package:guethub/ui/util/toast.dart';
import 'package:guethub/util/datetime.dart';
import 'package:guethub/util/ext.dart';
import 'package:kt_dart/kt.dart';

class ScheduleViewModel extends GetxController {
  final newSystemMode = true.obs;

  @Deprecated('Old system')
  final termList = List<Term>.empty().obs;
  @Deprecated('Old system')
  final currentTerm = Rx<Term?>(null);

  final semesters = List<Semester>.empty().obs;
  final currentSemester = Rx<Semester?>(null);

  final scheduleDatetime = Rx<ScheduleDatetime?>(null);
  final dateList = List.filled(7, "").obs;
  final weekday = 1.obs;
  var currentWeekdayIndex = 0.obs;
  final colorsMap = {}.obs;
  final courseList = RxList<List<SemesterSchedule>>.empty(growable: true);
  final courseListIsEmpty = true.obs;
  final updateDateTime = Rx<DateTime?>(null);
  final updateDateTimeText = "".obs;
  var weekdayList = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
  final isSyncing = false.obs;
  final isHideToggleSystemModeUI = false.obs;
  var isCheckSyncUpdateDateTime = true;
  final Map<int, List<HolidayInfo>> holidayInfo = {};
  final isAutoAdjustHoliday = true.obs;
  final isThisWeek = false.obs;

  // final List<Color> colors = [
  //   Color(0xFF00c096),
  //   Color(0xFF00a7f5),
  //   Color(0xFFB388FF),
  //   Color(0xFFff688a),
  //   Color(0xffffb820),
  //   Color(0xff00c060),
  //   Color(0xff0097f5),
  //   Color(0xFFA688FF),
  //   Color(0xffff687a),
  //   Color(0xffff7d20),
  // ];
  final List<Color> colors = [
    Color(0xff00d3a1),
    Color(0xff00bcf5),
    Color(0xFFB388FF),
    Color(0xffff689d),
    // Color(0xfffbba40),
    Color(0xff00c060),
    Color(0xff0097f5),
    Color(0xFF8C88FF),
    Color(0xffff687a),
    // Color(0xfffaa633),
  ];

  final cornerColorMap = {
    Color(0xff00d3a1): Color(0xffff687a),
    Color(0xff00bcf5): Color(0xffff687a),
    Color(0xFFB388FF): Color(0xff00c060),
    Color(0xffff689d): Color(0xff00c060),
    Color(0xff00c060): Color(0xffff687a),
    Color(0xff0097f5): Color(0xffff687a),
    Color(0xFF8C88FF): Color(0xff00c060),
    Color(0xffff687a): Color(0xff00c060),
  };

  StreamSubscription<User>? onLoginEvent;
  StreamSubscription? onDatabaseChangeEvent;

  Timer? timer;

  @override
  Future<void> onInit() async {
    super.onInit();
    // timer = Timer.periodic(Duration(seconds: 30), (timer) {
    //   updateColorScheme();
    // });

    courseList.listen((list) {
      courseListIsEmpty.value =
          list.firstWhereOrNull((e) => e.isNotEmpty) == null;
    });

    scheduleDatetime.listen((it) {
      if(currentSemester.value != null) {
        var week = CourseRepository.get()
            .getWeekNew(currentSemester.value!, DateTime.now());
        isThisWeek.value = week == it?.week;
      }else if (currentTerm.value != null){
        var week = CourseRepository.get()
            .getWeek(currentTerm.value!, DateTime.now());
        isThisWeek.value = week == it?.week;
      }
    });
    onLoginEvent = LoginRepository.get().onLoginEvent.listen((user) async {
      logger.d("登录成功，正在同步课程表");
      if (user.isOnlyUseOldSystem) {
        this.newSystemMode.value = false;
        isHideToggleSystemModeUI.value = true;
      } else if (user.isOnlyUseNewSystem()) {
        this.newSystemMode.value = true;
        isHideToggleSystemModeUI.value = true;
      } else {
        this.newSystemMode.value = true;
        isHideToggleSystemModeUI.value = false;
      }
      loadData(isFlush: true);
    });

    onDatabaseChangeEvent =
        CourseRepository.get().onDatabaseChangeEvent.listen((_) {
      scheduleDatetime.value?.let((it) {
        updateData(it.dateTime,
            isSkipEmptyStartWeek: false, isToggleWeek: false);
      });
    });

    updateDateTime.listen((it) {
      updateDateTimeText.value =
          updateDateTime.value?.timeAgoString(suffix: "前") ?? "";
      if (isCheckSyncUpdateDateTime && it != null) {
        isCheckSyncUpdateDateTime = false;
        final timeDifference = DateTime.now().difference(it);
        if (timeDifference.inHours >= 12) {
          loadData(isFlush: true);
        }
      }
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateDateTimeText.value =
          updateDateTime.value?.timeAgoString(suffix: "前") ?? "";
    });

    loadIfUserExist();
  }

  Future<void> loadIfUserExist() async {
    try {
      final user = await UserRepository.get().getActiveUser();
      if (user != null) {
        if (user.isOnlyUseOldSystem) {
          this.newSystemMode.value = false;
          isHideToggleSystemModeUI.value = true;
        } else if (user.isOnlyUseNewSystem()) {
          this.newSystemMode.value = true;
          isHideToggleSystemModeUI.value = true;
        } else {
          this.newSystemMode.value = true;
          isHideToggleSystemModeUI.value = false;
        }
        loadData(isFlush: false);
        // await Future.delayed(Duration(seconds: 2));
        // loadData(isFlush: true);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  loadData({required bool isFlush}) async {
    try {
      if (isFlush) {
        isSyncing.value = true;
      }

      await getSemesters(isFlush: isFlush);
      if (!newSystemMode.value) {
        final term = currentTerm.value;
        if (isCurrentTerm()) {
          await updateToToday(isFlush: isFlush);
        } else {
          await toTerm(term, isFlush: isFlush);
        }
      } else {
        final semester = currentSemester.value;
        if (isCurrentSemester()) {
          await updateToToday(isFlush: isFlush);
        } else {
          await toSemester(semester, isFlush: isFlush);
        }
      }
    } finally {
      if (isFlush) {
        isSyncing.value = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    onLoginEvent?.cancel();
    onDatabaseChangeEvent?.cancel();
    timer?.cancel();
  }

  Future<void> toggleAutoAdjustHoliday() async {
    isAutoAdjustHoliday.toggle();
    loadData(isFlush: false);
  }

  getWeekday(DateTime dateTime, List<AdjustedWorkday> allAdjWorkday,
      List<int> weekDaysOfHoliday) {
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
      final targetDate = mondayTime.add(Duration(days: i));
      var text = ("${targetDate.month}/${targetDate.day}");
      if (allAdjWorkday
          .any((e) => e.adjustedWorkday.dateOnly == targetDate.dateOnly)) {
        text += "/调";
      } else if (weekDaysOfHoliday.contains(i + 1)) {
        text += "/假";
      }
      dateList[i] = text;
      // if ((mondayTime.day + i) == dateTime.day) {
      //   weekday.value = i + 1;
      // }
    }
    weekday.value = DateTime.now().weekday;
  }

  // int _currentWeek = 0;

  // int get currentWeek => _currentWeek;

  // DateTime _currentDateTime = DateTime.now();

  // DateTime get currentDateTime => _currentDateTime;

  // setCurrentWeek(Term term, DateTime dateTime) {
  //   // _currentWeek = CourseRepository.getInstance().getWeek(term, dateTime);
  // }

  Future<void> getSemesters({required bool isFlush}) async {
    if (newSystemMode.value) {
      await getSemester(isFlush: isFlush);
    } else {
      await getTerms(isFlush: isFlush);
    }
  }

  isCurrentTerm() {
    return currentTerm.value?.term ==
        CourseRepository.get().getCurrentTerm(termList, true)?.term;
  }

  toTerm(Term? term, {bool isFlush = false}) async {
    await updateData(term?.startDate ?? DateTime.now(),
        term: term, isFlush: isFlush);
  }

  isCurrentSemester() =>
      currentSemester.value?.id ==
      CourseRepository.get().getCurrentSemester(semesters, true)?.id;

  toSemester(Semester? semester, {bool isFlush = false}) async {
    await updateData(semester?.startDate ?? DateTime.now(),
        semester: semester, isFlush: isFlush);
  }

  updateToToday({bool isFlush = false}) async {
    await updateData(DateTime.now(), isFlush: isFlush);
  }

  toNextWeek() {
    // _currentWeek += 1;
    // _currentDateTime = currentDateTime.add(Duration(days: 7));
    // setDate();
    // getCourseList(currentTerm!.term);
    scheduleDatetime.value?.let((it) {
      updateData(it.dateTime.add(Duration(days: 7)),
          isSkipEmptyStartWeek: false, isToggleWeek: true);
    });
  }

  updateColorScheme() {
    colorsMap.clear();
    final colors = List.of(this.colors)..rotateFromRandomIndex();
    for (var courses in courseList) {
      if (courses.isNotEmpty) {
        if (colorsMap[courses.first.courseNo] == null) {
          final color = colors.first;
          colorsMap[courses.first.courseNo] = color;
          colors.remove(color);
          if (colors.isEmpty)
            colors.addAll(List.of(this.colors)..rotateFromRandomIndex());
        }
      }
    }
  }

  toPreviousWeek() {
    // _currentWeek -= 1;
    // _currentDateTime = currentDateTime.subtract(Duration(days: 7));
    // setDate();
    // getCourseList(currentTerm!.term);
    scheduleDatetime.value?.let((it) {
      updateData(it.dateTime.subtract(Duration(days: 7)),
          isSkipEmptyStartWeek: false, isToggleWeek: true);
    });
  }

  final isUpdating = false.obs;

  updateData(DateTime dateTime,
      {Term? term,
      Semester? semester,
      bool isFlush = false,
      bool isSkipEmptyStartWeek = true,
      bool isToggleWeek = false}) async {
    if (isUpdating.value) {
      return;
    }
    isUpdating.value = true;
    try {
      if (newSystemMode.value) {
        Semester currentSemester;
        if (semester == null) {
          if (this.currentSemester.value == null || isFlush) {
            final semester = await getSemester(isFlush: isFlush);
            this.currentSemester.value =
                CourseRepository.get().getCurrentSemester(semester, true);
          }
          if (this.currentSemester.value == null) throw Exception("获取学期失败");
          currentSemester = this.currentSemester.value!;
        } else {
          currentSemester = semester;
        }

        if (dateTime.isBefore(this.currentSemester.value!.startDate)) {
          dateTime = this.currentSemester.value!.startDate;
        }

        if (dateTime.isAfter((this.currentSemester.value!.endDate))) {
          if (dateTime.difference(this.currentSemester.value!.endDate).inDays >
              30) {
            dateTime = this.currentSemester.value!.startDate;
          } else {
            dateTime = this.currentSemester.value!.endDate;
          }
        }

        var week = CourseRepository.get().getWeekNew(currentSemester, dateTime);

        if (isToggleWeek && week == this.scheduleDatetime.value?.week) {
          return;
        }

        await updateCourseList(
            semester: currentSemester,
            week: week,
            isFlush: isFlush,
            isSkipEmptyStartWeek: isSkipEmptyStartWeek,
            onWeekChange: (newWeek) {
              final newDateTime =
                  dateTime.add(Duration(days: (newWeek - week) * 7));
              week = newWeek;
              dateTime = newDateTime;
              return dateTime;
            },
            dateTime: dateTime);
        final scheduleDatetime = ScheduleDatetime(
            semester: currentSemester,
            dateTime: dateTime,
            week: week,
            weekDay: getWeekday1(DateTime.now()));
        this.scheduleDatetime.value = scheduleDatetime;
      } else {
        Term currentTerm;
        if (term == null) {
          if (this.currentTerm.value == null || isFlush) {
            final terms = await getTerms(isFlush: isFlush);
            this.currentTerm.value =
                CourseRepository.get().getCurrentTerm(terms, true);
          }
          if (this.currentTerm.value == null) throw Exception("");
          currentTerm = this.currentTerm.value!;
        } else {
          currentTerm = term;
        }

        if (dateTime.isBefore(this.currentTerm.value!.startDate)) {
          dateTime = this.currentTerm.value!.startDate;
        }

        if (dateTime.isAfter((this.currentTerm.value!.endDate))) {
          if (dateTime.difference(this.currentTerm.value!.endDate).inDays >
              30) {
            dateTime = this.currentTerm.value!.startDate;
          } else {
            dateTime = this.currentTerm.value!.endDate;
          }
        }

        var week = CourseRepository.get().getWeek(currentTerm, dateTime);

        if (isToggleWeek && week == this.scheduleDatetime.value?.week) {
          return;
        }

        await updateCourseList(
            term: currentTerm.term,
            week: week,
            isFlush: isFlush,
            isSkipEmptyStartWeek: isSkipEmptyStartWeek,
            onWeekChange: (newWeek) {
              final newDateTime =
                  dateTime.add(Duration(days: (newWeek - week) * 7));
              week = newWeek;
              dateTime = newDateTime;
              return dateTime;
            },
            dateTime: dateTime);

        final scheduleDatetime = ScheduleDatetime(
            term: currentTerm,
            dateTime: dateTime,
            week: week,
            weekDay: getWeekday1(DateTime.now()));

        this.scheduleDatetime.value = scheduleDatetime;
      }
      if (isFlush) {
        toastSuccess(message: "同步成功");
      }
    } catch (e, st) {
      logger.e(e);
      logger.d(st);
      if (isFlush) {
        toastFailure(message: "同步失败：${e}");
      }
    } finally {
      isUpdating.value = false;
    }
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

  @Deprecated('Old system')
  Future<List<Term>> getTerms({required bool isFlush}) async {
    final terms = await CourseRepository.get().getTermList(isFlush: isFlush);
    termList.value = terms;
    return terms;
  }

  Future<List<Semester>> getSemester({bool isFlush = false}) async {
    final semester =
        await CourseRepository.get().getSemesters(isFlush: isFlush);
    this.semesters.value = semester;
    return semester;
  }

  List<HolidayInfo> getHolidayInfo(int year) {
    final holidayInfoCache = this.holidayInfo[year];
    if (holidayInfoCache == null) {
      final holidayInfo = getYearHolidays(year);
      this.holidayInfo[year] = holidayInfo;
      return holidayInfo;
    }
    return holidayInfoCache;
  }

  updateCourseList(
      {String? term,
      Semester? semester,
      required int week,
      required DateTime Function(int week) onWeekChange,
      required bool isFlush,
      required bool isSkipEmptyStartWeek,
      required DateTime dateTime}) async {
    List<SemesterSchedule> value;
    List<ExamSchedule>? examSchedule;
    if (newSystemMode.value) {
      Future<List<ExamSchedule>> getExamScheduleNewOrEmpty(
          {required bool isFlush}) async {
        try {
          return await ExamScheduleRepository.get()
              .getExamScheduleNew(isFlush: isFlush);
        } catch (e) {
          toastFailure0('没有查询到考试安排信息: $e');
          logger.e(e);
          return [];
        }
      }

      Future<List<SemesterSchedule>> getSemesterScheduleNewOrEmpty(
          Semester semester,
          {bool isFlush = false}) async {
        try {
          return await CourseRepository.get()
              .getSemesterScheduleNew(semester, isFlush: isFlush);
        } catch (e) {
          toastFailure0('查询课程信息出错: $e');
          logger.e(e);
          return [];
        }
      }

      final asyncData = await Future.wait([
        getSemesterScheduleNewOrEmpty(semester!, isFlush: isFlush),
        getExamScheduleNewOrEmpty(isFlush: isFlush)
      ]);
      value = asyncData[0] as List<SemesterSchedule>;
      examSchedule = asyncData[1] as List<ExamSchedule>;

      examSchedule = examSchedule.map((e) {
        final week = CourseRepository.get().getWeekNew(semester, dateTime);
        e.week = week;
        return e;
      }).toList();
    } else {
      value = await CourseRepository.get()
          .getSemesterSchedule(term!, isFlush: isFlush);
    }

    if (value.isNotEmpty && isSkipEmptyStartWeek) {
      final minStartWeek = value.kt.minOf((e) => e.startWeek);
      if (minStartWeek > week) {
        week = minStartWeek;
        dateTime = onWeekChange(week);
      }
    }

    final isAutoAdjustHoliday = this.isAutoAdjustHoliday.value;
    List<AdjustedWorkday> allAdjWorkday = [];
    List<int> weekDaysOfHoliday = [];
    if (isAutoAdjustHoliday) {
      final holidayInfo =
          getHolidayInfo(dateTime.year) + getHolidayInfo(dateTime.year + 1);
      final weekDates = getWeekDates(dateTime);
      final allHolidays = holidayInfo.expand((e) => e.holidayDates).toList();

      weekDaysOfHoliday = weekDates
          .where((e) => allHolidays.contains(e))
          .map((e) => e.weekday)
          .toList();

      final allAdjustedMapping =
          holidayInfo.expand((e) => e.adjustedMapping).toList();

      DateTime getStartOfWeek(DateTime date) {
        // 确定自然周的周一（假设周一为一周的开始）
        return date.subtract(Duration(days: date.weekday - 1));
      }

      int calculateWeek(
          DateTime originalDay, DateTime dateTime, int currentWeek) {
        // 获取 originalDay 和 dateTime 各自所在自然周的周一
        DateTime originalWeekStart = getStartOfWeek(originalDay).dateOnly;
        DateTime currentWeekStart = getStartOfWeek(dateTime).dateOnly;

        // 计算两个日期之间的周数差
        int weekDifference =
            originalWeekStart.difference(currentWeekStart).inDays ~/ 7;

        // 通过周数差调整当前的周数，得到 originalWeek
        return currentWeek + weekDifference;
      }

      allAdjWorkday = allAdjustedMapping.where((e) {
        return weekDates.contains(e.adjustedWorkday);
      }).map((e) {
        e.originalWeek = calculateWeek(e.originalDay, dateTime, week);
        e.adjustedWeek = calculateWeek(e.adjustedWorkday, dateTime, week);
        return e;
      }).toList();
    }

    updateDateTime.value = value
        .firstOrNullWhere((e) => e.source != SemesterScheduleSource.manual)
        ?.updateTime;
    courseList.clear();
    for (var i = 0; i < 35; i++) {
      var column = (i + 1) % 7;
      if (column == 0) column = 7;
      var row = i ~/ 7 + 1;

      // 获取课程时处理调休
      final courses = value.where((e) {
        if (!isAutoAdjustHoliday) {
          return e.weekday == column &&
              e.section == row &&
              e.startWeek <= week &&
              e.endWeek >= week;
        }

        // 如果调整后的周数与天数等于今天，则今天为调休工作日
        final adjustedWorkdayList = allAdjWorkday
            .where((adj) =>
                adj.adjustedWorkday.weekday == column &&
                adj.adjustedWeek == week)
            .toList();

        final isAdjustedWorkday = adjustedWorkdayList.isNotEmpty;

        bool isAdjustedWorkdaySection = adjustedWorkdayList.any((adj) =>
            e.section == row &&
            e.weekday == adj.originalDay.weekday &&
            e.startWeek <= adj.originalWeek &&
            e.endWeek >= adj.originalWeek &&
            isAdjustedWorkday);

        if (isAdjustedWorkday) {
          return isAdjustedWorkdaySection;
        } else {
          // 获取正常课程或调休后的课程
          return (!weekDaysOfHoliday.contains(column) &&
              e.weekday == column &&
              e.section == row &&
              e.startWeek <= week &&
              e.endWeek >= week);
        }
      }).toList(growable: true);

      if (newSystemMode.value) {
        final currentExamSchedule = examSchedule!
            .where((e) {
              return (getMondayOfTheWeek(e.startTime!) ==
                      getMondayOfTheWeek(dateTime)) &&
                  e.week == week &&
                  e.weekday == column &&
                  e.section == row;
            })
            .map((e) => SemesterSchedule.fromExamSchedule(e))
            .toList();
        courses.addAll(currentExamSchedule);
      }

      courseList.add(courses);
      // todo
      // var noDisplayCourses = value
      //     .where((e) =>
      //         e.weekday == column &&
      //         e.section == row &&
      //         (e.startWeek > week || e.endWeek < week))
      //     .toList();

      updateColorScheme();
      getWeekday(dateTime, allAdjWorkday, weekDaysOfHoliday);
    }
  }
}

List<DateTime> getWeekDates(DateTime date) {
  // 获取日期的周一，并去除时间部分
  DateTime monday = DateTime(date.year, date.month, date.day)
      .subtract(Duration(days: date.weekday - 1));

  // 创建一周的日期列表，去除时间部分
  List<DateTime> weekDates = List<DateTime>.generate(7, (index) {
    DateTime day = monday.add(Duration(days: index));
    return DateTime(day.year, day.month, day.day); // 只保留年月日
  });

  return weekDates;
}

extension DateOnly on DateTime {
  // 扩展函数，用于去除 DateTime 对象的时间部分
  DateTime get dateOnly {
    return DateTime(this.year, this.month, this.day);
  }
}
