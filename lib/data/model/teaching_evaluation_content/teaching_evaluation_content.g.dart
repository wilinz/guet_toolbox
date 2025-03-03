// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_evaluation_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachingEvaluationContentResponse _$TeachingEvaluationContentResponseFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationContentResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
      data: json['data'] == null
          ? TeachingEvaluationContent.emptyInstance()
          : TeachingEvaluationContent.fromJson(
              json['data'] as Map<String, dynamic>),
      ok: json['ok'] as bool? ?? false,
    );

Map<String, dynamic> _$TeachingEvaluationContentResponseToJson(
        TeachingEvaluationContentResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.toJson(),
      'ok': instance.ok,
    };

TeachingEvaluationContent _$TeachingEvaluationContentFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationContent(
      id: json['id'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      introduction: json['introduction'],
      remark: json['remark'],
      status: json['status'] as bool? ?? false,
      questions: json['questions'] == null
          ? []
          : _parseQuestions(json['questions'] as String),
      enable: json['enable'] as bool? ?? false,
      needScoring: json['needScoring'] as bool? ?? false,
      totalScore: (json['totalScore'] as num?)?.toDouble() ?? 0.0,
      questionNum: json['questionNum'] as String? ?? '',
      evaluateTypeId: json['evaluateTypeId'] as String? ?? '',
      evaluateTypeNameZh: json['evaluateTypeNameZh'] as String? ?? '',
      evaluateTypeNameEn: json['evaluateTypeNameEn'] as String? ?? '',
      departmentId: json['departmentId'] as String? ?? '',
      departmentNameZh: json['departmentNameZh'] as String? ?? '',
      departmentNameEn: json['departmentNameEn'],
      copyFrom: json['copyFrom'],
      gmtCreate: json['gmtCreate'] as String? ?? '',
      gmtModify: json['gmtModify'] as String? ?? '',
      createdByLoginname: json['createdByLoginname'] as String? ?? '',
      createdByPersonid: json['createdByPersonid'] as String? ?? '',
      identityStr: json['identityStr'] as String? ?? '',
      quote: json['quote'] as String? ?? '',
      teacherId: json['teacherId'],
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TeachingEvaluationContentToJson(
        TeachingEvaluationContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'introduction': instance.introduction,
      'remark': instance.remark,
      'status': instance.status,
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'enable': instance.enable,
      'needScoring': instance.needScoring,
      'totalScore': instance.totalScore,
      'questionNum': instance.questionNum,
      'evaluateTypeId': instance.evaluateTypeId,
      'evaluateTypeNameZh': instance.evaluateTypeNameZh,
      'evaluateTypeNameEn': instance.evaluateTypeNameEn,
      'departmentId': instance.departmentId,
      'departmentNameZh': instance.departmentNameZh,
      'departmentNameEn': instance.departmentNameEn,
      'copyFrom': instance.copyFrom,
      'gmtCreate': instance.gmtCreate,
      'gmtModify': instance.gmtModify,
      'createdByLoginname': instance.createdByLoginname,
      'createdByPersonid': instance.createdByPersonid,
      'identityStr': instance.identityStr,
      'quote': instance.quote,
      'teacherId': instance.teacherId,
      'name': instance.name,
    };
