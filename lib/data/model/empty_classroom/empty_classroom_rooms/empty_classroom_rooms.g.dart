// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_classroom_rooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyClassroomRoom _$EmptyClassroomRoomFromJson(Map<String, dynamic> json) =>
    EmptyClassroomRoom(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      floor: (json['floor'] as num?)?.toInt() ?? 0,
      virtual: json['virtual'] as bool? ?? false,
      seatsForLesson: (json['seatsForLesson'] as num?)?.toInt() ?? 0,
      enabled: json['enabled'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
    );

Map<String, dynamic> _$EmptyClassroomRoomToJson(EmptyClassroomRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'floor': instance.floor,
      'virtual': instance.virtual,
      'seatsForLesson': instance.seatsForLesson,
      'enabled': instance.enabled,
      'experiment': instance.experiment,
    };
