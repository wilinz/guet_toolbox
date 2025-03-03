import 'package:dio/dio.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_online_list.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_response_common.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_response_fail.dart';
import 'package:guethub/data/model/campus_network/campus_network_auth_response_success.dart';
import 'package:guethub/data/network.dart';

enum ISP {
  telecom,
  cmcc,
  unicom,
  campus;

  String displayName() {
    switch (this) {
      case telecom:
        return "中国电信";
      case cmcc:
        return "中国移动";
      case unicom:
        return "中国联通";
      case campus:
        return "校园网";
    }
  }

  static ISP valueOf(String value) {
    return ISP.values.byName(value);
  }
}

String getOperatorsUsername(String username, ISP isp) {
  if (isp == ISP.campus) {
    return username;
  }
  return "$username@${isp.name}";
}

class CampusNetworkAuth {
  /// login
  /// success: lib/data/model/campus_network/campus_network_auth_response_success.dart
  /// fail: lib/data/model/campus_network/campus_network_auth_response_fail.dart
  static Future<dynamic> login(
      Dio dio, String username, String password, ISP isp) async {
    final resp = await dio.get("http://10.0.1.5/drcom/login",
        queryParameters: {
          "callback": "dr1003",
          "DDDDD": getOperatorsUsername(username, isp),
          "upass": password,
          "0MKKey": "123456",
          "R1": "0",
          "R2": "",
          "R3": 0,
          "R6": 0,
          "para": "00",
          "v6ip": "",
          "terminal_type": 1,
          "lang": "zh-cn",
          "jsVersion": 4.2,
          "v": 8996,
          "lang": "zh",
        },
        options: Options(
            extra: {JsonpInterceptor.UseJsonpParser: true},
            sendTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5)));
    final data = resp.data;
    if (data["result"] == 1) {
      return CampusNetworkAuthResponseSuccess.fromJson(data);
    }
    return CampusNetworkAuthResponseFail.fromJson(data);
  }

  /// dr1002({"result":0,"msg":"无法获取终端MAC地址！"});
  static Future<CampusNetworkAuthResponseCommon> unbind(
      Dio dio, String userAccount) async {
    final resp = await dio.get("http://10.0.1.5:801/eportal/portal/mac/unbind",
        queryParameters: {
          "callback": "dr1002",
          "user_account": userAccount,
          "wlan_user_mac": "000000000000",
          "wlan_user_ip": "172401759",
          "jsVersion": 4.2,
          "v": 7321,
          "lang": "zh"
        },
        options: Options(
            extra: {JsonpInterceptor.UseJsonpParser: true},
            sendTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5)));
    return CampusNetworkAuthResponseCommon.fromJson(resp.data);
  }

  /// {"result":1,"msg":"Radius注销成功！"}
  static Future<CampusNetworkAuthResponseCommon> logout(
      Dio dio, OnlineUserInfo userInfo) async {
    final resp = await dio.get("http://10.0.1.5:801/eportal/portal/logout",
        queryParameters: {
          "callback": "dr1003",
          "login_method": 0,
          "user_account": "drcom",
          "user_password": "123",
          "ac_logout": 1,
          "register_mode": 1,
          "wlan_user_ip": userInfo.onlineIp,
          "wlan_user_ipv6": "",
          "wlan_vlan_id": 1,
          "wlan_user_mac": userInfo.onlineMac,
          "wlan_ac_ip": "",
          "wlan_ac_name": "",
          "jsVersion": 4.2,
          "v": 9130,
          "lang": "zh",
        },
        options: Options(
            extra: {JsonpInterceptor.UseJsonpParser: true},
            sendTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5)));
    return CampusNetworkAuthResponseCommon.fromJson(resp.data);
  }

  /// online list
  /// success: lib/data/json/campus_network/_campus_network_auth_online_list.json5
  /// fail: lib/data/model/campus_network/campus_network_auth_response_common.dart
  static Future<dynamic> onlineList(Dio dio) async {
    final resp = await dio.get("http://10.0.1.5:801/eportal/portal/online_list",
        options: Options(
            extra: {JsonpInterceptor.UseJsonpParser: true},
            sendTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5)));
    final data = resp.data;
    if (data["result"] == 1) {
      return CampusNetworkAuthOnlineList.fromJson(data);
    }
    return CampusNetworkAuthResponseCommon.fromJson(data);
  }
}
