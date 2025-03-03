// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_network_auth_response_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusNetworkAuthResponseSuccess _$CampusNetworkAuthResponseSuccessFromJson(
        Map<String, dynamic> json) =>
    CampusNetworkAuthResponseSuccess(
      result: (json['result'] as num?)?.toInt() ?? 0,
      aolno: (json['aolno'] as num?)?.toInt() ?? 0,
      m46: (json['m46'] as num?)?.toInt() ?? 0,
      v46ip: json['v46ip'] as String? ?? '',
      myv6ip: json['myv6ip'] as String? ?? '',
      sms: (json['sms'] as num?)?.toInt() ?? 0,
      nID: json['NID'] as String? ?? '',
      olmac: json['olmac'] as String? ?? '',
      ollm: (json['ollm'] as num?)?.toInt() ?? 0,
      olm1: json['olm1'] as String? ?? '',
      olm2: json['olm2'] as String? ?? '',
      olm3: (json['olm3'] as num?)?.toInt() ?? 0,
      olmm: (json['olmm'] as num?)?.toInt() ?? 0,
      olm5: (json['olm5'] as num?)?.toInt() ?? 0,
      gid: (json['gid'] as num?)?.toInt() ?? 0,
      ispid: (json['ispid'] as num?)?.toInt() ?? 0,
      opip: json['opip'] as String? ?? '',
      oltime: (json['oltime'] as num?)?.toInt() ?? 0,
      olflow: (json['olflow'] as num?)?.toInt() ?? 0,
      lip: json['lip'] as String? ?? '',
      stime: json['stime'] as String? ?? '',
      etime: json['etime'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      sv: (json['sv'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CampusNetworkAuthResponseSuccessToJson(
        CampusNetworkAuthResponseSuccess instance) =>
    <String, dynamic>{
      'result': instance.result,
      'aolno': instance.aolno,
      'm46': instance.m46,
      'v46ip': instance.v46ip,
      'myv6ip': instance.myv6ip,
      'sms': instance.sms,
      'NID': instance.nID,
      'olmac': instance.olmac,
      'ollm': instance.ollm,
      'olm1': instance.olm1,
      'olm2': instance.olm2,
      'olm3': instance.olm3,
      'olmm': instance.olmm,
      'olm5': instance.olm5,
      'gid': instance.gid,
      'ispid': instance.ispid,
      'opip': instance.opip,
      'oltime': instance.oltime,
      'olflow': instance.olflow,
      'lip': instance.lip,
      'stime': instance.stime,
      'etime': instance.etime,
      'uid': instance.uid,
      'sv': instance.sv,
    };
