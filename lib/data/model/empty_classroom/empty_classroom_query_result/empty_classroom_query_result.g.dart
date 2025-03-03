// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_classroom_query_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyClassroomQueryResult _$EmptyClassroomQueryResultFromJson(
        Map<String, dynamic> json) =>
    EmptyClassroomQueryResult(
      roomList: (json['roomList'] as List<dynamic>?)
              ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EmptyClassroomQueryResultToJson(
        EmptyClassroomQueryResult instance) =>
    <String, dynamic>{
      'roomList': instance.roomList.map((e) => e.toJson()).toList(),
    };

ResultCampus _$ResultCampusFromJson(Map<String, dynamic> json) => ResultCampus(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$ResultCampusToJson(ResultCampus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
    };

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      campus: json['campus'] == null
          ? ResultCampus.emptyInstance()
          : ResultCampus.fromJson(json['campus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'campus': instance.campus.toJson(),
    };

ResultRoomType _$ResultRoomTypeFromJson(Map<String, dynamic> json) =>
    ResultRoomType(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$ResultRoomTypeToJson(ResultRoomType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      building: json['building'] == null
          ? Building.emptyInstance()
          : Building.fromJson(json['building'] as Map<String, dynamic>),
      roomType: json['roomType'] == null
          ? ResultRoomType.emptyInstance()
          : ResultRoomType.fromJson(json['roomType'] as Map<String, dynamic>),
      floor: (json['floor'] as num?)?.toInt() ?? 0,
      virtual: json['virtual'] as bool? ?? false,
      seatsForLesson: (json['seatsForLesson'] as num?)?.toInt() ?? 0,
      remark: json['remark'] as String? ?? '',
      seats: (json['seats'] as num?)?.toInt() ?? 0,
      week: json['week'],
      weekday: json['weekday'],
      date: json['date'],
      units: json['units'],
      weekNum: json['weekNum'],
      mngtDepartAssoc: (json['mngtDepartAssoc'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'building': instance.building.toJson(),
      'roomType': instance.roomType.toJson(),
      'floor': instance.floor,
      'virtual': instance.virtual,
      'seatsForLesson': instance.seatsForLesson,
      'remark': instance.remark,
      'seats': instance.seats,
      'week': instance.week,
      'weekday': instance.weekday,
      'date': instance.date,
      'units': instance.units,
      'weekNum': instance.weekNum,
      'mngtDepartAssoc': instance.mngtDepartAssoc,
    };
