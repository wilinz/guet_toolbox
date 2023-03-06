import 'package:guettoolbox/data/dao/database.dart';
import 'package:guettoolbox/data/model/user/user.dart';

class UserRepository {
  Future<User?> getRecentUser() async {
    final db = await getDatabase();
    return db.userDao.getRecent();
  }

  Future<User?> getActiveUser() async {
    final db = await getDatabase();
    return db.userDao.getActive();
  }

  UserRepository._create();

  static UserRepository? _instance;

  factory UserRepository.getInstance() =>
      _instance ??= UserRepository._create();
}
