// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_save_subjective_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateSaveSubjectiveQuestion
    _$TextbookEvaluateSaveSubjectiveQuestionFromJson(
            Map<String, dynamic> json) =>
        TextbookEvaluateSaveSubjectiveQuestion(
          questionType: json['questionType'] as String? ?? '',
          type: json['type'] as String? ?? '',
          nameZh: json['nameZh'] as String? ?? '',
          nameEn: json['nameEn'] as String? ?? '',
          required: json['required'] as bool? ?? false,
          maxSize: json['maxSize'] as String? ?? '',
          answer: json['answer'] as String? ?? '',
        );

Map<String, dynamic> _$TextbookEvaluateSaveSubjectiveQuestionToJson(
        TextbookEvaluateSaveSubjectiveQuestion instance) =>
    <String, dynamic>{
      'questionType': instance.questionType,
      'type': instance.type,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'required': instance.required,
      'maxSize': instance.maxSize,
      'answer': instance.answer,
    };
