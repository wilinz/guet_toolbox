// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) => StudentInfo(
      term: json['term'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      dptno: json['dptno'] as String? ?? '',
      dptname: json['dptname'] as String? ?? '',
      spno: json['spno'] as String? ?? '',
      spname: json['spname'] as String? ?? '',
      stid: json['stid'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$StudentInfoToJson(StudentInfo instance) =>
    <String, dynamic>{
      'term': instance.term,
      'grade': instance.grade,
      'dptno': instance.dptno,
      'dptname': instance.dptname,
      'spno': instance.spno,
      'spname': instance.spname,
      'stid': instance.stid,
      'name': instance.name,
    };
