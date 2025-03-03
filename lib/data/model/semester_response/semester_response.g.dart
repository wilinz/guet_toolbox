// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterNewResponse _$SemesterNewResponseFromJson(Map<String, dynamic> json) =>
    SemesterNewResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SemesterNew.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ok: json['ok'] as bool? ?? false,
    );

Map<String, dynamic> _$SemesterNewResponseToJson(
        SemesterNewResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'ok': instance.ok,
    };

SemesterNew _$SemesterNewFromJson(Map<String, dynamic> json) => SemesterNew(
      id: json['id'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      schoolYear: json['schoolYear'] as String? ?? '',
    );

Map<String, dynamic> _$SemesterNewToJson(SemesterNew instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'schoolYear': instance.schoolYear,
    };
