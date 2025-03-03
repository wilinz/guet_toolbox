// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedagogical_evaluation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PedagogicalEvaluationData _$PedagogicalEvaluationDataFromJson(
        Map<String, dynamic> json) =>
    PedagogicalEvaluationData(
      term: json['term'] as String? ?? '',
      stid: json['stid'] as String? ?? '',
      teacherno: json['teacherno'] as String? ?? '',
      courseno: json['courseno'] as String? ?? '',
      courseid: json['courseid'] as String? ?? '',
      score: json['score'] as num? ?? 0,
      chk: (json['chk'] as num?)?.toInt() ?? 0,
      lb: (json['lb'] as num?)?.toInt() ?? 0,
      bz: json['bz'] as String? ?? '',
      cname: json['cname'] as String? ?? '',
      name: json['name'] as String? ?? '',
      can: json['can'] as bool? ?? false,
      userid: json['userid'] as String? ?? '',
    );

Map<String, dynamic> _$PedagogicalEvaluationDataToJson(
        PedagogicalEvaluationData instance) =>
    <String, dynamic>{
      'term': instance.term,
      'stid': instance.stid,
      'teacherno': instance.teacherno,
      'courseno': instance.courseno,
      'courseid': instance.courseid,
      'score': instance.score,
      'chk': instance.chk,
      'lb': instance.lb,
      'bz': instance.bz,
      'cname': instance.cname,
      'name': instance.name,
      'can': instance.can,
      'userid': instance.userid,
    };
