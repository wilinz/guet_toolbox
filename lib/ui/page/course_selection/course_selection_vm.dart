import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/academy_response.dart';
import 'package:guettoolbox/data/model/majors_response.dart';
import 'package:guettoolbox/data/model/student_info.dart';
import 'package:guettoolbox/data/model/term_response.dart';
import 'package:guettoolbox/data/repository/academy.dart';
import 'package:guettoolbox/data/repository/course.dart';
import 'package:guettoolbox/data/repository/majors.dart';
import 'package:guettoolbox/data/service/course.dart';
import 'package:guettoolbox/data/service/student_info.dart';

class CourseSelectionViewModel extends ChangeNotifier {
  StudentInfo? studentInfo;

  List<Term> terms = [];
  List<Academy> academy = [];
  List<Major> major = [];

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

  Future<String> getPlan({
    required String term,
    required String grade,
    required String dptno,
    required String spno,
  }) async {
    return CourseService.getPlan(term, grade, dptno, spno);
  }
}
