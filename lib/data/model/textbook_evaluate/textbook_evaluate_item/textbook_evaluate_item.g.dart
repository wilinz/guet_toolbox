// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateItem _$TextbookEvaluateItemFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateItem(
      id: (json['id'] as num?)?.toInt(),
      evaluateDateTime: json['evaluateDateTime'] as String?,
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

Map<String, dynamic> _$TextbookEvaluateItemToJson(
        TextbookEvaluateItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'evaluateDateTime': instance.evaluateDateTime,
      'textbook': instance.textbook.toJson(),
      'course': instance.course.toJson(),
      'textbookEvaluateIndex': instance.textbookEvaluateIndex.toJson(),
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
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String?,
      author: json['author'] as String? ?? '',
      isbn: json['isbn'] as String? ?? '',
      press: json['press'] == null
          ? Press.emptyInstance()
          : Press.fromJson(json['press'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextbookToJson(Textbook instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'author': instance.author,
      'isbn': instance.isbn,
      'press': instance.press.toJson(),
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      credits: (json['credits'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'credits': instance.credits,
    };

TextbookEvaluateIndex _$TextbookEvaluateIndexFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateIndex(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String?,
    );

Map<String, dynamic> _$TextbookEvaluateIndexToJson(
        TextbookEvaluateIndex instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };
