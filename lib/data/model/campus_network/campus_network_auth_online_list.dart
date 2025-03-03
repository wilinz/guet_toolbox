import 'package:json_annotation/json_annotation.dart';

part 'campus_network_auth_online_list.g.dart';

@JsonSerializable(explicitToJson: true)
class CampusNetworkAuthOnlineList {
  CampusNetworkAuthOnlineList(
      {required this.result,
      required this.msg,
      required this.onlineList,
      required this.total});

  @JsonKey(name: "result", defaultValue: 0)
  int result;
  @JsonKey(name: "msg", defaultValue: "")
  String msg;
  @JsonKey(name: "list", defaultValue: [])
  List<OnlineUserInfo> onlineList;
  @JsonKey(name: "total", defaultValue: 0)
  int total;

  factory CampusNetworkAuthOnlineList.fromJson(Map<String, dynamic> json) => _$CampusNetworkAuthOnlineListFromJson(json);

  Map<String, dynamic> toJson() => _$CampusNetworkAuthOnlineListToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OnlineUserInfo {
  OnlineUserInfo(
      {required this.onlineSession,
      required this.onlineTime,
      required this.onlineIp,
      required this.onlineMac,
      required this.timeLong,
      required this.uplinkBytes,
      required this.downlinkBytes,
      required this.dhcpHost,
      required this.deviceAlias,
      required this.nasIp,
      required this.userAccount,
      required this.exitId,
      required this.isOwnerIp});

  @JsonKey(name: "online_session", defaultValue: 0)
  int onlineSession;
  @JsonKey(name: "online_time", defaultValue: "")
  String onlineTime;
  @JsonKey(name: "online_ip", defaultValue: "")
  String onlineIp;
  @JsonKey(name: "online_mac", defaultValue: "")
  String onlineMac;
  @JsonKey(name: "time_long", defaultValue: "")
  String timeLong;
  @JsonKey(name: "uplink_bytes", defaultValue: "")
  String uplinkBytes;
  @JsonKey(name: "downlink_bytes", defaultValue: "")
  String downlinkBytes;
  @JsonKey(name: "dhcp_host", defaultValue: "")
  String dhcpHost;
  @JsonKey(name: "device_alias", defaultValue: "")
  String deviceAlias;
  @JsonKey(name: "nas_ip", defaultValue: "")
  String nasIp;
  @JsonKey(name: "user_account", defaultValue: "")
  String userAccount;
  @JsonKey(name: "exit_id", defaultValue: "")
  String exitId;
  @JsonKey(name: "is_owner_ip", defaultValue: "")
  String isOwnerIp;

  factory OnlineUserInfo.fromJson(Map<String, dynamic> json) => _$OnlineUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineUserInfoToJson(this);
}


