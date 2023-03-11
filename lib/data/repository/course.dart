import 'package:dio/dio.dart';
import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/model/course/course_lab_response.dart';
import 'package:guettoolbox/data/model/course/course_response.dart';
import 'package:guettoolbox/data/model/course/semester_schedule.dart';
import 'package:guettoolbox/data/model/plan_course/plan_course_detail_response.dart';
import 'package:guettoolbox/data/model/plan_course/plan_course_response.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/term.dart';
import 'package:guettoolbox/util/list.dart';
import 'package:kt_dart/kt.dart';

import '../model/common/common_response.dart';
import '../service/course.dart';

class CourseRepository {
  Term? getCurrentTerm(List<Term> terms, bool holidayForward) {
    final now = DateTime.now();
    final term = terms.firstWhereOrNull(
        (e) => e.startDate.isBefore(now) && e.endDate.isAfter(now));
    if (term == null) {
      final sortedList = List.of(terms)
        ..sort((a, b) => a.startDate.compareTo(b.startDate));
      if (holidayForward) {
        final nextTerm = sortedList.firstWhereOrNull((e) => e.endDate.isAfter(now));
        return nextTerm;
      }
      final lastTerm = sortedList.lastWhereOrNull((e) => e.endDate.isBefore(now));
      return lastTerm;
    }
    return term;
  }

  List<int> getLastSixYears() {
    var currentYear = DateTime.now().year;
    var lastFiveYears = <int>[];

    for (var i = 0; i < 6; i++) {
      lastFiveYears.add(currentYear - i);
    }
    return lastFiveYears;
  }

  int getWeek(Term term, DateTime dateTime) {
    int week;
    if (dateTime.isAfter(term.startDate) && dateTime.isBefore(term.endDate)) {
      week = dateTime.difference(term.startDate).inDays ~/ 7 + 1;
    } else if (dateTime.isBefore(term.startDate)) {
      week = 0;
    } else {
      week = term.weekNum;
    }
    return week;
  }

  Future<CommonResponse> select(PlanCourseDetail planCourseDetail) async {
    return CourseService.select(planCourseDetail);
  }

  Future<CommonResponse> unselect(PlanCourseDetail planCourseDetail) async {
    return CourseService.unselect(planCourseDetail);
  }

  List<Term> terms = [];

  Future<List<Term>> getTermList() async {
    if (terms.isNotEmpty) return terms;
    final db = await getDatabase();
    terms = await db.termDao.getAll();
    if (terms.isNotEmpty) return terms;
    terms = await TermService.getTermList();
    // terms.forEach((term){
    //   db.termDao.insert(term);
    // });
    db.termDao.insertAll(terms);
    return terms;
  }

  Future<List<Course>> getCourseList(String term) =>
      CourseService.getCourseList(term);

  Future<List<CourseLab>> getCourseLabList(String term) async {
    return CourseService.getCourseLabList(term);
  }

  Future<List<SemesterSchedule>> getSemesterSchedule(String term) async {

    final db = await getDatabase();
    final dbCache = (await db.semesterScheduleDao.getAllByTerm(term));
    if (dbCache.isNotEmpty) {
      return dbCache;
    }

    // final dbCache = await db.semesterScheduleDao.getAll();
    // if (dbCache.isNotEmpty) return dbCache;
    List responses =
        await Future.wait([getCourseList(term), getCourseLabList(term)]);
    final user = await UserRepository.getInstance().getActiveUser();
    if (user == null) throw new Exception("未登录");
    final terms =
        generateSemesterSchedule(responses[0], responses[1], user.username);

    terms.forEach((e) async {

      final data = await db.semesterScheduleDao.find(e.id, user.username);
      if (data != null) {
        await db.semesterScheduleDao.updateSemesterSchedule(data);
      } else {
        await db.semesterScheduleDao.insertSemesterSchedule(e);
      }
    });
    return terms;
  }

  Future<List<PlanCourse>> getPlan(
    String term,
    String grade,
    String dptno,
    String spno,
  ) async {
    return CourseService.getPlan(term, grade, dptno, spno)
        .then((value) => value..sort((a, b) => a.tname.compareTo(b.tname)));
  }

  Future<List<PlanCourseDetail>> getPlanCourseDetail(
      String id, String courseid) async {
    return CourseService.getPlanCourseDetail(id, courseid);
  }

  CourseRepository._();

  static CourseRepository? _instance;

  factory CourseRepository.getInstance() => _instance ??= CourseRepository._();
}
