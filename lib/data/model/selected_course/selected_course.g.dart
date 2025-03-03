// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedCourse _$SelectedCourseFromJson(Map<String, dynamic> json) =>
    SelectedCourse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SelectedCourseToJson(SelectedCourse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      xf: json['xf'] as String? ?? '',
      classno: json['classno'] as String? ?? '',
      spno: json['spno'] as String? ?? '',
      spname: json['spname'],
      tname: json['tname'] as String? ?? '',
      tname1: json['tname1'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      pycc: json['pycc'] as String? ?? '',
      dpt: json['dpt'] as String? ?? '',
      dptno: json['dptno'] as String? ?? '',
      xm: json['xm'],
      warn: json['warn'],
      role: json['role'],
      demo: json['demo'] as String?,
      testtype: json['testtype'] as String? ?? '',
      stid: json['stid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      term: json['term'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      courseno: json['courseno'] as String? ?? '',
      stype: json['stype'] as String? ?? '',
      khsj: json['khsj'],
      state: (json['state'] as num?)?.toInt() ?? 0,
      xksj: json['xksj'] as String? ?? '',
      ip: json['ip'] as String? ?? '',
      comm: json['comm'] as String?,
      checked: (json['checked'] as num?)?.toInt() ?? 0,
      pscj: json['pscj'],
      khzt: json['khzt'],
      cjf: json['cjf'],
      setjc: json['setjc'],
      textnum: json['textnum'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'xf': instance.xf,
      'classno': instance.classno,
      'spno': instance.spno,
      'spname': instance.spname,
      'tname': instance.tname,
      'tname1': instance.tname1,
      'grade': instance.grade,
      'cname': instance.cname,
      'pycc': instance.pycc,
      'dpt': instance.dpt,
      'dptno': instance.dptno,
      'xm': instance.xm,
      'warn': instance.warn,
      'role': instance.role,
      'demo': instance.demo,
      'testtype': instance.testtype,
      'stid': instance.stid,
      'name': instance.name,
      'term': instance.term,
      'courseid': instance.courseid,
      'courseno': instance.courseno,
      'stype': instance.stype,
      'khsj': instance.khsj,
      'state': instance.state,
      'xksj': instance.xksj,
      'ip': instance.ip,
      'comm': instance.comm,
      'checked': instance.checked,
      'pscj': instance.pscj,
      'khzt': instance.khzt,
      'cjf': instance.cjf,
      'setjc': instance.setjc,
      'textnum': instance.textnum,
    };
