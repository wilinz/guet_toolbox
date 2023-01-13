import 'package:dio/dio.dart';
import 'package:guettoolbox/data/model/course_lab_response.dart';
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/model/plan_course_detail_response.dart';
import 'package:guettoolbox/data/model/plan_course_response.dart';
import 'package:guettoolbox/data/model/semester_schedule.dart';
import 'package:guettoolbox/data/network.dart';
import 'package:guettoolbox/data/service/term.dart';
import 'package:guettoolbox/util/datetime.dart';
import 'package:guettoolbox/util/list.dart';

import '../model/common_response.dart';
import '../model/term_response.dart';
import '../service/course.dart';

class CourseRepository {
  Term getCurrentTerm(List<Term> terms, bool holidayForward) {
    final now = DateTime.now();
    final term = terms.firstWhereOrNull((e) =>
        DateTimeUtil.parseDate(e.startdate).isBefore(now) &&
        DateTimeUtil.parseDate(e.enddate).isAfter(now));
    if (term == null) {
      final sortedList = List.of(terms)
        ..sort((a, b) => DateTimeUtil.parseDate(a.startdate)
            .compareTo(DateTimeUtil.parseDate(b.startdate)));
      if (holidayForward) {
        final nextTerm = sortedList
            .firstWhere((e) => DateTimeUtil.parseDate(e.enddate).isAfter(now));
        return nextTerm;
      }
      final lastTerm = sortedList
          .lastWhere((e) => DateTimeUtil.parseDate(e.enddate).isBefore(now));
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

  Future<CommonResponse> select(PlanCourseDetail planCourseDetail) async {
    return CourseService.select(planCourseDetail);
  }

  Future<CommonResponse> unselect(PlanCourseDetail planCourseDetail) async {
    return CourseService.unselect(planCourseDetail);
  }

  List<Term> terms = [];

  Future<List<Term>> getTermList() async {
    if (terms.isNotEmpty) return terms;
    terms = await TermService.getTermList();
    return terms;
  }

  Future<List<Course>> getCourseList(String term) =>
      CourseService.getCourseList(term);

  Future<List<CourseLab>> getCourseLabList(String term) async {
    return CourseService.getCourseLabList(term);
  }

  final Map<String, List<SemesterSchedule>> semesterSchedules = {};

  Future<List<SemesterSchedule>> getSemesterSchedule(String term) async {
    final cache = semesterSchedules[term];
    if (cache != null) return cache;
    List responses =
        await Future.wait([getCourseList(term), getCourseLabList(term)]);
    semesterSchedules[term] =
        generateSemesterSchedule(responses[0], responses[1]);
    return semesterSchedules[term]!;
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
