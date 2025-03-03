// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semesters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      calendarAssoc: (json['calendarAssoc'] as num?)?.toInt() ?? 0,
      schoolYear: json['schoolYear'] as String? ?? '',
      startDate: _parseDateTime(json['startDate']),
      endDate: _parseDateTime(json['endDate']),
      weekStartOnSunday: json['weekStartOnSunday'] as bool? ?? false,
      countInTerm: json['countInTerm'] as bool? ?? false,
      season: json['season'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      fileInfoAssoc: json['fileInfoAssoc'] as String?,
      approvedYear: json['approvedYear'] as String? ?? '',
      lessonGenCode: json['lessonGenCode'] as String? ?? '',
      includeMonths: (json['includeMonths'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'calendarAssoc': instance.calendarAssoc,
      'schoolYear': instance.schoolYear,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'weekStartOnSunday': instance.weekStartOnSunday,
      'countInTerm': instance.countInTerm,
      'season': instance.season,
      'enabled': instance.enabled,
      'fileInfoAssoc': instance.fileInfoAssoc,
      'approvedYear': instance.approvedYear,
      'lessonGenCode': instance.lessonGenCode,
      'includeMonths': instance.includeMonths,
      'transient': instance.transient,
      'name': instance.name,
    };
