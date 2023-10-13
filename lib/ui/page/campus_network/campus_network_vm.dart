import 'dart:async';

import 'package:dart_extensions/emum.dart';
import 'package:get/get.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_online_list.dart';
import 'package:guettoolbox/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guettoolbox/data/model/user/campus_network_user.dart';
import 'package:guettoolbox/data/repository/campus_network.dart';
import 'package:guettoolbox/data/repository/campus_network_user.dart';
import 'package:guettoolbox/data/repository/network_detection.dart';
import 'package:guettoolbox/data/service/campus_network_auth.dart';
import 'package:rxdart/rxdart.dart';

class CampusNetworkViewModel extends GetxController {
  ValueStream<CampusNetworkAuthOnlineList?> get campusNetworkAuthState =>
      CampusNetworkRepository.getInstance().campusNetworkAuthState;

  var isLoading = false.obs;

  ValueStream<bool?> get isCampusNetworkState =>
      NetworkDetectionRepository.getInstance().isCampusNetworkState;

  StreamSubscription<bool?>? _sub;

  @override
  void onInit() {
    super.onInit();
    _sub = isCampusNetworkState.listen((status) {
      if (status == true) {
        CampusNetworkRepository.getInstance().refresh();
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
    _sub?.cancel();
  }

  Future<dynamic> login(String username, String password, ISP isp) async {
    final onLineList = await onlineList();
    if (onLineList is CampusNetworkAuthOnlineList &&
        onLineList.onlineList.isNotEmpty) {
      final user = onLineList.onlineList.first;
      await unbind(user.userAccount);
      await logout(user);
    }
    final ispName = isp.convertToString();
    isLoading.value = true;
    final user = CampusNetworkUser(
        updateTime: DateTime.now(),
        username: username,
        password: password,
        isDefault: true,
        isp: ispName);

    CampusNetworkUserRepository.get()
      ..insertUser(user)
      ..unsetDefaultOtherUser(username);
    await CampusNetworkRepository.getInstance().login(username, password, isp);
    CampusNetworkRepository.getInstance().refresh();
  }

  Future<void> exitAccount(OnlineUserInfo userInfo) async {
    await unbind(userInfo.userAccount);
    await logout(userInfo);
    CampusNetworkRepository.getInstance().refresh();
  }

  Future<CampusNetworkAuthResponseCommon> unbind(String userAccount) =>
      CampusNetworkRepository.getInstance().unbind(userAccount);

  Future<CampusNetworkAuthResponseCommon> logout(OnlineUserInfo userInfo) =>
      CampusNetworkRepository.getInstance().logout(userInfo);

  Future<dynamic> onlineList() =>
      CampusNetworkRepository.getInstance().onlineList();

  Future<bool> isOnline() async {
    final respData = await onlineList();
    return respData is CampusNetworkAuthOnlineList;
  }

  Future<CampusNetworkUser?> getRecentUser() async =>
      CampusNetworkUserRepository.get().getRecentUser();

  void refreshData() async {
    CampusNetworkRepository.getInstance().refresh();
    NetworkDetectionRepository.getInstance().refresh();
  }
}
