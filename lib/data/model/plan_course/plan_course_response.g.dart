// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanCourseResponse _$PlanCourseResponseFromJson(Map<String, dynamic> json) =>
    PlanCourseResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => PlanCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PlanCourseResponseToJson(PlanCourseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

PlanCourse _$PlanCourseFromJson(Map<String, dynamic> json) => PlanCourse(
      id: json['id'] as String? ?? '',
      term: json['term'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      spno: json['spno'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      tname: json['tname'] as String? ?? '',
      xf: json['xf'] as String? ?? '',
      scted: (json['scted'] as num?)?.toInt() ?? 0,
      courseno: json['courseno'],
      name: json['name'],
      maxstu: (json['maxstu'] as num?)?.toInt() ?? 0,
      sctcnt: (json['sctcnt'] as num?)?.toInt() ?? 0,
      stid: json['stid'],
      comm: json['comm'],
      lot: (json['lot'] as num?)?.toInt() ?? 0,
      ap: json['ap'],
      xm: json['xm'],
    );

Map<String, dynamic> _$PlanCourseToJson(PlanCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'term': instance.term,
      'courseid': instance.courseid,
      'cname': instance.cname,
      'spno': instance.spno,
      'grade': instance.grade,
      'tname': instance.tname,
      'xf': instance.xf,
      'scted': instance.scted,
      'courseno': instance.courseno,
      'name': instance.name,
      'maxstu': instance.maxstu,
      'sctcnt': instance.sctcnt,
      'stid': instance.stid,
      'comm': instance.comm,
      'lot': instance.lot,
      'ap': instance.ap,
      'xm': instance.xm,
    };
