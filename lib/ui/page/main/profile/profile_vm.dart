
import 'package:flutter/cupertino.dart';
import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/repository/student_info.dart';

class ProfileViewModel extends ChangeNotifier{

  StudentInfo? studentInfo;

  Future<StudentInfo> getStudentInfo() async {
    return StudentInfoRepository.getInstance().getStudentInfo().then((value) {
      studentInfo = value;
      notifyListeners();
      return value;
    });
  }
}