// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) => StudentInfo(
      term: json['term'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      collegeNo: json['dptno'] as String? ?? '',
      collegeName: json['dptname'] as String? ?? '',
      majorNo: json['spno'] as String? ?? '',
      majorName: json['spname'] as String? ?? '',
      studentId: json['stid'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StudentInfoToJson(StudentInfo instance) =>
    <String, dynamic>{
      'term': instance.term,
      'grade': instance.grade,
      'dptno': instance.collegeNo,
      'dptname': instance.collegeName,
      'spno': instance.majorNo,
      'spname': instance.majorName,
      'stid': instance.studentId,
      'name': instance.name,
    };
