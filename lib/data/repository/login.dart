import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:rxdart/rxdart.dart';

class LoginRepository {

  final _onLoginEvent = BehaviorSubject<User>();

  ValueStream<User> get onLoginEvent => _onLoginEvent.stream;

  Future<bool> loginAcademicAffairsSystem(String username, String password,
      Future<String> Function() onGetCode) async {

    final db = await getDatabase();
    var user = await db.userDao.get(username);
    if (user == null) {
      user = User(
          updateTime: DateTime.now(),
          username: username,
          password: password,
          isActive: false);
      db.userDao.insertUser(user);
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
    user.password = password;
    if (ok){
      user.isActive = true;
      db.userDao.updateUser(user);
      db.userDao.offlineOtherUser(user.username);
    }else{
      db.userDao.updateUser(user);
    }
    _onLoginEvent.add(user);
    return ok;
  }

  Future<Map<String, dynamic>> getDynamicCode(String username) => LoginService.getDynamicCode(username);

  LoginRepository._create();

  static LoginRepository? _instance;

  factory LoginRepository.getInstance() =>
      _instance ??= LoginRepository._create();
}
