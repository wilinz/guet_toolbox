// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'majors_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MajorsCodeResponse _$MajorsCodeResponseFromJson(Map<String, dynamic> json) =>
    MajorsCodeResponse(
      success: json['success'] as bool? ?? false,
      total: json['total'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MajorsCodeResponseToJson(MajorsCodeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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
      used: json['used'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
