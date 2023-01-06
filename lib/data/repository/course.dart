import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/service/term.dart';

import '../model/term_response.dart';
import '../service/course.dart';

class CourseRepository {
  Future<List<Term>> getTermList() => TermService.getTermList();

  Future<List<Course>> getCourseList(String term) =>
      CourseService.getCourseList(term);

  Future<String> getPlan(
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
