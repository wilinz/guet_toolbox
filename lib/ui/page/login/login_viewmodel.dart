import 'package:get/state_manager.dart';
import 'package:guettoolbox/data/model/dynamic_code/dynamic_code.dart';
import 'package:guettoolbox/data/model/dynamic_code/reauth.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/repository/user.dart';

import '../../../data/repository/login.dart';

class LoginViewModel extends GetxController {
  var isLoading = false.obs;

  Future<bool?> get isCampusNetwork =>
      NetworkDetectionRepository.getInstance().isCampusNetwork;

  Stream<bool?> get isCampusNetworkState => NetworkDetectionRepository.getInstance().isCampusNetworkState;

  Future<bool> login(
      String username, String password) {
    isLoading.value = true;
    return LoginRepository.getInstance()
        .loginAcademicAffairsSystem(username, password)
        .whenComplete(() {
      isLoading.value = false;
    });
  }

  Map<String, dynamic>? vcode;

  Future<DynamicCode> getDynamicCode(String username) =>
      LoginRepository.getInstance().getDynamicCode(username);

  Future<ReAuth> reAuthCheck(String code) =>
      LoginRepository.getInstance().reAuthCheck(code);

  Future<User?> getRecentUser() async =>
      UserRepository.getInstance().getRecentUser();
}
