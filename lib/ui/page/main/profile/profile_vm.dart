import 'package:get/get.dart';
import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/repository/student_info.dart';

class ProfileViewModel extends GetxController{

  final studentInfo = Rx<StudentInfo?>(null);

  Future<StudentInfo> getStudentInfo() async {
    return StudentInfoRepository.getInstance().getStudentInfo().then((value) {
      studentInfo.value = value;
      return value;
    });
  }
}