import 'package:flutter/foundation.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/campus_network.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/campus_network_auth.dart';
import 'package:kt_dart/kt.dart';

class CampusNetworkViewModel extends ChangeNotifier {
  var isLoading = false;

  Future<bool?> get isCampusNetwork =>
      NetworkDetectionRepository.getInstance().isCampusNetwork;

  Future<dynamic> login(String username, String password, ISP isp) {
    isLoading = true;
    notifyListeners();
    return CampusNetworkRepository.getInstance().login(username, password, isp);
  }

  Future<CampusNetworkAuthResponseCommon> unbind(String userAccount) =>
      CampusNetworkAuth.unbind(userAccount);

  Future<CampusNetworkAuthResponseCommon> logout(String userAccount) =>
      CampusNetworkAuth.logout(userAccount);

  Future<User?> getRecentUser() async =>
      UserRepository.getInstance().getRecentUser();
}
