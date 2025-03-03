// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_calendar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherCalendarResponse _$TeacherCalendarResponseFromJson(
        Map<String, dynamic> json) =>
    TeacherCalendarResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) =>
                  TeacherCalendarOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TeacherCalendarResponseToJson(
        TeacherCalendarResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'timestamp': instance.timestamp,
    };

TeacherCalendarOption _$TeacherCalendarOptionFromJson(
        Map<String, dynamic> json) =>
    TeacherCalendarOption(
      text: json['text'] as String? ?? '',
      value: json['value'] as String? ?? '',
      syncId: json['syncId'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherCalendarOptionToJson(
        TeacherCalendarOption instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
      'syncId': instance.syncId,
    };
