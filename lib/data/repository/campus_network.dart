import 'package:dio/dio.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_online_list.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guethub/data/network.dart';
import 'package:guethub/data/service/campus_network_auth.dart';
import 'package:rxdart/rxdart.dart';

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
    return await CampusNetworkAuth.login(dio, username, password, isp);
  }

  Future<CampusNetworkAuthResponseCommon> unbind(String userAccount) =>
      CampusNetworkAuth.unbind(dio, userAccount);

  Future<CampusNetworkAuthResponseCommon> logout(OnlineUserInfo userInfo) =>
      CampusNetworkAuth.logout(dio, userInfo);

  Future<dynamic> onlineList() => CampusNetworkAuth.onlineList(dio);

  Future<CampusNetworkAuthOnlineList?> onlineListOrNull() async {
    final respData = await onlineList();
    if (respData is CampusNetworkAuthOnlineList) return respData;
    return null;
  }

  Dio dio;

  CampusNetworkRepository._create(this.dio);

  static CampusNetworkRepository? _instance;

  factory CampusNetworkRepository.get({Dio? dio}) => _instance ??=
      CampusNetworkRepository._create(dio ?? AppNetwork.get().noProxyDio);
}
