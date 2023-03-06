import 'package:flutter/foundation.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:logger/logger.dart';

import '../../../data/repository/login.dart';

class LoginViewModel extends ChangeNotifier {
  var isLoading = false;

  Future<bool?> get isCampusNetwork => NetworkDetectionRepository.getInstance().isCampusNetwork;

  Future<bool> login(String username, String password) {
    isLoading = true;
    notifyListeners();
    return LoginRepository.getInstance()
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

  Future<User?> getRecentUser() async => UserRepository.getInstance().getRecentUser();

}
