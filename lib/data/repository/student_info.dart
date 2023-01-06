import 'package:guettoolbox/data/model/student_info.dart';
import 'package:guettoolbox/data/service/student_info.dart';

class StudentInfoRepository {
  Future<StudentInfo> getStudentInfo() async {
    final info = await StudioInfoService.get();
    return info;
  }

  StudentInfoRepository._();

  static StudentInfoRepository? _instance = null;

  factory StudentInfoRepository.getInstance() =>
      _instance ??= StudentInfoRepository._();
}
