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
      NetworkDetectionRepository.get().isCampusNetwork;

  Stream<bool?> get isCampusNetworkState => NetworkDetectionRepository.get().isCampusNetworkState;

  Future<bool> login(
      String username, String password) {
    isLoading.value = true;
    return LoginRepository.get()
        .loginAcademicAffairsSystem(username, password)
        .whenComplete(() {
      isLoading.value = false;
    });
  }

  Map<String, dynamic>? vcode;

  Future<DynamicCode> getDynamicCode(String username) =>
      LoginRepository.get().getDynamicCode(username);

  Future<ReAuth> reAuthCheck(String code) =>
      LoginRepository.get().reAuthCheck(code);

  Future<User?> getRecentUser() async =>
      UserRepository.get().getRecentUser();
}
