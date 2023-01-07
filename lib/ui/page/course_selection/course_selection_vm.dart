import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/academy_response.dart';
import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/model/plan_course_detail_response.dart';
import 'package:guettoolbox/data/model/plan_course_response.dart';
import 'package:guettoolbox/data/model/student_info.dart';
import 'package:guettoolbox/data/model/term_response.dart';
import 'package:guettoolbox/data/repository/academy.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/data/repository/majors.dart';
import 'package:guettoolbox/data/service/course.dart';
import 'package:guettoolbox/data/service/student_info.dart';

typedef Filter<T> = bool Function(T value);

class CourseSelectionViewModel extends ChangeNotifier {
  StudentInfo? studentInfo;

  List<Term> terms = [];
  List<Academy> academy = [];
  List<Major> major = [];
  List<PlanCourse> planCourses = [];

  Set<Filter<PlanCourseDetail>> filterGroup = {};

  filter(Filter<PlanCourseDetail> filter) {
    filterGroup.add(filter);
    _filter();
  }

  void _filter() {
    details = detailsBackup.where((e) {
      bool result = true;
      filterGroup.forEach((f) {
        result = result & f(e);
      });
      return result;
    }).toList();
  }

  undoFilter(Filter<PlanCourseDetail> filter) {
    filterGroup.remove(filter);
    _filter();
  }

  Term? _currentTerm;

  Term? get currentTerm => _currentTerm;

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
    return StudioInfoService.get().then((value) {
      studentInfo = value;
      notifyListeners();
      return value;
    });
  }

  List<PlanCourseDetail> details = [];
  List<PlanCourseDetail> detailsBackup = [];

  notify() => notifyListeners();

  Future<List<PlanCourse>> getPlan(
      {required String term,
      required String grade,
      required String dptno,
      required String spno,
      bool networkCourseOnly = false}) async {
    this.details.clear();
    this.detailsBackup.clear();
    return CourseRepository.getInstance()
        .getPlan(term, grade, dptno, spno)
        .then((planCourses) async {
      planCourses = planCourses;
      final List<Future> futureGroup = [];
      planCourses.forEach((planCourse) {
        if (networkCourseOnly && !planCourse.cname.contains("网络")) return;
        var future = CourseService.getPlanCourseDetail(
                planCourse.id, planCourse.courseid)
            .then((details) {
          details.forEach((detail) {
            detail
              ..id = planCourse.id
              ..cname = planCourse.cname
              ..tname = planCourse.tname;
          });
          this.details.addAll(details);
          this.detailsBackup.addAll(details);
          notifyListeners();
          return details;
        });
        futureGroup.add(future);
      });
      await Future.wait(futureGroup);
      detailsBackup.sort((i, j) {
        return (i.tname! + i.cname!).compareTo((j.tname! + j.cname!));
      });
      details = detailsBackup;
      notifyListeners();
      return planCourses;
    });
  }
}
