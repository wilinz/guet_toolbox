// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateDetail _$TextbookEvaluateDetailFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateDetail(
      answer: json['answer'],
      finalScore: json['finalScore'],
      fontNum: json['fontNum'],
      maxSize: (json['maxSize'] as num?)?.toInt(),
      nameEn: json['nameEn'] as String?,
      nameZh: json['nameZh'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      questionType: json['questionType'] == null
          ? QuestionType.emptyInstance()
          : QuestionType.fromJson(json['questionType'] as Map<String, dynamic>),
      required: json['required'] as bool?,
      score: (json['score'] as num?)?.toInt(),
      scoreFont: json['scoreFont'],
      selectNum: json['selectNum'],
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$TextbookEvaluateDetailToJson(
        TextbookEvaluateDetail instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'finalScore': instance.finalScore,
      'fontNum': instance.fontNum,
      'maxSize': instance.maxSize,
      'nameEn': instance.nameEn,
      'nameZh': instance.nameZh,
      'options': instance.options?.map((e) => e.toJson()).toList(),
      'questionType': instance.questionType.toJson(),
      'required': instance.required,
      'score': instance.score,
      'scoreFont': instance.scoreFont,
      'selectNum': instance.selectNum,
      'type': instance.type,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      checked: json['checked'],
      contentEn: json['contentEn'] as String? ?? '',
      contentZh: json['contentZh'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'checked': instance.checked,
      'contentEn': instance.contentEn,
      'contentZh': instance.contentZh,
      'score': instance.score,
    };

QuestionType _$QuestionTypeFromJson(Map<String, dynamic> json) => QuestionType(
      $type: json[r'$type'] as String? ?? '',
      $name: json[r'$name'] as String? ?? '',
    );

Map<String, dynamic> _$QuestionTypeToJson(QuestionType instance) =>
    <String, dynamic>{
      r'$type': instance.$type,
      r'$name': instance.$name,
    };
