import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/dao/database.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  Future<bool> loginAcademicAffairsSystem(String username, String password,
      Future<String> Function() onGetCode) async {
    final db = await getDatabase();
    final user = await db.userDao.get(username);
    if (user == null) {
      final newUser = User(
          updateTime: DateTime.now(),
          username: username,
          password: password,
          isActive: true);
      db.userDao.insertUser(newUser);
    } else {
      user.isActive = true;
      db.userDao.updateUser(user);
    }

    final isCampusNetwork =
        await NetworkDetectionRepository.getInstance().isCampusNetwork;
    bool ok;
    if (isCampusNetwork == true) {
      ok = await LoginService.loginWithCampusNetwork(
          username, password, onGetCode);
    } else {
      ok = await LoginService.loginWithWebVpn(username, password, onGetCode);
    }
    return ok;
  }

  Future<Map<String, dynamic>> getDynamicCode(String username) => LoginService.getDynamicCode(username);

  LoginRepository._create();

  static LoginRepository? _instance;

  factory LoginRepository.getInstance() =>
      _instance ??= LoginRepository._create();
}
