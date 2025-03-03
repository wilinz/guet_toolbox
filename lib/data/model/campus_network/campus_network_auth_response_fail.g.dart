// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_network_auth_response_fail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusNetworkAuthResponseFail _$CampusNetworkAuthResponseFailFromJson(
        Map<String, dynamic> json) =>
    CampusNetworkAuthResponseFail(
      result: (json['result'] as num?)?.toInt() ?? 0,
      wopt: (json['wopt'] as num?)?.toInt() ?? 0,
      msg: (json['msg'] as num?)?.toInt() ?? 0,
      uid: json['uid'] as String? ?? '',
      hidm: (json['hidm'] as num?)?.toInt() ?? 0,
      hidn: (json['hidn'] as num?)?.toInt() ?? 0,
      ss5: json['ss5'] as String? ?? '',
      ss6: json['ss6'] as String? ?? '',
      vid: (json['vid'] as num?)?.toInt() ?? 0,
      ss1: json['ss1'] as String? ?? '',
      ss4: json['ss4'] as String? ?? '',
      cvid: (json['cvid'] as num?)?.toInt() ?? 0,
      pvid: (json['pvid'] as num?)?.toInt() ?? 0,
      hotel: (json['hotel'] as num?)?.toInt() ?? 0,
      aolno: (json['aolno'] as num?)?.toInt() ?? 0,
      eport: (json['eport'] as num?)?.toInt() ?? 0,
      eclass: (json['eclass'] as num?)?.toInt() ?? 0,
      ubind: json['ubind'] as String? ?? '',
      msga: json['msga'] as String? ?? '',
    );

Map<String, dynamic> _$CampusNetworkAuthResponseFailToJson(
        CampusNetworkAuthResponseFail instance) =>
    <String, dynamic>{
      'result': instance.result,
      'wopt': instance.wopt,
      'msg': instance.msg,
      'uid': instance.uid,
      'hidm': instance.hidm,
      'hidn': instance.hidn,
      'ss5': instance.ss5,
      'ss6': instance.ss6,
      'vid': instance.vid,
      'ss1': instance.ss1,
      'ss4': instance.ss4,
      'cvid': instance.cvid,
      'pvid': instance.pvid,
      'hotel': instance.hotel,
      'aolno': instance.aolno,
      'eport': instance.eport,
      'eclass': instance.eclass,
      'ubind': instance.ubind,
      'msga': instance.msga,
    };
