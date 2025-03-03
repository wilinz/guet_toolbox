// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_course_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsCourseInfo _$CreditsCourseInfoFromJson(Map<String, dynamic> json) =>
    CreditsCourseInfo(
      courseName: json['courseName'] as String? ?? '',
      courseNameEn: json['courseNameEn'] as String? ?? '',
      courseCode: json['courseCode'] as String? ?? '',
      creditsCourse: json['creditsCourse'] as bool? ?? false,
    );

Map<String, dynamic> _$CreditsCourseInfoToJson(CreditsCourseInfo instance) =>
    <String, dynamic>{
      'courseName': instance.courseName,
      'courseNameEn': instance.courseNameEn,
      'courseCode': instance.courseCode,
      'creditsCourse': instance.creditsCourse,
    };
