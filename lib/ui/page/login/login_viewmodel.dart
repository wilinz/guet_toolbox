import 'package:flutter/foundation.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:logger/logger.dart';

import '../../../data/repository/login.dart';

class LoginViewModel extends ChangeNotifier {
  var isLoading = false;

  Future<bool> login(String username, String password) {
    isLoading = true;
    notifyListeners();
    return LoginRepository()
        .loginAcademicAffairsSystem(username, password)
        .whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }

  Map<String, dynamic>? vcode;

  getVcode() {
    return LoginService.getVcode().then((value) {
      vcode = value;
      notifyListeners();
      return vcode;
    });
  }

  setVcode(String code) {
    if (vcode == null) return;
    return LoginService.vcode(vcode!["uid"], code);
  }
}
