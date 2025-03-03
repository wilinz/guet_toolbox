// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateResult _$TextbookEvaluateResultFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TextbookEvaluateResultData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TextbookEvaluateResultToJson(
        TextbookEvaluateResult instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Press _$PressFromJson(Map<String, dynamic> json) => Press(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
    );

Map<String, dynamic> _$PressToJson(Press instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

Textbook _$TextbookFromJson(Map<String, dynamic> json) => Textbook(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      author: json['author'] as String? ?? '',
      isbn: json['isbn'] as String? ?? '',
      press: json['press'] == null
          ? Press.emptyInstance()
          : Press.fromJson(json['press'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextbookToJson(Textbook instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'author': instance.author,
      'isbn': instance.isbn,
      'press': instance.press.toJson(),
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      credits: (json['credits'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'credits': instance.credits,
    };

TextbookEvaluateIndex _$TextbookEvaluateIndexFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateIndex(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
    );

Map<String, dynamic> _$TextbookEvaluateIndexToJson(
        TextbookEvaluateIndex instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

TextbookEvaluateResultData _$TextbookEvaluateResultDataFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateResultData(
      id: (json['id'] as num?)?.toInt() ?? 0,
      evaluateDateTime: json['evaluateDateTime'] as String? ?? '',
      textbook: json['textbook'] == null
          ? Textbook.emptyInstance()
          : Textbook.fromJson(json['textbook'] as Map<String, dynamic>),
      course: json['course'] == null
          ? Course.emptyInstance()
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      textbookEvaluateIndex: json['textbookEvaluateIndex'] == null
          ? TextbookEvaluateIndex.emptyInstance()
          : TextbookEvaluateIndex.fromJson(
              json['textbookEvaluateIndex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextbookEvaluateResultDataToJson(
        TextbookEvaluateResultData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'evaluateDateTime': instance.evaluateDateTime,
      'textbook': instance.textbook.toJson(),
      'course': instance.course.toJson(),
      'textbookEvaluateIndex': instance.textbookEvaluateIndex.toJson(),
    };
