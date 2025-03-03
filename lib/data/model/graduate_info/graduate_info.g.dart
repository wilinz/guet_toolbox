// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graduate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraduateInfo _$GraduateInfoFromJson(Map<String, dynamic> json) => GraduateInfo(
      graduation: json['graduation'] as String? ?? '',
      degree: json['degree'] as String? ?? '',
      gpa: json['gpa'] as String? ?? '',
      programId: json['programId'] as String? ?? '',
    );

Map<String, dynamic> _$GraduateInfoToJson(GraduateInfo instance) =>
    <String, dynamic>{
      'graduation': instance.graduation,
      'degree': instance.degree,
      'gpa': instance.gpa,
      'programId': instance.programId,
    };
