import 'package:dio/dio.dart';
import 'package:guettoolbox/data/model/course_lab_response.dart';
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/model/plan_course_response.dart';
import 'package:guettoolbox/data/model/semester_schedule.dart';
import 'package:guettoolbox/data/service/term.dart';

import '../model/term_response.dart';
import '../service/course.dart';

class CourseRepository {
  Future<List<Term>> getTermList() => TermService.getTermList();

  Future<List<Course>> getCourseList(String term) =>
      CourseService.getCourseList(term);

  Future<List<CourseLab>> getCourseLabList(String term) async {
    return CourseService.getCourseLabList(term);
  }

  Future<List<SemesterSchedule>> getSemesterSchedule(String term) async {
    List responses =
        await Future.wait([getCourseList(term), getCourseLabList(term)]);
    return generateSemesterSchedule(responses[0], responses[1]);
  }

  Future<List<PlanCourse>> getPlan(
    String term,
    String grade,
    String dptno,
    String spno,
  ) async {
    return CourseService.getPlan(term, grade, dptno, spno);
  }

  CourseRepository._();

  static CourseRepository? _instance;

  factory CourseRepository.getInstance() => _instance ??= CourseRepository._();
}
