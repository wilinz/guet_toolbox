// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_term_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentTermNewResponse _$CurrentTermNewResponseFromJson(
        Map<String, dynamic> json) =>
    CurrentTermNewResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
      data: json['data'] == null
          ? CurrentTermNew.emptyInstance()
          : CurrentTermNew.fromJson(json['data'] as Map<String, dynamic>),
      ok: json['ok'] as bool? ?? false,
    );

Map<String, dynamic> _$CurrentTermNewResponseToJson(
        CurrentTermNewResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.toJson(),
      'ok': instance.ok,
    };

CurrentTermNew _$CurrentTermNewFromJson(Map<String, dynamic> json) =>
    CurrentTermNew(
      id: json['id'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$CurrentTermNewToJson(CurrentTermNew instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
    };
