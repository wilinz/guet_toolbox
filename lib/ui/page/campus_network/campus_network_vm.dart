import 'package:flutter/foundation.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_online_list.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/campus_network.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/repository/user.dart';
import 'package:guettoolbox/data/service/campus_network_auth.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

class CampusNetworkViewModel extends ChangeNotifier {

  ValueStream<CampusNetworkAuthOnlineList?> get campusNetworkAuthState => CampusNetworkRepository.getInstance().campusNetworkAuthState;

  var isLoading = false;

  ValueStream<bool?> get isCampusNetworkState =>
      NetworkDetectionRepository.getInstance().isCampusNetworkState;

  Future<dynamic> login(String username, String password, ISP isp) {
    isLoading = true;
    notifyListeners();
    return CampusNetworkRepository.getInstance().login(username, password, isp);
  }

  Future<CampusNetworkAuthResponseCommon> unbind(String userAccount) =>
      CampusNetworkRepository.getInstance().unbind(userAccount);

  Future<CampusNetworkAuthResponseCommon> logout(String userAccount) =>
      CampusNetworkRepository.getInstance().logout(userAccount);

  Future<dynamic> onlineList() => CampusNetworkRepository.getInstance().onlineList();

  Future<bool> isOnline() async {
    final respData = await onlineList();
    if(respData is CampusNetworkAuthOnlineList){
      return true;
    }
    return false;
  }

  Future<User?> getRecentUser() async =>
      UserRepository.getInstance().getRecentUser();
}
