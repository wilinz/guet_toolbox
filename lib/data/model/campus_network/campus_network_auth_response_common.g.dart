// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_network_auth_response_common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusNetworkAuthResponseCommon _$CampusNetworkAuthResponseCommonFromJson(
        Map<String, dynamic> json) =>
    CampusNetworkAuthResponseCommon(
      result: json['result'] as int? ?? 0,
      msg: json['msg'] as String? ?? '',
    );

Map<String, dynamic> _$CampusNetworkAuthResponseCommonToJson(
        CampusNetworkAuthResponseCommon instance) =>
    <String, dynamic>{
      'result': instance.result,
      'msg': instance.msg,
    };
