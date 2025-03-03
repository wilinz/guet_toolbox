// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedagogical_evaluation_questions_save_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedagogicalEvaluationQuestionsSaveRequest
    _$PedagogicalEvaluationQuestionsSaveRequestFromJson(
            Map<String, dynamic> json) =>
        PedagogicalEvaluationQuestionsSaveRequest(
          term: json['term'] as String? ?? '',
          lsh: (json['lsh'] as num?)?.toInt() ?? 0,
          courseid: json['courseid'] as String? ?? '',
          lb: (json['lb'] as num?)?.toInt() ?? 0,
          score: (json['score'] as num?)?.toInt() ?? 0,
          teacherno: json['teacherno'] as String? ?? '',
          courseno: json['courseno'] as String? ?? '',
          dja: json['dja'] as String? ?? '',
          afz: (json['afz'] as num?)?.toInt() ?? 0,
          djb: json['djb'] as String? ?? '',
          bfz: (json['bfz'] as num?)?.toInt() ?? 0,
          djc: json['djc'] as String? ?? '',
          cfz: (json['cfz'] as num?)?.toInt() ?? 0,
          djd: json['djd'] as String? ?? '',
          dfz: (json['dfz'] as num?)?.toInt() ?? 0,
          dje: json['dje'] as String? ?? '',
          efz: (json['efz'] as num?)?.toInt() ?? 0,
          nr: json['nr'] as String? ?? '',
          zbnh: json['zbnh'] as String? ?? '',
          qz: (json['qz'] as num?)?.toDouble() ?? 0.0,
          zp: (json['zp'] as num?)?.toInt() ?? 0,
        );

Map<String, dynamic> _$PedagogicalEvaluationQuestionsSaveRequestToJson(
        PedagogicalEvaluationQuestionsSaveRequest instance) =>
    <String, dynamic>{
      'term': instance.term,
      'lsh': instance.lsh,
      'courseid': instance.courseid,
      'lb': instance.lb,
      'score': instance.score,
      'teacherno': instance.teacherno,
      'courseno': instance.courseno,
      'dja': instance.dja,
      'afz': instance.afz,
      'djb': instance.djb,
      'bfz': instance.bfz,
      'djc': instance.djc,
      'cfz': instance.cfz,
      'djd': instance.djd,
      'dfz': instance.dfz,
      'dje': instance.dje,
      'efz': instance.efz,
      'nr': instance.nr,
      'zbnh': instance.zbnh,
      'qz': instance.qz,
      'zp': instance.zp,
    };
