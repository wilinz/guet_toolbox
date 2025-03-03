// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_lab_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseLabResponse _$CourseLabResponseFromJson(Map<String, dynamic> json) =>
    CourseLabResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CourseLab.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CourseLabResponseToJson(CourseLabResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

CourseLab _$CourseLabFromJson(Map<String, dynamic> json) => CourseLab(
      term: json['term'] as String? ?? '',
      labid: json['labid'] as String? ?? '',
      itemname: json['itemname'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      spno: json['spno'] as String? ?? '',
      spname: json['spname'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      teacherno: json['teacherno'] as String? ?? '',
      name: json['name'] as String? ?? '',
      srname: json['srname'] as String? ?? '',
      srdd: json['srdd'] as String? ?? '',
      xh: json['xh'] as String? ?? '',
      bno: (json['bno'] as num?)?.toInt() ?? 0,
      persons: (json['persons'] as num?)?.toInt() ?? 0,
      zc: (json['zc'] as num?)?.toInt() ?? 0,
      xq: (json['xq'] as num?)?.toInt() ?? 0,
      jc: (json['jc'] as num?)?.toInt() ?? 0,
      jc1: (json['jc1'] as num?)?.toInt() ?? 0,
      assistantno: json['assistantno'] as String? ?? '',
      teachers: json['teachers'],
      comm: json['comm'],
      courseno: json['courseno'],
      stusct: (json['stusct'] as num?)?.toInt() ?? 0,
      srid: json['srid'] as String? ?? '',
      spnos: json['spnos'],
    );

Map<String, dynamic> _$CourseLabToJson(CourseLab instance) => <String, dynamic>{
      'term': instance.term,
      'labid': instance.labid,
      'itemname': instance.itemname,
      'courseid': instance.courseid,
      'cname': instance.cname,
      'spno': instance.spno,
      'spname': instance.spname,
      'grade': instance.grade,
      'teacherno': instance.teacherno,
      'name': instance.name,
      'srname': instance.srname,
      'srdd': instance.srdd,
      'xh': instance.xh,
      'bno': instance.bno,
      'persons': instance.persons,
      'zc': instance.zc,
      'xq': instance.xq,
      'jc': instance.jc,
      'jc1': instance.jc1,
      'assistantno': instance.assistantno,
      'teachers': instance.teachers,
      'comm': instance.comm,
      'courseno': instance.courseno,
      'stusct': instance.stusct,
      'srid': instance.srid,
      'spnos': instance.spnos,
    };
