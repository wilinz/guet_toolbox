// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => OldCourse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

OldCourse _$OldCourseFromJson(Map<String, dynamic> json) => OldCourse(
      id: (json['id'] as num?)?.toInt() ?? 0,
      ctype: json['ctype'] as String? ?? '',
      tname: json['tname'] as String? ?? '',
      examt: json['examt'] as String? ?? '',
      dptname: json['dptname'],
      dptno: json['dptno'] as String? ?? '',
      spname: json['spname'] as String? ?? '',
      spno: json['spno'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      courseno: json['courseno'] as String? ?? '',
      teacherno: json['teacherno'] as String? ?? '',
      name: json['name'] as String? ?? '',
      term: json['term'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      croomno: json['croomno'] as String?,
      comm: json['comm'] as String?,
      startweek: (json['startweek'] as num?)?.toInt() ?? 0,
      endweek: (json['endweek'] as num?)?.toInt() ?? 0,
      oddweek: json['oddweek'],
      week: (json['week'] as num?)?.toInt() ?? 0,
      seq: json['seq'] as String? ?? '',
      maxcnt: (json['maxcnt'] as num?)?.toInt() ?? 0,
      xf: (json['xf'] as num?)?.toDouble() ?? 0.0,
      llxs: (json['llxs'] as num?)?.toDouble() ?? 0.0,
      syxs: (json['syxs'] as num?)?.toDouble() ?? 0.0,
      sjxs: (json['sjxs'] as num?)?.toDouble() ?? 0.0,
      qtxs: (json['qtxs'] as num?)?.toDouble() ?? 0.0,
      sctcnt: (json['sctcnt'] as num?)?.toInt() ?? 0,
      hours: (json['hours'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OldCourseToJson(OldCourse instance) => <String, dynamic>{
      'id': instance.id,
      'ctype': instance.ctype,
      'tname': instance.tname,
      'examt': instance.examt,
      'dptname': instance.dptname,
      'dptno': instance.dptno,
      'spname': instance.spname,
      'spno': instance.spno,
      'grade': instance.grade,
      'cname': instance.cname,
      'courseno': instance.courseno,
      'teacherno': instance.teacherno,
      'name': instance.name,
      'term': instance.term,
      'courseid': instance.courseid,
      'croomno': instance.croomno,
      'comm': instance.comm,
      'startweek': instance.startweek,
      'endweek': instance.endweek,
      'oddweek': instance.oddweek,
      'week': instance.week,
      'seq': instance.seq,
      'maxcnt': instance.maxcnt,
      'xf': instance.xf,
      'llxs': instance.llxs,
      'syxs': instance.syxs,
      'sjxs': instance.sjxs,
      'qtxs': instance.qtxs,
      'sctcnt': instance.sctcnt,
      'hours': instance.hours,
    };
