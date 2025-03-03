// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamSchedule _$ExamScheduleFromJson(Map<String, dynamic> json) => ExamSchedule(
      id: json['id'] as String,
      username: json['username'] as String? ?? '',
      time: json['time'] as String? ?? '',
      startTime: DateTimeUtils.fromRfc3339(json['start_time'] as String?),
      endTime: DateTimeUtils.fromRfc3339(json['end_time'] as String?),
      campus: json['campus'] as String? ?? '',
      building: json['building'] as String? ?? '',
      room: json['room'] as String? ?? '',
      course: json['course'] as String? ?? '',
      tag: json['tag'] as String? ?? '',
      status: json['status'] as String? ?? '',
      section: (json['section'] as num?)?.toInt() ?? 1,
      weekday: (json['weekday'] as num?)?.toInt() ?? 1,
      week: (json['week'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExamScheduleToJson(ExamSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'time': instance.time,
      'start_time': DateTimeUtils.toRfc3339(instance.startTime),
      'end_time': DateTimeUtils.toRfc3339(instance.endTime),
      'section': instance.section,
      'weekday': instance.weekday,
      'week': instance.week,
      'campus': instance.campus,
      'building': instance.building,
      'room': instance.room,
      'course': instance.course,
      'tag': instance.tag,
      'status': instance.status,
    };
