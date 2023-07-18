// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reauth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReAuth _$ReauthFromJson(Map<String, dynamic> json) => ReAuth(
      msg: json['msg'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$ReauthToJson(ReAuth instance) => <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
    };
