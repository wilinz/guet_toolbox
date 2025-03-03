// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedagogical_evaluation_questions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedagogicalEvaluationQuestionsResponse
    _$PedagogicalEvaluationQuestionsResponseFromJson(
            Map<String, dynamic> json) =>
        PedagogicalEvaluationQuestionsResponse(
          success: json['success'] as bool? ?? false,
          total: (json['total'] as num?)?.toInt() ?? 0,
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => PedagogicalEvaluationQuestion.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
        );

Map<String, dynamic> _$PedagogicalEvaluationQuestionsResponseToJson(
        PedagogicalEvaluationQuestionsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

PedagogicalEvaluationQuestion _$PedagogicalEvaluationQuestionFromJson(
        Map<String, dynamic> json) =>
    PedagogicalEvaluationQuestion(
      lsh: (json['lsh'] as num?)?.toInt() ?? 0,
      term: json['term'] as String? ?? '',
      mc: json['mc'] as String? ?? '',
      nr: json['nr'] as String? ?? '',
      xh: (json['xh'] as num?)?.toInt() ?? 0,
      lb: json['lb'],
      qz: (json['qz'] as num?)?.toDouble() ?? 0.0,
      zbnh: json['zbnh'] as String? ?? '',
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
      zt: (json['zt'] as num?)?.toInt() ?? 0,
      score: _parseScore(json['score']),
    );

Map<String, dynamic> _$PedagogicalEvaluationQuestionToJson(
        PedagogicalEvaluationQuestion instance) =>
    <String, dynamic>{
      'lsh': instance.lsh,
      'term': instance.term,
      'mc': instance.mc,
      'nr': instance.nr,
      'xh': instance.xh,
      'lb': instance.lb,
      'qz': instance.qz,
      'zbnh': instance.zbnh,
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
      'zt': instance.zt,
      'score': instance.score,
    };
