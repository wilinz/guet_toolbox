import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/student_info.dart';

import '../dao/database.dart';

class StudentInfoRepository {

  Future<StudentInfo> getStudentInfo() async {
    final db = await getDatabase();
    final user = await UserRepository.getInstance().getActiveUser();
    if (user != null) {
      final userInfo = await db.studentInfoDao.get(user.username);
      if (userInfo != null) {
        return userInfo;
      }
    }
    final userInfo = await StudioInfoService.get();
    db.studentInfoDao.insert(userInfo);
    return userInfo;
  }

  StudentInfoRepository._();

  static StudentInfoRepository? _instance = null;

  factory StudentInfoRepository.getInstance() =>
      _instance ??= StudentInfoRepository._();
}
