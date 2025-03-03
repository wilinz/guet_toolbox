// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_scores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamScoresResponse _$ExamScoresResponseFromJson(Map<String, dynamic> json) =>
    ExamScoresResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ExamScore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExamScoresResponseToJson(ExamScoresResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

ExamScore _$ExamScoreFromJson(Map<String, dynamic> json) => ExamScore(
      departmentNumber: json['dptno'] as String? ?? '',
      departmentName: json['dptname'] as String? ?? '',
      specializationNumber: json['spno'] as String? ?? '',
      specializationName: json['spname'] as String? ?? '',
      classNumber: json['bj'] as String? ?? '',
      enrollmentYear: (json['grade'] as num?)?.toInt() ?? 0,
      studentId: json['stid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      term: json['term'] as String? ?? '',
      courseId: json['courseid'] as String? ?? '',
      courseNumber: json['courseno'] as String? ?? '',
      courseName: json['cname'] as String? ?? '',
      courseLevel: json['courselevel'],
      score: (json['score'] as num?)?.toDouble() ?? 0,
      overallScoreAlias: json['zpxs'] as String? ?? '',
      courseType: json['kctype'] as String? ?? '',
      typeNo: json['typeno'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      cno: json['cno'] as String? ?? '',
      labScore: (json['sycj'] as num?)?.toDouble() ?? 0.0,
      midtermScore: (json['qzcj'] as num?)?.toDouble() ?? 0.0,
      regularScore: (json['pscj'] as num?)?.toDouble() ?? 0.0,
      examScore: (json['khcj'] as num?)?.toDouble() ?? 0.0,
      overallScore: (json['zpcj'] as num?)?.toDouble() ?? 0.0,
      examCategory: json['kslb'] as String? ?? '',
      scoreCategory: json['cjlb'] as String? ?? '',
      examTime: (json['kssj'] as num?)?.toInt() ?? 0,
      credit: (json['xf'] as num?)?.toDouble() ?? 0.0,
      studentCategory: json['xslb'] as String? ?? '',
      teacherName: json['tname1'] as String?,
      stage: (json['stage'] as num?)?.toDouble() ?? 0.0,
      examType: json['examt'] as String? ?? '',
      xs: (json['xs'] as num?)?.toInt() ?? 0,
      scoreType: (json['cjlx'] as num?)?.toInt() ?? 0,
      chk: (json['chk'] as num?)?.toInt() ?? 0,
      remarks: json['comm'] as String?,
    );

Map<String, dynamic> _$ExamScoreToJson(ExamScore instance) => <String, dynamic>{
      'dptno': instance.departmentNumber,
      'dptname': instance.departmentName,
      'spno': instance.specializationNumber,
      'spname': instance.specializationName,
      'bj': instance.classNumber,
      'grade': instance.enrollmentYear,
      'stid': instance.studentId,
      'name': instance.name,
      'term': instance.term,
      'courseid': instance.courseId,
      'courseno': instance.courseNumber,
      'cname': instance.courseName,
      'courselevel': instance.courseLevel,
      'score': instance.score,
      'zpxs': instance.overallScoreAlias,
      'kctype': instance.courseType,
      'typeno': instance.typeNo,
      'cid': instance.cid,
      'cno': instance.cno,
      'sycj': instance.labScore,
      'qzcj': instance.midtermScore,
      'pscj': instance.regularScore,
      'khcj': instance.examScore,
      'zpcj': instance.overallScore,
      'kslb': instance.examCategory,
      'cjlb': instance.scoreCategory,
      'kssj': instance.examTime,
      'xf': instance.credit,
      'xslb': instance.studentCategory,
      'tname1': instance.teacherName,
      'stage': instance.stage,
      'examt': instance.examType,
      'xs': instance.xs,
      'cjlx': instance.scoreType,
      'chk': instance.chk,
      'comm': instance.remarks,
    };
