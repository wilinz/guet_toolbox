// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyClassroomData _$EmptyClassroomDataFromJson(Map<String, dynamic> json) =>
    EmptyClassroomData(
      campus: json['校区'] as String? ?? '',
      teachingBuilding: json['教学楼'] as String? ?? '',
      classroom: json['教室'] as String? ?? '',
      seatCount: json['座位数'] as String? ?? '',
      type: json['类型'] as String? ?? '',
    );

Map<String, dynamic> _$EmptyClassroomDataToJson(EmptyClassroomData instance) =>
    <String, dynamic>{
      '校区': instance.campus,
      '教学楼': instance.teachingBuilding,
      '教室': instance.classroom,
      '座位数': instance.seatCount,
      '类型': instance.type,
    };
