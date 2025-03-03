// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedagogical_evaluation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedagogicalEvaluationResponse _$PedagogicalEvaluationResponseFromJson(
        Map<String, dynamic> json) =>
    PedagogicalEvaluationResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  PedagogicalEvaluation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PedagogicalEvaluationResponseToJson(
        PedagogicalEvaluationResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

PedagogicalEvaluation _$PedagogicalEvaluationFromJson(
        Map<String, dynamic> json) =>
    PedagogicalEvaluation(
      term: json['term'] as String? ?? '',
      stid: json['stid'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      teacherno: json['teacherno'] as String? ?? '',
      courseno: json['courseno'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      name: json['name'] as String? ?? '',
      lb: (json['lb'] as num?)?.toInt() ?? 0,
      chk: (json['chk'] as num?)?.toInt() ?? 0,
      can: json['can'] as bool? ?? false,
    );

Map<String, dynamic> _$PedagogicalEvaluationToJson(
        PedagogicalEvaluation instance) =>
    <String, dynamic>{
      'term': instance.term,
      'stid': instance.stid,
      'courseid': instance.courseid,
      'teacherno': instance.teacherno,
      'courseno': instance.courseno,
      'cname': instance.cname,
      'name': instance.name,
      'lb': instance.lb,
      'chk': instance.chk,
      'can': instance.can,
    };
