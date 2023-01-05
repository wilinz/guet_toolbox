
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/service/term.dart';

import '../model/term_response.dart';
import '../service/course.dart';

class CourseRepository {
  Future<List<Term>> getTermList() => TermService.getTermList();

  Future<List<Course>> getCourseList(String term) => CourseService.getCourseList(term);

  CourseRepository._create();

  static final _instance = CourseRepository._create();

  factory CourseRepository() => _instance;
}
