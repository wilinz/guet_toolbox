import 'package:guettoolbox/common/key.dart';
import 'package:guettoolbox/data/dao/database.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guettoolbox/data/model/user/user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/service/campus_network_auth.dart';
import 'package:guettoolbox/data/service/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CampusNetworkRepository {
  Future<dynamic> login(String username, String password, ISP isp) =>
      CampusNetworkAuth.login(username, password, isp);

  Future<CampusNetworkAuthResponseCommon> unbind(String userAccount) =>
      CampusNetworkAuth.unbind(userAccount);

  Future<CampusNetworkAuthResponseCommon> logout(String userAccount) =>
      CampusNetworkAuth.logout(userAccount);

  Future<dynamic> onlineList() => CampusNetworkAuth.onlineList();

  CampusNetworkRepository._create();

  static CampusNetworkRepository? _instance;

  factory CampusNetworkRepository.getInstance() =>
      _instance ??= CampusNetworkRepository._create();
}
