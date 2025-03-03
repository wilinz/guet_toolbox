// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_evaluation_submit.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$QuestionAndAnswerAutoequal on QuestionAndAnswer {
  List<Object?> get _$props => [
        questionId,
        questionnaireId,
        question,
        answer,
      ];
}

extension _$TeachingEvaluationSubmitAutoequal on TeachingEvaluationSubmit {
  List<Object?> get _$props => [
        stdSumTaskId,
        anonymous,
        evaluationQuestionnaireRes,
      ];
}

extension _$QuestionAnsSaveAutoequal on QuestionAnsSave {
  List<Object?> get _$props => [
        questionId,
        questionnaireId,
        type,
        score,
        answer,
        questionAnsExpSave,
      ];
}

extension _$QuestionAnsExpSaveAutoequal on QuestionAnsExpSave {
  List<Object?> get _$props => [
        optionId,
        questionnaireId,
      ];
}

extension _$EvaluationQuestionnaireResAutoequal on EvaluationQuestionnaireRes {
  List<Object?> get _$props => [
        questionnaireId,
        questionnaireName,
        enable,
        answer,
        score,
        questionAnsSaveList,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QuestionAndAnswerCWProxy {
  QuestionAndAnswer questionnaireId(String questionnaireId);

  QuestionAndAnswer question(TeachingEvaluationQuestion question);

  QuestionAndAnswer answer(QuestionAnsSave? answer);

  QuestionAndAnswer questionId(String? questionId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionAndAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionAndAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionAndAnswer call({
    String? questionnaireId,
    TeachingEvaluationQuestion? question,
    QuestionAnsSave? answer,
    String? questionId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuestionAndAnswer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQuestionAndAnswer.copyWith.fieldName(...)`
class _$QuestionAndAnswerCWProxyImpl implements _$QuestionAndAnswerCWProxy {
  const _$QuestionAndAnswerCWProxyImpl(this._value);

  final QuestionAndAnswer _value;

  @override
  QuestionAndAnswer questionnaireId(String questionnaireId) =>
      this(questionnaireId: questionnaireId);

  @override
  QuestionAndAnswer question(TeachingEvaluationQuestion question) =>
      this(question: question);

  @override
  QuestionAndAnswer answer(QuestionAnsSave? answer) => this(answer: answer);

  @override
  QuestionAndAnswer questionId(String? questionId) =>
      this(questionId: questionId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionAndAnswer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionAndAnswer(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionAndAnswer call({
    Object? questionnaireId = const $CopyWithPlaceholder(),
    Object? question = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? questionId = const $CopyWithPlaceholder(),
  }) {
    return QuestionAndAnswer(
      questionnaireId: questionnaireId == const $CopyWithPlaceholder() ||
              questionnaireId == null
          ? _value.questionnaireId
          // ignore: cast_nullable_to_non_nullable
          : questionnaireId as String,
      question: question == const $CopyWithPlaceholder() || question == null
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as TeachingEvaluationQuestion,
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as QuestionAnsSave?,
      questionId: questionId == const $CopyWithPlaceholder()
          ? _value.questionId
          // ignore: cast_nullable_to_non_nullable
          : questionId as String?,
    );
  }
}

extension $QuestionAndAnswerCopyWith on QuestionAndAnswer {
  /// Returns a callable class that can be used as follows: `instanceOfQuestionAndAnswer.copyWith(...)` or like so:`instanceOfQuestionAndAnswer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QuestionAndAnswerCWProxy get copyWith =>
      _$QuestionAndAnswerCWProxyImpl(this);
}

abstract class _$TeachingEvaluationSubmitCWProxy {
  TeachingEvaluationSubmit stdSumTaskId(String stdSumTaskId);

  TeachingEvaluationSubmit anonymous(bool anonymous);

  TeachingEvaluationSubmit evaluationQuestionnaireRes(
      EvaluationQuestionnaireRes evaluationQuestionnaireRes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeachingEvaluationSubmit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeachingEvaluationSubmit(...).copyWith(id: 12, name: "My name")
  /// ````
  TeachingEvaluationSubmit call({
    String? stdSumTaskId,
    bool? anonymous,
    EvaluationQuestionnaireRes? evaluationQuestionnaireRes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTeachingEvaluationSubmit.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTeachingEvaluationSubmit.copyWith.fieldName(...)`
class _$TeachingEvaluationSubmitCWProxyImpl
    implements _$TeachingEvaluationSubmitCWProxy {
  const _$TeachingEvaluationSubmitCWProxyImpl(this._value);

  final TeachingEvaluationSubmit _value;

  @override
  TeachingEvaluationSubmit stdSumTaskId(String stdSumTaskId) =>
      this(stdSumTaskId: stdSumTaskId);

  @override
  TeachingEvaluationSubmit anonymous(bool anonymous) =>
      this(anonymous: anonymous);

  @override
  TeachingEvaluationSubmit evaluationQuestionnaireRes(
          EvaluationQuestionnaireRes evaluationQuestionnaireRes) =>
      this(evaluationQuestionnaireRes: evaluationQuestionnaireRes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeachingEvaluationSubmit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeachingEvaluationSubmit(...).copyWith(id: 12, name: "My name")
  /// ````
  TeachingEvaluationSubmit call({
    Object? stdSumTaskId = const $CopyWithPlaceholder(),
    Object? anonymous = const $CopyWithPlaceholder(),
    Object? evaluationQuestionnaireRes = const $CopyWithPlaceholder(),
  }) {
    return TeachingEvaluationSubmit(
      stdSumTaskId:
          stdSumTaskId == const $CopyWithPlaceholder() || stdSumTaskId == null
              ? _value.stdSumTaskId
              // ignore: cast_nullable_to_non_nullable
              : stdSumTaskId as String,
      anonymous: anonymous == const $CopyWithPlaceholder() || anonymous == null
          ? _value.anonymous
          // ignore: cast_nullable_to_non_nullable
          : anonymous as bool,
      evaluationQuestionnaireRes:
          evaluationQuestionnaireRes == const $CopyWithPlaceholder() ||
                  evaluationQuestionnaireRes == null
              ? _value.evaluationQuestionnaireRes
              // ignore: cast_nullable_to_non_nullable
              : evaluationQuestionnaireRes as EvaluationQuestionnaireRes,
    );
  }
}

extension $TeachingEvaluationSubmitCopyWith on TeachingEvaluationSubmit {
  /// Returns a callable class that can be used as follows: `instanceOfTeachingEvaluationSubmit.copyWith(...)` or like so:`instanceOfTeachingEvaluationSubmit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TeachingEvaluationSubmitCWProxy get copyWith =>
      _$TeachingEvaluationSubmitCWProxyImpl(this);
}

abstract class _$QuestionAnsSaveCWProxy {
  QuestionAnsSave questionId(String questionId);

  QuestionAnsSave questionnaireId(String questionnaireId);

  QuestionAnsSave type(String type);

  QuestionAnsSave score(int score);

  QuestionAnsSave answer(String? answer);

  QuestionAnsSave questionAnsExpSave(
      List<QuestionAnsExpSave> questionAnsExpSave);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionAnsSave(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionAnsSave(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionAnsSave call({
    String? questionId,
    String? questionnaireId,
    String? type,
    int? score,
    String? answer,
    List<QuestionAnsExpSave>? questionAnsExpSave,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuestionAnsSave.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQuestionAnsSave.copyWith.fieldName(...)`
class _$QuestionAnsSaveCWProxyImpl implements _$QuestionAnsSaveCWProxy {
  const _$QuestionAnsSaveCWProxyImpl(this._value);

  final QuestionAnsSave _value;

  @override
  QuestionAnsSave questionId(String questionId) => this(questionId: questionId);

  @override
  QuestionAnsSave questionnaireId(String questionnaireId) =>
      this(questionnaireId: questionnaireId);

  @override
  QuestionAnsSave type(String type) => this(type: type);

  @override
  QuestionAnsSave score(int score) => this(score: score);

  @override
  QuestionAnsSave answer(String? answer) => this(answer: answer);

  @override
  QuestionAnsSave questionAnsExpSave(
          List<QuestionAnsExpSave> questionAnsExpSave) =>
      this(questionAnsExpSave: questionAnsExpSave);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionAnsSave(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionAnsSave(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionAnsSave call({
    Object? questionId = const $CopyWithPlaceholder(),
    Object? questionnaireId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? questionAnsExpSave = const $CopyWithPlaceholder(),
  }) {
    return QuestionAnsSave(
      questionId:
          questionId == const $CopyWithPlaceholder() || questionId == null
              ? _value.questionId
              // ignore: cast_nullable_to_non_nullable
              : questionId as String,
      questionnaireId: questionnaireId == const $CopyWithPlaceholder() ||
              questionnaireId == null
          ? _value.questionnaireId
          // ignore: cast_nullable_to_non_nullable
          : questionnaireId as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
      score: score == const $CopyWithPlaceholder() || score == null
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as int,
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as String?,
      questionAnsExpSave: questionAnsExpSave == const $CopyWithPlaceholder() ||
              questionAnsExpSave == null
          ? _value.questionAnsExpSave
          // ignore: cast_nullable_to_non_nullable
          : questionAnsExpSave as List<QuestionAnsExpSave>,
    );
  }
}

extension $QuestionAnsSaveCopyWith on QuestionAnsSave {
  /// Returns a callable class that can be used as follows: `instanceOfQuestionAnsSave.copyWith(...)` or like so:`instanceOfQuestionAnsSave.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QuestionAnsSaveCWProxy get copyWith => _$QuestionAnsSaveCWProxyImpl(this);
}

abstract class _$QuestionAnsExpSaveCWProxy {
  QuestionAnsExpSave optionId(String optionId);

  QuestionAnsExpSave questionnaireId(String questionnaireId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionAnsExpSave(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionAnsExpSave(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionAnsExpSave call({
    String? optionId,
    String? questionnaireId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuestionAnsExpSave.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQuestionAnsExpSave.copyWith.fieldName(...)`
class _$QuestionAnsExpSaveCWProxyImpl implements _$QuestionAnsExpSaveCWProxy {
  const _$QuestionAnsExpSaveCWProxyImpl(this._value);

  final QuestionAnsExpSave _value;

  @override
  QuestionAnsExpSave optionId(String optionId) => this(optionId: optionId);

  @override
  QuestionAnsExpSave questionnaireId(String questionnaireId) =>
      this(questionnaireId: questionnaireId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionAnsExpSave(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionAnsExpSave(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionAnsExpSave call({
    Object? optionId = const $CopyWithPlaceholder(),
    Object? questionnaireId = const $CopyWithPlaceholder(),
  }) {
    return QuestionAnsExpSave(
      optionId: optionId == const $CopyWithPlaceholder() || optionId == null
          ? _value.optionId
          // ignore: cast_nullable_to_non_nullable
          : optionId as String,
      questionnaireId: questionnaireId == const $CopyWithPlaceholder() ||
              questionnaireId == null
          ? _value.questionnaireId
          // ignore: cast_nullable_to_non_nullable
          : questionnaireId as String,
    );
  }
}

extension $QuestionAnsExpSaveCopyWith on QuestionAnsExpSave {
  /// Returns a callable class that can be used as follows: `instanceOfQuestionAnsExpSave.copyWith(...)` or like so:`instanceOfQuestionAnsExpSave.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QuestionAnsExpSaveCWProxy get copyWith =>
      _$QuestionAnsExpSaveCWProxyImpl(this);
}

abstract class _$EvaluationQuestionnaireResCWProxy {
  EvaluationQuestionnaireRes questionnaireId(String questionnaireId);

  EvaluationQuestionnaireRes questionnaireName(String questionnaireName);

  EvaluationQuestionnaireRes enable(bool enable);

  EvaluationQuestionnaireRes answer(String answer);

  EvaluationQuestionnaireRes score(int score);

  EvaluationQuestionnaireRes questionAnsSaveList(
      List<QuestionAnsSave> questionAnsSaveList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EvaluationQuestionnaireRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EvaluationQuestionnaireRes(...).copyWith(id: 12, name: "My name")
  /// ````
  EvaluationQuestionnaireRes call({
    String? questionnaireId,
    String? questionnaireName,
    bool? enable,
    String? answer,
    int? score,
    List<QuestionAnsSave>? questionAnsSaveList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEvaluationQuestionnaireRes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEvaluationQuestionnaireRes.copyWith.fieldName(...)`
class _$EvaluationQuestionnaireResCWProxyImpl
    implements _$EvaluationQuestionnaireResCWProxy {
  const _$EvaluationQuestionnaireResCWProxyImpl(this._value);

  final EvaluationQuestionnaireRes _value;

  @override
  EvaluationQuestionnaireRes questionnaireId(String questionnaireId) =>
      this(questionnaireId: questionnaireId);

  @override
  EvaluationQuestionnaireRes questionnaireName(String questionnaireName) =>
      this(questionnaireName: questionnaireName);

  @override
  EvaluationQuestionnaireRes enable(bool enable) => this(enable: enable);

  @override
  EvaluationQuestionnaireRes answer(String answer) => this(answer: answer);

  @override
  EvaluationQuestionnaireRes score(int score) => this(score: score);

  @override
  EvaluationQuestionnaireRes questionAnsSaveList(
          List<QuestionAnsSave> questionAnsSaveList) =>
      this(questionAnsSaveList: questionAnsSaveList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EvaluationQuestionnaireRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EvaluationQuestionnaireRes(...).copyWith(id: 12, name: "My name")
  /// ````
  EvaluationQuestionnaireRes call({
    Object? questionnaireId = const $CopyWithPlaceholder(),
    Object? questionnaireName = const $CopyWithPlaceholder(),
    Object? enable = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? score = const $CopyWithPlaceholder(),
    Object? questionAnsSaveList = const $CopyWithPlaceholder(),
  }) {
    return EvaluationQuestionnaireRes(
      questionnaireId: questionnaireId == const $CopyWithPlaceholder() ||
              questionnaireId == null
          ? _value.questionnaireId
          // ignore: cast_nullable_to_non_nullable
          : questionnaireId as String,
      questionnaireName: questionnaireName == const $CopyWithPlaceholder() ||
              questionnaireName == null
          ? _value.questionnaireName
          // ignore: cast_nullable_to_non_nullable
          : questionnaireName as String,
      enable: enable == const $CopyWithPlaceholder() || enable == null
          ? _value.enable
          // ignore: cast_nullable_to_non_nullable
          : enable as bool,
      answer: answer == const $CopyWithPlaceholder() || answer == null
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as String,
      score: score == const $CopyWithPlaceholder() || score == null
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as int,
      questionAnsSaveList:
          questionAnsSaveList == const $CopyWithPlaceholder() ||
                  questionAnsSaveList == null
              ? _value.questionAnsSaveList
              // ignore: cast_nullable_to_non_nullable
              : questionAnsSaveList as List<QuestionAnsSave>,
    );
  }
}

extension $EvaluationQuestionnaireResCopyWith on EvaluationQuestionnaireRes {
  /// Returns a callable class that can be used as follows: `instanceOfEvaluationQuestionnaireRes.copyWith(...)` or like so:`instanceOfEvaluationQuestionnaireRes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EvaluationQuestionnaireResCWProxy get copyWith =>
      _$EvaluationQuestionnaireResCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachingEvaluationSubmit _$TeachingEvaluationSubmitFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationSubmit(
      stdSumTaskId: json['stdSumTaskId'] as String? ?? '',
      anonymous: json['anonymous'] as bool? ?? false,
      evaluationQuestionnaireRes: json['evaluationQuestionnaireRes'] == null
          ? EvaluationQuestionnaireRes.emptyInstance()
          : EvaluationQuestionnaireRes.fromJson(
              json['evaluationQuestionnaireRes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeachingEvaluationSubmitToJson(
        TeachingEvaluationSubmit instance) =>
    <String, dynamic>{
      'stdSumTaskId': instance.stdSumTaskId,
      'anonymous': instance.anonymous,
      'evaluationQuestionnaireRes':
          instance.evaluationQuestionnaireRes.toJson(),
    };

QuestionAnsSave _$QuestionAnsSaveFromJson(Map<String, dynamic> json) =>
    QuestionAnsSave(
      questionId: json['questionId'] as String? ?? '',
      questionnaireId: json['questionnaireId'] as String? ?? '',
      type: json['type'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      answer: json['answer'] as String?,
      questionAnsExpSave: (json['questionAnsExpSaveList'] as List<dynamic>?)
              ?.map(
                  (e) => QuestionAnsExpSave.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$QuestionAnsSaveToJson(QuestionAnsSave instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'questionnaireId': instance.questionnaireId,
      'type': instance.type,
      'score': instance.score,
      'answer': instance.answer,
      'questionAnsExpSaveList':
          instance.questionAnsExpSave.map((e) => e.toJson()).toList(),
    };

QuestionAnsExpSave _$QuestionAnsExpSaveFromJson(Map<String, dynamic> json) =>
    QuestionAnsExpSave(
      optionId: json['optionId'] as String? ?? '',
      questionnaireId: json['questionnaireId'] as String? ?? '',
    );

Map<String, dynamic> _$QuestionAnsExpSaveToJson(QuestionAnsExpSave instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'questionnaireId': instance.questionnaireId,
    };

EvaluationQuestionnaireRes _$EvaluationQuestionnaireResFromJson(
        Map<String, dynamic> json) =>
    EvaluationQuestionnaireRes(
      questionnaireId: json['questionnaireId'] as String? ?? '',
      questionnaireName: json['questionnaireName'] as String? ?? '',
      enable: json['enable'] as bool? ?? false,
      answer: json['answer'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      questionAnsSaveList: (json['questionAnsSaveList'] as List<dynamic>?)
              ?.map((e) => QuestionAnsSave.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EvaluationQuestionnaireResToJson(
        EvaluationQuestionnaireRes instance) =>
    <String, dynamic>{
      'questionnaireId': instance.questionnaireId,
      'questionnaireName': instance.questionnaireName,
      'enable': instance.enable,
      'answer': instance.answer,
      'score': instance.score,
      'questionAnsSaveList':
          instance.questionAnsSaveList.map((e) => e.toJson()).toList(),
    };
