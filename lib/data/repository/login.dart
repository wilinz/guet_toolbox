import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/model/dynamic_code/dynamic_code.dart';
import 'package:guettoolbox/data/model/dynamic_code/reauth.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:rxdart/rxdart.dart';

class LoginRepository {
  final _onLoginEvent = BehaviorSubject<User>();

  ValueStream<User> get onLoginEvent => _onLoginEvent.stream;

  Future<bool> loginAcademicAffairsSystem(
      String username, String password) async {
    final db = await getDatabase();
    var user = await db.userDao.get(username);
    if (user == null) {
      user = User(
          updateTime: DateTime.now(),
          username: username,
          password: password,
          isActive: false);
      db.userDao.insertOrUpdateUser(user);
    }

    final isCampusNetwork =
        await NetworkDetectionRepository.get().isCampusNetwork;
    bool ok;
    if (isCampusNetwork == true) {
      ok = await LoginService.loginWithCampusNetwork(username, password);
    } else {
      ok = await LoginService.loginWithWebVpn(username, password);
    }
    user.password = password;
    user.updateTime = DateTime.now();
    if (ok) {
      user.isActive = true;
      db.userDao.updateUser(user);
      db.userDao.offlineOtherUser(user.username);
    } else {
      db.userDao.updateUser(user);
    }
    _onLoginEvent.add(user);
    return ok;
  }

  Future<DynamicCode> getDynamicCode(String username) =>
      LoginService.getDynamicCode(username);

  Future<ReAuth> reAuthCheck(String code) => LoginService.reAuthCheck(code);

  LoginRepository._create();

  static LoginRepository? _instance;

  factory LoginRepository.get() => _instance ??= LoginRepository._create();
}
