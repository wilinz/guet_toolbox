import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  Future<SharedPreferences> get _sp async =>
      await SharedPreferences.getInstance();

  Future<String?> get ticket async {
    var sp = await _sp;
    return sp.get(AppKey.ticket) as String?;
  }

  Future<bool> setTicket(String value) async {
    var sp = await _sp;
    return sp.setString(AppKey.ticket, value);
  }

  Future<bool> loginAcademicAffairsSystem(
      String username, String password) async {
    if (!(await LoginService.loginWebVpn(username, password))) {
      return Future(() => false);
    }
    var ticket =
        await LoginService.loginAcademicAffairsSystem(username, password);
    if (ticket != null) {
      return setTicket(ticket);
    }
    return Future(() => false);
  }

  LoginRepository._create();

  static final _instance = LoginRepository._create();

  factory LoginRepository() => _instance;
}
