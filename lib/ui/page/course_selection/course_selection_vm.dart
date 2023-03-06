import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/academy/academy_response.dart';
import 'package:guettoolbox/data/model/common/common_response.dart';
import 'package:guettoolbox/data/model/majors/majors_response.dart';
import 'package:guettoolbox/data/model/plan_course/plan_course_detail_response.dart';
import 'package:guettoolbox/data/model/plan_course/plan_course_response.dart';
import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/model/term/term.dart';
import 'package:guettoolbox/data/repository/academy.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/data/repository/majors.dart';
import 'package:guettoolbox/data/repository/student_info.dart';
import 'package:guettoolbox/data/service/course.dart';
import 'package:guettoolbox/data/service/student_info.dart';
import 'package:guettoolbox/util/list.dart';
import 'package:lpinyin/lpinyin.dart';

typedef Filter<T> = bool Function(T value);

class CourseSelectionViewModel extends ChangeNotifier {
  StudentInfo? studentInfo;

  List<Term> terms = [];
  List<Academy> academy = [];
  List<Major> major = [];
  List<PlanCourse> planCourses = [];
  List<PlanCourse> planCoursesBackup = [];
  List<int> grades = CourseRepository.getInstance().getLastSixYears();
  Map<String, Filter<PlanCourse>> filterGroup = {};

  filter(String key, Filter<PlanCourse> filter) {
    filterGroup[key] = filter;
    _filter();
  }

  void _filter() {
    planCourses = planCoursesBackup.where((e) {
      bool result = true;
      filterGroup.forEach((k, f) {
        result = result & f(e);
      });
      return result;
    }).toList();
  }

  undoFilter(String key) {
    filterGroup.remove(key);
    _filter();
  }

  Term? _currentTerm;

  Term? get currentTerm => _currentTerm;

  int? _currentGrade;

  int? get currentGrade => _currentGrade;

  set currentGrade(int? v) {
    _currentGrade = v;
    notifyListeners();
  }

  set currentTerm(Term? value) {
    _currentTerm = value;
    notifyListeners();
  }

  Academy? _currentAcademy;

  Academy? get currentAcademy => _currentAcademy;

  set currentAcademy(Academy? value) {
    _currentAcademy = value;
    notifyListeners();
  }

  Major? _currentMajor;

  Major? get currentMajor => _currentMajor;

  set currentMajor(Major? value) {
    _currentMajor = value;
    notifyListeners();
  }

  Future<List<Major>> getMajors() async {
    return MajorsRepository.getInstance().getMajors().then((value) {
      value.sort((a, b) {
        return a.shortPinyin.compareTo(b.shortPinyin);
      });
      major = value;
      notifyListeners();
      return value;
    });
  }

  Future<List<Academy>> getAcademy() async {
    return AcademyRepository.getInstance().getAcademy().then((value) {
      academy = value;
      notifyListeners();
      return value;
    });
  }

  Future<List<Term>> getTermList() {
    return CourseRepository.getInstance().getTermList().then((value) {
      terms = value;
      notifyListeners();
      return value;
    });
  }

  Future<StudentInfo> getStudentInfo() async {
    return StudentInfoRepository.getInstance().getStudentInfo().then((value) {
      studentInfo = value;
      currentTerm = terms.firstWhereOrNull((e) => e.term == value.term);
      currentGrade = int.parse(value.grade);
      notifyListeners();
      return value;
    });
  }

  Future<CommonResponse> select(PlanCourseDetail planCourseDetail) async {
    return CourseRepository.getInstance().select(planCourseDetail.copyWith(term: currentTerm!.term));
  }

  Future<CommonResponse> unselect(PlanCourseDetail planCourseDetail) async {
    return CourseRepository.getInstance().unselect(planCourseDetail.copyWith(term: currentTerm!.term));
  }

  Future<List<PlanCourseDetail>> getDetail(PlanCourse planCourse) {
    return CourseRepository.getInstance()
        .getPlanCourseDetail(planCourse.id, planCourse.courseid)
        .then((value) {
      planCourse.details = value;
      planCourse.isExpand = true;
      notifyListeners();
      return value;
    });
  }

  Future<List<PlanCourse>> getPlan(
      {required String term,
      required String grade,
      required String dptno,
      required String spno,
      bool networkCourseOnly = false}) async {
    planCourses.clear();
    planCoursesBackup.clear();
    return CourseRepository.getInstance()
        .getPlan(term, grade, dptno, spno)
        .then((planCourses) async {
      this.planCourses = planCourses;
      this.planCoursesBackup = planCourses;

      if (networkCourseOnly) {
        filter("networkFilter", (e) {
          return e.cname.contains("网络");
        });
      } else {
        undoFilter("networkFilter");
      }
      // notifyListeners();
      // planCourses.forEach((planCourse) {
      //   if (networkCourseOnly && !planCourse.cname.contains("网络")) return;
      //   getDetail(planCourse);
      // });
      notifyListeners();
      return planCourses;
    });
  }
}
