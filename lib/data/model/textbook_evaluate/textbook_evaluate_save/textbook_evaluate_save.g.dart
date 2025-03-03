// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateSave _$TextbookEvaluateSaveFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateSave(
      semesterAssoc: (json['semesterAssoc'] as num?)?.toInt() ?? 0,
      courseAssoc: (json['courseAssoc'] as num?)?.toInt() ?? 0,
      textbookEvaluateBatchAssoc:
          (json['textbookEvaluateBatchAssoc'] as num?)?.toInt() ?? 0,
      textbookAssoc: (json['textbookAssoc'] as num?)?.toInt() ?? 0,
      studentAssoc: (json['studentAssoc'] as num?)?.toInt() ?? 0,
      evaluateDetail: (json['evaluateDetail'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      finalScore: (json['finalScore'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$TextbookEvaluateSaveToJson(
        TextbookEvaluateSave instance) =>
    <String, dynamic>{
      'semesterAssoc': instance.semesterAssoc,
      'courseAssoc': instance.courseAssoc,
      'textbookEvaluateBatchAssoc': instance.textbookEvaluateBatchAssoc,
      'textbookAssoc': instance.textbookAssoc,
      'studentAssoc': instance.studentAssoc,
      'evaluateDetail': instance.evaluateDetail,
      'finalScore': instance.finalScore,
    };

TextbookEvaluateSaveOptions _$TextbookEvaluateSaveOptionsFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateSaveOptions(
      contentZh: json['contentZh'] as String? ?? '',
      contentEn: json['contentEn'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      checked: (json['checked'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TextbookEvaluateSaveOptionsToJson(
        TextbookEvaluateSaveOptions instance) =>
    <String, dynamic>{
      'contentZh': instance.contentZh,
      'contentEn': instance.contentEn,
      'score': instance.score,
      'checked': instance.checked,
    };

EvaluateDetail _$EvaluateDetailFromJson(Map<String, dynamic> json) =>
    EvaluateDetail(
      questionType: json['questionType'] as String? ?? '',
      type: json['type'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => TextbookEvaluateSaveOptions.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      finalScore: (json['finalScore'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EvaluateDetailToJson(EvaluateDetail instance) =>
    <String, dynamic>{
      'questionType': instance.questionType,
      'type': instance.type,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'score': instance.score,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'finalScore': instance.finalScore,
    };
