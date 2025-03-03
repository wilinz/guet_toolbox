import 'package:guethub/data/database/database.dart';
import 'package:guethub/data/model/user/campus_network_user.dart';
import 'package:guethub/data/model/user/user.dart';
import 'package:guethub/util/list.dart';

class CampusNetworkUserRepository {
  Future<CampusNetworkUser?> getRecentUser() async {
    final db = await getDatabase();
    final user = await db.campusNetworkUserDao.getRecent();
    return user.firstOrNull();
  }

  Future<CampusNetworkUser?> getActiveUser() async {
    final db = await getDatabase();
    return db.campusNetworkUserDao.getActive();
  }

  CampusNetworkUserRepository._create();

  Future<void> insertUser(CampusNetworkUser user) async {
    final db = await getDatabase();
    return db.campusNetworkUserDao.insertUser(user);
  }

  Future<void> updateUser(CampusNetworkUser user) async {
    final db = await getDatabase();
    return db.campusNetworkUserDao.updateUser(user);
  }

  Future<void> unsetDefaultOtherUser(String username) async {
    final db = await getDatabase();
    return db.campusNetworkUserDao.unsetDefaultOtherUser(username);
  }

  static CampusNetworkUserRepository? _instance;

  factory CampusNetworkUserRepository.get() =>
      _instance ??= CampusNetworkUserRepository._create();
}
