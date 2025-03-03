// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_classroom_buildings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyClassroomBuilding _$EmptyClassroomBuildingFromJson(
        Map<String, dynamic> json) =>
    EmptyClassroomBuilding(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$EmptyClassroomBuildingToJson(
        EmptyClassroomBuilding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'enabled': instance.enabled,
    };
