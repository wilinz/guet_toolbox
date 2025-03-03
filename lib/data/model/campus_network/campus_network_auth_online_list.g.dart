// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_network_auth_online_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusNetworkAuthOnlineList _$CampusNetworkAuthOnlineListFromJson(
        Map<String, dynamic> json) =>
    CampusNetworkAuthOnlineList(
      result: (json['result'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
      onlineList: (json['list'] as List<dynamic>?)
              ?.map((e) => OnlineUserInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CampusNetworkAuthOnlineListToJson(
        CampusNetworkAuthOnlineList instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
      'list': instance.onlineList.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };

OnlineUserInfo _$OnlineUserInfoFromJson(Map<String, dynamic> json) =>
    OnlineUserInfo(
      onlineSession: (json['online_session'] as num?)?.toInt() ?? 0,
      onlineTime: json['online_time'] as String? ?? '',
      onlineIp: json['online_ip'] as String? ?? '',
      onlineMac: json['online_mac'] as String? ?? '',
      timeLong: json['time_long'] as String? ?? '',
      uplinkBytes: json['uplink_bytes'] as String? ?? '',
      downlinkBytes: json['downlink_bytes'] as String? ?? '',
      dhcpHost: json['dhcp_host'] as String? ?? '',
      deviceAlias: json['device_alias'] as String? ?? '',
      nasIp: json['nas_ip'] as String? ?? '',
      userAccount: json['user_account'] as String? ?? '',
      exitId: json['exit_id'] as String? ?? '',
      isOwnerIp: json['is_owner_ip'] as String? ?? '',
    );

Map<String, dynamic> _$OnlineUserInfoToJson(OnlineUserInfo instance) =>
    <String, dynamic>{
      'online_session': instance.onlineSession,
      'online_time': instance.onlineTime,
      'online_ip': instance.onlineIp,
      'online_mac': instance.onlineMac,
      'time_long': instance.timeLong,
      'uplink_bytes': instance.uplinkBytes,
      'downlink_bytes': instance.downlinkBytes,
      'dhcp_host': instance.dhcpHost,
      'device_alias': instance.deviceAlias,
      'nas_ip': instance.nasIp,
      'user_account': instance.userAccount,
      'exit_id': instance.exitId,
      'is_owner_ip': instance.isOwnerIp,
    };
