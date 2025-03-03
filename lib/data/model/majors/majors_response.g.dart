// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'majors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MajorsResponse _$MajorsResponseFromJson(Map<String, dynamic> json) =>
    MajorsResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Major.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MajorsResponseToJson(MajorsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Major _$MajorFromJson(Map<String, dynamic> json) => Major(
      spno: json['spno'] as String? ?? '',
      spname: json['spname'] as String? ?? '',
      engname: json['engname'] as String?,
      dptno: json['dptno'] as String? ?? '',
      sptype: json['sptype'] as String? ?? '',
      gbno: json['gbno'] as String?,
      years: json['years'] as String?,
      degree: json['degree'] as String?,
      comm: json['comm'] as String?,
      major: json['major'] as String?,
      code: json['code'] as String?,
      used: (json['used'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MajorToJson(Major instance) => <String, dynamic>{
      'spno': instance.spno,
      'spname': instance.spname,
      'engname': instance.engname,
      'dptno': instance.dptno,
      'sptype': instance.sptype,
      'gbno': instance.gbno,
      'years': instance.years,
      'degree': instance.degree,
      'comm': instance.comm,
      'major': instance.major,
      'code': instance.code,
      'used': instance.used,
    };
