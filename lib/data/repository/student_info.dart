import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/service/student_info.dart';

class StudentInfoRepository {
  StudentInfo? studentInfoCache = null;

  Future<StudentInfo> getStudentInfo() async {
    if (studentInfoCache != null) return studentInfoCache!;
    studentInfoCache = await StudioInfoService.get();
    return studentInfoCache!;
  }

  StudentInfoRepository._();

  static StudentInfoRepository? _instance = null;

  factory StudentInfoRepository.getInstance() =>
      _instance ??= StudentInfoRepository._();
}
