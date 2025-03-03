// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamScheduleResponse _$ExamScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    ExamScheduleResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ExamSchedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExamScheduleResponseToJson(
        ExamScheduleResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ExamSchedule _$ExamScheduleFromJson(Map<String, dynamic> json) => ExamSchedule(
      classroomNo: json['croomno'] as String? ?? '',
      classroomName: json['croomname'],
      teacher: json['tch'],
      teacher1: json['tch1'],
      teacher2: json['tch2'],
      js: json['js'],
      js1: json['js1'],
      js2: json['js2'],
      studentId1: json['stid1'],
      studentId2: json['stid2'],
      roomSeats: (json['roomrs'] as num?)?.toInt() ?? 0,
      pc: (json['pc'] as num?)?.toInt() ?? 0,
      term: json['term'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      department: json['dpt'],
      majorCode: json['spno'] as String? ?? '',
      majorName: json['spname'] as String? ?? '',
      courseId: json['courseid'] as String? ?? '',
      courseNo: json['courseno'] as String? ?? '',
      labNo: json['labno'],
      labName: json['labname'],
      departmentNo: json['dptno'] as String? ?? '',
      teacherNo: json['teacherno'] as String? ?? '',
      teacherName: json['name'] as String? ?? '',
      credit: json['xf'],
      courseName: json['cname'] as String? ?? '',
      enrollmentCount: json['sctcnt'] as String? ?? '',
      studentCount: json['stucnt'] as String? ?? '',
      scoreType: json['scoretype'],
      examType: json['examt'],
      examCategory: json['kctype'],
      typeNo: json['typeno'],
      examDate: json['examdate'] as String? ?? '',
      examTime: json['examtime'],
      examState: (json['examstate'] as num?)?.toInt() ?? 0,
      examMode: json['exammode'],
      xm: json['xm'],
      referenceTime: json['refertime'],
      weekNo: (json['zc'] as num?)?.toInt() ?? 0,
      weekDay: (json['xq'] as num?)?.toInt() ?? 0,
      startSection: json['ksjc'] as String? ?? '',
      endSection: json['jsjc'] as String? ?? '',
      bkzt: json['bkzt'] as String? ?? '',
      examTimeRange: json['kssj'] as String? ?? '',
      remarks: json['comm'] as String? ?? '',
      classroomInfo: json['rooms'] as String? ?? '',
      serialNo: json['lsh'] as String? ?? '',
      zone: (json['zone'] as num?)?.toInt() ?? 0,
      checked1: json['checked1'],
      postDate: json['postdate'],
      operator: json['operator'],
      pk: json['pk'],
    );

Map<String, dynamic> _$ExamScheduleToJson(ExamSchedule instance) =>
    <String, dynamic>{
      'croomno': instance.classroomNo,
      'croomname': instance.classroomName,
      'tch': instance.teacher,
      'tch1': instance.teacher1,
      'tch2': instance.teacher2,
      'js': instance.js,
      'js1': instance.js1,
      'js2': instance.js2,
      'stid1': instance.studentId1,
      'stid2': instance.studentId2,
      'roomrs': instance.roomSeats,
      'pc': instance.pc,
      'term': instance.term,
      'grade': instance.grade,
      'dpt': instance.department,
      'spno': instance.majorCode,
      'spname': instance.majorName,
      'courseid': instance.courseId,
      'courseno': instance.courseNo,
      'labno': instance.labNo,
      'labname': instance.labName,
      'dptno': instance.departmentNo,
      'teacherno': instance.teacherNo,
      'name': instance.teacherName,
      'xf': instance.credit,
      'cname': instance.courseName,
      'sctcnt': instance.enrollmentCount,
      'stucnt': instance.studentCount,
      'scoretype': instance.scoreType,
      'examt': instance.examType,
      'kctype': instance.examCategory,
      'typeno': instance.typeNo,
      'examdate': instance.examDate,
      'examtime': instance.examTime,
      'examstate': instance.examState,
      'exammode': instance.examMode,
      'xm': instance.xm,
      'refertime': instance.referenceTime,
      'zc': instance.weekNo,
      'xq': instance.weekDay,
      'ksjc': instance.startSection,
      'jsjc': instance.endSection,
      'bkzt': instance.bkzt,
      'kssj': instance.examTimeRange,
      'comm': instance.remarks,
      'rooms': instance.classroomInfo,
      'lsh': instance.serialNo,
      'zone': instance.zone,
      'checked1': instance.checked1,
      'postdate': instance.postDate,
      'operator': instance.operator,
      'pk': instance.pk,
    };
