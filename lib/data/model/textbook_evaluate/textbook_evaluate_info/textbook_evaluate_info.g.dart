// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textbook_evaluate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextbookEvaluateInfo _$TextbookEvaluateInfoFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateInfo(
      batchOpen: json['batchOpen'] as bool? ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  TextbookEvaluateInfoData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      evaluateBatch: json['evaluateBatch'] == null
          ? EvaluateBatch.emptyInstance()
          : EvaluateBatch.fromJson(
              json['evaluateBatch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextbookEvaluateInfoToJson(
        TextbookEvaluateInfo instance) =>
    <String, dynamic>{
      'batchOpen': instance.batchOpen,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'evaluateBatch': instance.evaluateBatch.toJson(),
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
      nameEn: json['nameEn'],
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

EvaluateIndex _$EvaluateIndexFromJson(Map<String, dynamic> json) =>
    EvaluateIndex(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
    );

Map<String, dynamic> _$EvaluateIndexToJson(EvaluateIndex instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

TextbookEvaluateInfoData _$TextbookEvaluateInfoDataFromJson(
        Map<String, dynamic> json) =>
    TextbookEvaluateInfoData(
      course: json['course'] == null
          ? Course.emptyInstance()
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      textbook: json['textbook'] == null
          ? Textbook.emptyInstance()
          : Textbook.fromJson(json['textbook'] as Map<String, dynamic>),
      evaluateIndex: json['evaluateIndex'] == null
          ? EvaluateIndex.emptyInstance()
          : EvaluateIndex.fromJson(
              json['evaluateIndex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextbookEvaluateInfoDataToJson(
        TextbookEvaluateInfoData instance) =>
    <String, dynamic>{
      'course': instance.course.toJson(),
      'textbook': instance.textbook.toJson(),
      'evaluateIndex': instance.evaluateIndex.toJson(),
    };

EvaluateBatch _$EvaluateBatchFromJson(Map<String, dynamic> json) =>
    EvaluateBatch(
      id: (json['id'] as num?)?.toInt() ?? 0,
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      bulletin: json['bulletin'],
    );

Map<String, dynamic> _$EvaluateBatchToJson(EvaluateBatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'bulletin': instance.bulletin,
    };
