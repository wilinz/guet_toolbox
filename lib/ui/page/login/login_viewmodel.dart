import 'package:flutter/foundation.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:logger/logger.dart';

import '../../../data/repository/login.dart';

class LoginViewModel extends ChangeNotifier {
  var isLoading = false;

  Future<bool?> get isCampusNetwork =>
      NetworkDetectionRepository.getInstance().isCampusNetwork;

  Stream<bool?> get isCampusNetworkState => NetworkDetectionRepository.getInstance().isCampusNetworkState;

  Future<bool> login(
      String username, String password, Future<String> Function() onGetCode) {
    isLoading = true;
    notifyListeners();
    return LoginRepository.getInstance()
        .loginAcademicAffairsSystem(username, password, onGetCode)
        .whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }

  Map<String, dynamic>? vcode;

  Future<Map<String, dynamic>> getDynamicCode(String username) =>
      LoginRepository.getInstance().getDynamicCode(username);

  Future<User?> getRecentUser() async =>
      UserRepository.getInstance().getRecentUser();
}
