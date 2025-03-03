// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_classroom_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyClassroomConfig _$EmptyClassroomConfigFromJson(
        Map<String, dynamic> json) =>
    EmptyClassroomConfig(
      semesterStart: json['semesterStart'] as String? ?? '',
      semesterWeeks: (json['semesterWeeks'] as num?)?.toInt() ?? 0,
      units: (json['units'] as List<dynamic>?)
              ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      campus: (json['campusList'] as List<dynamic>?)
              ?.map((e) => Campus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      roomTypes: (json['roomTypeList'] as List<dynamic>?)
              ?.map((e) => RoomType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      weekStartOnSunday: json['weekStartOnSunday'] as bool? ?? false,
    );

Map<String, dynamic> _$EmptyClassroomConfigToJson(
        EmptyClassroomConfig instance) =>
    <String, dynamic>{
      'semesterStart': instance.semesterStart,
      'semesterWeeks': instance.semesterWeeks,
      'units': instance.units.map((e) => e.toJson()).toList(),
      'campusList': instance.campus.map((e) => e.toJson()).toList(),
      'roomTypeList': instance.roomTypes.map((e) => e.toJson()).toList(),
      'weekStartOnSunday': instance.weekStartOnSunday,
    };

DayPart _$DayPartFromJson(Map<String, dynamic> json) => DayPart(
      $type: json[r'$type'] as String? ?? '',
      $name: json[r'$name'] as String? ?? '',
    );

Map<String, dynamic> _$DayPartToJson(DayPart instance) => <String, dynamic>{
      r'$type': instance.$type,
      r'$name': instance.$name,
    };

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      changeTime: json['changeTime'],
      dayPart: json['dayPart'] == null
          ? DayPart.emptyInstance()
          : DayPart.fromJson(json['dayPart'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      segmentIndex: (json['segmentIndex'] as num?)?.toInt() ?? 0,
      time: json['time'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'changeTime': instance.changeTime,
      'dayPart': instance.dayPart.toJson(),
      'name': instance.name,
      'segmentIndex': instance.segmentIndex,
      'time': instance.time,
      'value': instance.value,
    };

Campus _$CampusFromJson(Map<String, dynamic> json) => Campus(
      text: json['text'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CampusToJson(Campus instance) => <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

RoomType _$RoomTypeFromJson(Map<String, dynamic> json) => RoomType(
      text: json['text'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RoomTypeToJson(RoomType instance) => <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
