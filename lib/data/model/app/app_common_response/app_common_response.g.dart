// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppCommonResponse _$AppCommonResponseFromJson(Map<String, dynamic> json) =>
    AppCommonResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      success: json['success'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data: json['data'],
    );

Map<String, dynamic> _$AppCommonResponseToJson(AppCommonResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };
