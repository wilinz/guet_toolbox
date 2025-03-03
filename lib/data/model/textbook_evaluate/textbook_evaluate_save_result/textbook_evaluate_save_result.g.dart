// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_save_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateSaveResult _$TextbookEvaluateSaveResultFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateSaveResult(
      success: json['success'] as bool? ?? false,
      type: json['type'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$TextbookEvaluateSaveResultToJson(
        TextbookEvaluateSaveResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'type': instance.type,
      'content': instance.content,
    };
