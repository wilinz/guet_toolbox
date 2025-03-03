// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermNewResponse _$TermNewResponseFromJson(Map<String, dynamic> json) =>
    TermNewResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TermNew.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ok: json['ok'] as bool? ?? false,
    );

Map<String, dynamic> _$TermNewResponseToJson(TermNewResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'ok': instance.ok,
    };

TermNew _$TermNewFromJson(Map<String, dynamic> json) => TermNew(
      id: json['id'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      schoolYear: json['schoolYear'] as String? ?? '',
    );

Map<String, dynamic> _$TermNewToJson(TermNew instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'schoolYear': instance.schoolYear,
    };
