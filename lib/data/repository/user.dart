import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/util/list.dart';

class UserRepository {
  Future<User?> getRecentUser() async {
    final db = await getDatabase();
    final user = await db.userDao.getRecent();
    return user.firstOrNull();
  }

  Future<User?> getActiveUser() async {
    final db = await getDatabase();
    return db.userDao.getActive();
  }

  UserRepository._create();

  static UserRepository? _instance;

  factory UserRepository.get() =>
      _instance ??= UserRepository._create();
}
