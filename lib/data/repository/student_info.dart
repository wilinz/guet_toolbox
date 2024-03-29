import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/model/student/student_info.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/student_info.dart';


class StudentInfoRepository {

  Future<StudentInfo> getStudentInfo() async {
    final db = await getDatabase();
    final user = await UserRepository.get().getActiveUser();
    if (user != null) {
      final userInfo = await db.studentInfoDao.get(user.username);
      if (userInfo != null) {
        return userInfo;
      }
    }
    final userInfo = await StudioInfoService.get();
    print(userInfo);
    db.studentInfoDao.insertOrUpdate(userInfo);
    return userInfo;
  }

  StudentInfoRepository._();

  static StudentInfoRepository? _instance = null;

  factory StudentInfoRepository.get() =>
      _instance ??= StudentInfoRepository._();
}
