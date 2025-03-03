// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademyResponse _$AcademyResponseFromJson(Map<String, dynamic> json) =>
    AcademyResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Academy.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$AcademyResponseToJson(AcademyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Academy _$AcademyFromJson(Map<String, dynamic> json) => Academy(
      dptno: json['dptno'] as String? ?? '',
      dptname: json['dptname'] as String? ?? '',
      engname: json['engname'] as String?,
      gbno: json['gbno'] as String?,
      zone: json['zone'],
      comm: json['comm'] as String?,
      bbm: json['bbm'] as String?,
      code: json['code'] as String?,
      used: (json['used'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AcademyToJson(Academy instance) => <String, dynamic>{
      'dptno': instance.dptno,
      'dptname': instance.dptname,
      'engname': instance.engname,
      'gbno': instance.gbno,
      'zone': instance.zone,
      'comm': instance.comm,
      'bbm': instance.bbm,
      'code': instance.code,
      'used': instance.used,
    };
