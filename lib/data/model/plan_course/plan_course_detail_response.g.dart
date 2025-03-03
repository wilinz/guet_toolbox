// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_course_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanCourseDetailResponse _$PlanCourseDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PlanCourseDetailResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => PlanCourseDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PlanCourseDetailResponseToJson(
        PlanCourseDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

PlanCourseDetail _$PlanCourseDetailFromJson(Map<String, dynamic> json) =>
    PlanCourseDetail(
      id: json['id'] as String?,
      term: json['term'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      cname: json['cname'] as String?,
      spno: json['spno'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      tname: json['tname'] as String?,
      xf: json['xf'] as String? ?? '',
      scted: (json['scted'] as num?)?.toInt() ?? 0,
      courseno: json['courseno'] as String? ?? '',
      name: json['name'] as String? ?? '',
      maxstu: (json['maxstu'] as num?)?.toInt() ?? 0,
      sctcnt: (json['sctcnt'] as num?)?.toInt() ?? 0,
      stid: json['stid'],
      comm: json['comm'] as String?,
      lot: (json['lot'] as num?)?.toInt() ?? 0,
      ap: json['ap'] as String? ?? '',
      xm: json['xm'],
    )..stype = json['stype'] as String? ?? '正常';

Map<String, dynamic> _$PlanCourseDetailToJson(PlanCourseDetail instance) =>
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
      'stype': instance.stype,
    };
