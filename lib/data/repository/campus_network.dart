import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/database/database.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_online_list.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_success.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/service/campus_network_auth.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CampusNetworkRepository {
  BehaviorSubject<CampusNetworkAuthOnlineList?>
      _campusNetworkAuthStateController =
      BehaviorSubject<CampusNetworkAuthOnlineList?>();

  ValueStream<CampusNetworkAuthOnlineList?> get campusNetworkAuthState =>
      _campusNetworkAuthStateController.stream;

  refresh() async {
    CampusNetworkAuthOnlineList? onlineList;
    try {
      onlineList = await onlineListOrNull();
    } catch (e) {
      onlineList = null;
    }
    _campusNetworkAuthStateController.add(onlineList);
  }

  Future<dynamic> login(String username, String password, ISP isp) async {
    return await CampusNetworkAuth.login(username, password, isp);
  }

  Future<CampusNetworkAuthResponseCommon> unbind(String userAccount) =>
      CampusNetworkAuth.unbind(userAccount);

  Future<CampusNetworkAuthResponseCommon> logout(OnlineUserInfo userInfo) =>
      CampusNetworkAuth.logout(userInfo);

  Future<dynamic> onlineList() => CampusNetworkAuth.onlineList();

  Future<CampusNetworkAuthOnlineList?> onlineListOrNull() async {
    final respData = await onlineList();
    if (respData is CampusNetworkAuthOnlineList) return respData;
    return null;
  }

  CampusNetworkRepository._create();

  static CampusNetworkRepository? _instance;

  factory CampusNetworkRepository.get() =>
      _instance ??= CampusNetworkRepository._create();
}
