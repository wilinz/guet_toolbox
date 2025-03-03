// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanCourse _$PlanCourseFromJson(Map<String, dynamic> json) => PlanCourse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PlanCourseToJson(PlanCourse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dptno: json['dptno'] as String? ?? '',
      dptname: json['dptname'] as String? ?? '',
      spno: json['spno'] as String? ?? '',
      spname: json['spname'] as String? ?? '',
      stid: json['stid'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      classno: json['classno'] as String? ?? '',
      name: json['name'] as String? ?? '',
      coursetype: json['coursetype'] as String? ?? '',
      tname: json['tname'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      credithour: json['credithour'] as String? ?? '',
      score: json['score'] as String?,
      zpxs: json['zpxs'] as String?,
      term: json['term'] as String? ?? '',
      sterm: json['sterm'] as String?,
      scname: json['scname'] as String?,
      courseid: json['courseid'] as String? ?? '',
      courseno: json['courseno'] as String?,
      stp: json['stp'] as String?,
      xf: json['xf'] as String?,
      chk: json['chk'] as String? ?? '',
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dptno': instance.dptno,
      'dptname': instance.dptname,
      'spno': instance.spno,
      'spname': instance.spname,
      'stid': instance.stid,
      'grade': instance.grade,
      'classno': instance.classno,
      'name': instance.name,
      'coursetype': instance.coursetype,
      'tname': instance.tname,
      'cname': instance.cname,
      'credithour': instance.credithour,
      'score': instance.score,
      'zpxs': instance.zpxs,
      'term': instance.term,
      'sterm': instance.sterm,
      'scname': instance.scname,
      'courseid': instance.courseid,
      'courseno': instance.courseno,
      'stp': instance.stp,
      'xf': instance.xf,
      'chk': instance.chk,
    };
