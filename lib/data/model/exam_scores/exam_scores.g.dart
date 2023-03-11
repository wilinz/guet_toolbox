// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_scores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamScores _$ExamScoresFromJson(Map<String, dynamic> json) => ExamScores(
      success: json['success'] as bool? ?? false,
      total: json['total'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExamScoresToJson(ExamScores instance) =>
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
      bj: json['bj'] as String? ?? '',
      grade: json['grade'] as int? ?? 0,
      stid: json['stid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      term: json['term'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      courseno: json['courseno'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      courselevel: json['courselevel'],
      score: json['score'] as int? ?? 0,
      zpxs: json['zpxs'] as String? ?? '',
      kctype: json['kctype'] as String? ?? '',
      typeno: json['typeno'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      cno: json['cno'] as String? ?? '',
      sycj: (json['sycj'] as num?)?.toDouble() ?? 0.0,
      qzcj: (json['qzcj'] as num?)?.toDouble() ?? 0.0,
      pscj: (json['pscj'] as num?)?.toDouble() ?? 0.0,
      khcj: (json['khcj'] as num?)?.toDouble() ?? 0.0,
      zpcj: (json['zpcj'] as num?)?.toDouble() ?? 0.0,
      kslb: json['kslb'] as String? ?? '',
      cjlb: json['cjlb'] as String? ?? '',
      kssj: json['kssj'] as int? ?? 0,
      xf: (json['xf'] as num?)?.toDouble() ?? 0.0,
      xslb: json['xslb'] as String? ?? '',
      tname1: json['tname1'],
      stage: (json['stage'] as num?)?.toDouble() ?? 0.0,
      examt: json['examt'] as String? ?? '',
      xs: json['xs'] as int? ?? 0,
      cjlx: json['cjlx'] as int? ?? 0,
      chk: json['chk'] as int? ?? 0,
      comm: json['comm'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dptno': instance.dptno,
      'dptname': instance.dptname,
      'spno': instance.spno,
      'spname': instance.spname,
      'bj': instance.bj,
      'grade': instance.grade,
      'stid': instance.stid,
      'name': instance.name,
      'term': instance.term,
      'courseid': instance.courseid,
      'courseno': instance.courseno,
      'cname': instance.cname,
      'courselevel': instance.courselevel,
      'score': instance.score,
      'zpxs': instance.zpxs,
      'kctype': instance.kctype,
      'typeno': instance.typeno,
      'cid': instance.cid,
      'cno': instance.cno,
      'sycj': instance.sycj,
      'qzcj': instance.qzcj,
      'pscj': instance.pscj,
      'khcj': instance.khcj,
      'zpcj': instance.zpcj,
      'kslb': instance.kslb,
      'cjlb': instance.cjlb,
      'kssj': instance.kssj,
      'xf': instance.xf,
      'xslb': instance.xslb,
      'tname1': instance.tname1,
      'stage': instance.stage,
      'examt': instance.examt,
      'xs': instance.xs,
      'cjlx': instance.cjlx,
      'chk': instance.chk,
      'comm': instance.comm,
    };
