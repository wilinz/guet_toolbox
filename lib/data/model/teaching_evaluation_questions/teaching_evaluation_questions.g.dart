// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_evaluation_questions.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$TeachingEvaluationQuestionChapterAutoequal
    on TeachingEvaluationQuestionChapter {
  List<Object?> get _$props => [
        chineseNum,
        questionInput,
        attribute,
        contents,
      ];
}

extension _$AttributeAutoequal on Attribute {
  List<Object?> get _$props => [
        enableDesc,
        typeName,
        name,
        typeId,
        id,
        desc,
      ];
}

extension _$TipsAutoequal on Tips {
  List<Object?> get _$props => [
        left,
        center,
        right,
      ];
}

extension _$OptionSettingAutoequal on OptionSetting {
  List<Object?> get _$props => [
        iconNum,
        minScore,
        valueType,
        icon,
        stepScore,
        maxScore,
        tips,
      ];
}

extension _$ScoreingAutoequal on Scoreing {
  List<Object?> get _$props => [
        labelId,
        optionSetting,
        index,
        questionInput,
        attribute,
      ];
}

extension _$TeachingEvaluationQuestionAutoequal on TeachingEvaluationQuestion {
  List<Object?> get _$props => [
        scoreing,
        fillBlank,
        radio,
        typeId,
        typeName,
        id,
      ];
}

extension _$FillBlankAutoequal on FillBlank {
  List<Object?> get _$props => [
        optionSetting,
        index,
        questionInput,
        attribute,
      ];
}

extension _$RulesAutoequal on Rules {
  List<Object?> get _$props => [
        otherSelectedOptionIds,
        otherQuestionId,
        currentSelectedOptionIds,
      ];
}

extension _$OptionsAutoequal on Options {
  List<Object?> get _$props => [
        ischapter,
        optionId,
        optionScore,
        value,
      ];
}

extension _$RadioAutoequal on Radio {
  List<Object?> get _$props => [
        optionSetting,
        options,
        index,
        questionInput,
        attribute,
      ];
}

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TeachingEvaluationQuestionChapterCWProxy {
  TeachingEvaluationQuestionChapter chineseNum(String chineseNum);

  TeachingEvaluationQuestionChapter questionInput(bool questionInput);

  TeachingEvaluationQuestionChapter attribute(Attribute attribute);

  TeachingEvaluationQuestionChapter contents(
      List<TeachingEvaluationQuestion> contents);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeachingEvaluationQuestionChapter(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeachingEvaluationQuestionChapter(...).copyWith(id: 12, name: "My name")
  /// ````
  TeachingEvaluationQuestionChapter call({
    String? chineseNum,
    bool? questionInput,
    Attribute? attribute,
    List<TeachingEvaluationQuestion>? contents,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTeachingEvaluationQuestionChapter.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTeachingEvaluationQuestionChapter.copyWith.fieldName(...)`
class _$TeachingEvaluationQuestionChapterCWProxyImpl
    implements _$TeachingEvaluationQuestionChapterCWProxy {
  const _$TeachingEvaluationQuestionChapterCWProxyImpl(this._value);

  final TeachingEvaluationQuestionChapter _value;

  @override
  TeachingEvaluationQuestionChapter chineseNum(String chineseNum) =>
      this(chineseNum: chineseNum);

  @override
  TeachingEvaluationQuestionChapter questionInput(bool questionInput) =>
      this(questionInput: questionInput);

  @override
  TeachingEvaluationQuestionChapter attribute(Attribute attribute) =>
      this(attribute: attribute);

  @override
  TeachingEvaluationQuestionChapter contents(
          List<TeachingEvaluationQuestion> contents) =>
      this(contents: contents);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeachingEvaluationQuestionChapter(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeachingEvaluationQuestionChapter(...).copyWith(id: 12, name: "My name")
  /// ````
  TeachingEvaluationQuestionChapter call({
    Object? chineseNum = const $CopyWithPlaceholder(),
    Object? questionInput = const $CopyWithPlaceholder(),
    Object? attribute = const $CopyWithPlaceholder(),
    Object? contents = const $CopyWithPlaceholder(),
  }) {
    return TeachingEvaluationQuestionChapter(
      chineseNum:
          chineseNum == const $CopyWithPlaceholder() || chineseNum == null
              ? _value.chineseNum
              // ignore: cast_nullable_to_non_nullable
              : chineseNum as String,
      questionInput:
          questionInput == const $CopyWithPlaceholder() || questionInput == null
              ? _value.questionInput
              // ignore: cast_nullable_to_non_nullable
              : questionInput as bool,
      attribute: attribute == const $CopyWithPlaceholder() || attribute == null
          ? _value.attribute
          // ignore: cast_nullable_to_non_nullable
          : attribute as Attribute,
      contents: contents == const $CopyWithPlaceholder() || contents == null
          ? _value.contents
          // ignore: cast_nullable_to_non_nullable
          : contents as List<TeachingEvaluationQuestion>,
    );
  }
}

extension $TeachingEvaluationQuestionChapterCopyWith
    on TeachingEvaluationQuestionChapter {
  /// Returns a callable class that can be used as follows: `instanceOfTeachingEvaluationQuestionChapter.copyWith(...)` or like so:`instanceOfTeachingEvaluationQuestionChapter.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TeachingEvaluationQuestionChapterCWProxy get copyWith =>
      _$TeachingEvaluationQuestionChapterCWProxyImpl(this);
}

abstract class _$AttributeCWProxy {
  Attribute enableDesc(bool enableDesc);

  Attribute typeName(String typeName);

  Attribute name(String name);

  Attribute typeId(int typeId);

  Attribute id(int id);

  Attribute desc(String desc);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Attribute(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Attribute(...).copyWith(id: 12, name: "My name")
  /// ````
  Attribute call({
    bool? enableDesc,
    String? typeName,
    String? name,
    int? typeId,
    int? id,
    String? desc,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAttribute.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAttribute.copyWith.fieldName(...)`
class _$AttributeCWProxyImpl implements _$AttributeCWProxy {
  const _$AttributeCWProxyImpl(this._value);

  final Attribute _value;

  @override
  Attribute enableDesc(bool enableDesc) => this(enableDesc: enableDesc);

  @override
  Attribute typeName(String typeName) => this(typeName: typeName);

  @override
  Attribute name(String name) => this(name: name);

  @override
  Attribute typeId(int typeId) => this(typeId: typeId);

  @override
  Attribute id(int id) => this(id: id);

  @override
  Attribute desc(String desc) => this(desc: desc);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Attribute(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Attribute(...).copyWith(id: 12, name: "My name")
  /// ````
  Attribute call({
    Object? enableDesc = const $CopyWithPlaceholder(),
    Object? typeName = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? typeId = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? desc = const $CopyWithPlaceholder(),
  }) {
    return Attribute(
      enableDesc:
          enableDesc == const $CopyWithPlaceholder() || enableDesc == null
              ? _value.enableDesc
              // ignore: cast_nullable_to_non_nullable
              : enableDesc as bool,
      typeName: typeName == const $CopyWithPlaceholder() || typeName == null
          ? _value.typeName
          // ignore: cast_nullable_to_non_nullable
          : typeName as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      typeId: typeId == const $CopyWithPlaceholder() || typeId == null
          ? _value.typeId
          // ignore: cast_nullable_to_non_nullable
          : typeId as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      desc: desc == const $CopyWithPlaceholder() || desc == null
          ? _value.desc
          // ignore: cast_nullable_to_non_nullable
          : desc as String,
    );
  }
}

extension $AttributeCopyWith on Attribute {
  /// Returns a callable class that can be used as follows: `instanceOfAttribute.copyWith(...)` or like so:`instanceOfAttribute.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AttributeCWProxy get copyWith => _$AttributeCWProxyImpl(this);
}

abstract class _$TipsCWProxy {
  Tips left(String left);

  Tips center(String center);

  Tips right(String right);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Tips(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Tips(...).copyWith(id: 12, name: "My name")
  /// ````
  Tips call({
    String? left,
    String? center,
    String? right,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTips.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTips.copyWith.fieldName(...)`
class _$TipsCWProxyImpl implements _$TipsCWProxy {
  const _$TipsCWProxyImpl(this._value);

  final Tips _value;

  @override
  Tips left(String left) => this(left: left);

  @override
  Tips center(String center) => this(center: center);

  @override
  Tips right(String right) => this(right: right);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Tips(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Tips(...).copyWith(id: 12, name: "My name")
  /// ````
  Tips call({
    Object? left = const $CopyWithPlaceholder(),
    Object? center = const $CopyWithPlaceholder(),
    Object? right = const $CopyWithPlaceholder(),
  }) {
    return Tips(
      left: left == const $CopyWithPlaceholder() || left == null
          ? _value.left
          // ignore: cast_nullable_to_non_nullable
          : left as String,
      center: center == const $CopyWithPlaceholder() || center == null
          ? _value.center
          // ignore: cast_nullable_to_non_nullable
          : center as String,
      right: right == const $CopyWithPlaceholder() || right == null
          ? _value.right
          // ignore: cast_nullable_to_non_nullable
          : right as String,
    );
  }
}

extension $TipsCopyWith on Tips {
  /// Returns a callable class that can be used as follows: `instanceOfTips.copyWith(...)` or like so:`instanceOfTips.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TipsCWProxy get copyWith => _$TipsCWProxyImpl(this);
}

abstract class _$OptionSettingCWProxy {
  OptionSetting iconNum(int iconNum);

  OptionSetting minScore(int minScore);

  OptionSetting valueType(String valueType);

  OptionSetting icon(String icon);

  OptionSetting stepScore(int stepScore);

  OptionSetting maxScore(int maxScore);

  OptionSetting tips(Tips tips);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OptionSetting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OptionSetting(...).copyWith(id: 12, name: "My name")
  /// ````
  OptionSetting call({
    int? iconNum,
    int? minScore,
    String? valueType,
    String? icon,
    int? stepScore,
    int? maxScore,
    Tips? tips,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOptionSetting.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOptionSetting.copyWith.fieldName(...)`
class _$OptionSettingCWProxyImpl implements _$OptionSettingCWProxy {
  const _$OptionSettingCWProxyImpl(this._value);

  final OptionSetting _value;

  @override
  OptionSetting iconNum(int iconNum) => this(iconNum: iconNum);

  @override
  OptionSetting minScore(int minScore) => this(minScore: minScore);

  @override
  OptionSetting valueType(String valueType) => this(valueType: valueType);

  @override
  OptionSetting icon(String icon) => this(icon: icon);

  @override
  OptionSetting stepScore(int stepScore) => this(stepScore: stepScore);

  @override
  OptionSetting maxScore(int maxScore) => this(maxScore: maxScore);

  @override
  OptionSetting tips(Tips tips) => this(tips: tips);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OptionSetting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OptionSetting(...).copyWith(id: 12, name: "My name")
  /// ````
  OptionSetting call({
    Object? iconNum = const $CopyWithPlaceholder(),
    Object? minScore = const $CopyWithPlaceholder(),
    Object? valueType = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? stepScore = const $CopyWithPlaceholder(),
    Object? maxScore = const $CopyWithPlaceholder(),
    Object? tips = const $CopyWithPlaceholder(),
  }) {
    return OptionSetting(
      iconNum: iconNum == const $CopyWithPlaceholder() || iconNum == null
          ? _value.iconNum
          // ignore: cast_nullable_to_non_nullable
          : iconNum as int,
      minScore: minScore == const $CopyWithPlaceholder() || minScore == null
          ? _value.minScore
          // ignore: cast_nullable_to_non_nullable
          : minScore as int,
      valueType: valueType == const $CopyWithPlaceholder() || valueType == null
          ? _value.valueType
          // ignore: cast_nullable_to_non_nullable
          : valueType as String,
      icon: icon == const $CopyWithPlaceholder() || icon == null
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String,
      stepScore: stepScore == const $CopyWithPlaceholder() || stepScore == null
          ? _value.stepScore
          // ignore: cast_nullable_to_non_nullable
          : stepScore as int,
      maxScore: maxScore == const $CopyWithPlaceholder() || maxScore == null
          ? _value.maxScore
          // ignore: cast_nullable_to_non_nullable
          : maxScore as int,
      tips: tips == const $CopyWithPlaceholder() || tips == null
          ? _value.tips
          // ignore: cast_nullable_to_non_nullable
          : tips as Tips,
    );
  }
}

extension $OptionSettingCopyWith on OptionSetting {
  /// Returns a callable class that can be used as follows: `instanceOfOptionSetting.copyWith(...)` or like so:`instanceOfOptionSetting.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OptionSettingCWProxy get copyWith => _$OptionSettingCWProxyImpl(this);
}

abstract class _$ScoreingCWProxy {
  Scoreing labelId(String labelId);

  Scoreing optionSetting(OptionSetting optionSetting);

  Scoreing index(int index);

  Scoreing questionInput(bool questionInput);

  Scoreing attribute(Attribute attribute);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Scoreing(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Scoreing(...).copyWith(id: 12, name: "My name")
  /// ````
  Scoreing call({
    String? labelId,
    OptionSetting? optionSetting,
    int? index,
    bool? questionInput,
    Attribute? attribute,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScoreing.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScoreing.copyWith.fieldName(...)`
class _$ScoreingCWProxyImpl implements _$ScoreingCWProxy {
  const _$ScoreingCWProxyImpl(this._value);

  final Scoreing _value;

  @override
  Scoreing labelId(String labelId) => this(labelId: labelId);

  @override
  Scoreing optionSetting(OptionSetting optionSetting) =>
      this(optionSetting: optionSetting);

  @override
  Scoreing index(int index) => this(index: index);

  @override
  Scoreing questionInput(bool questionInput) =>
      this(questionInput: questionInput);

  @override
  Scoreing attribute(Attribute attribute) => this(attribute: attribute);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Scoreing(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Scoreing(...).copyWith(id: 12, name: "My name")
  /// ````
  Scoreing call({
    Object? labelId = const $CopyWithPlaceholder(),
    Object? optionSetting = const $CopyWithPlaceholder(),
    Object? index = const $CopyWithPlaceholder(),
    Object? questionInput = const $CopyWithPlaceholder(),
    Object? attribute = const $CopyWithPlaceholder(),
  }) {
    return Scoreing(
      labelId: labelId == const $CopyWithPlaceholder() || labelId == null
          ? _value.labelId
          // ignore: cast_nullable_to_non_nullable
          : labelId as String,
      optionSetting:
          optionSetting == const $CopyWithPlaceholder() || optionSetting == null
              ? _value.optionSetting
              // ignore: cast_nullable_to_non_nullable
              : optionSetting as OptionSetting,
      index: index == const $CopyWithPlaceholder() || index == null
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
      questionInput:
          questionInput == const $CopyWithPlaceholder() || questionInput == null
              ? _value.questionInput
              // ignore: cast_nullable_to_non_nullable
              : questionInput as bool,
      attribute: attribute == const $CopyWithPlaceholder() || attribute == null
          ? _value.attribute
          // ignore: cast_nullable_to_non_nullable
          : attribute as Attribute,
    );
  }
}

extension $ScoreingCopyWith on Scoreing {
  /// Returns a callable class that can be used as follows: `instanceOfScoreing.copyWith(...)` or like so:`instanceOfScoreing.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScoreingCWProxy get copyWith => _$ScoreingCWProxyImpl(this);
}

abstract class _$TeachingEvaluationQuestionCWProxy {
  TeachingEvaluationQuestion scoreing(Scoreing? scoreing);

  TeachingEvaluationQuestion fillBlank(FillBlank? fillBlank);

  TeachingEvaluationQuestion radio(Radio? radio);

  TeachingEvaluationQuestion typeId(int typeId);

  TeachingEvaluationQuestion typeName(String typeName);

  TeachingEvaluationQuestion id(int id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeachingEvaluationQuestion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeachingEvaluationQuestion(...).copyWith(id: 12, name: "My name")
  /// ````
  TeachingEvaluationQuestion call({
    Scoreing? scoreing,
    FillBlank? fillBlank,
    Radio? radio,
    int? typeId,
    String? typeName,
    int? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTeachingEvaluationQuestion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTeachingEvaluationQuestion.copyWith.fieldName(...)`
class _$TeachingEvaluationQuestionCWProxyImpl
    implements _$TeachingEvaluationQuestionCWProxy {
  const _$TeachingEvaluationQuestionCWProxyImpl(this._value);

  final TeachingEvaluationQuestion _value;

  @override
  TeachingEvaluationQuestion scoreing(Scoreing? scoreing) =>
      this(scoreing: scoreing);

  @override
  TeachingEvaluationQuestion fillBlank(FillBlank? fillBlank) =>
      this(fillBlank: fillBlank);

  @override
  TeachingEvaluationQuestion radio(Radio? radio) => this(radio: radio);

  @override
  TeachingEvaluationQuestion typeId(int typeId) => this(typeId: typeId);

  @override
  TeachingEvaluationQuestion typeName(String typeName) =>
      this(typeName: typeName);

  @override
  TeachingEvaluationQuestion id(int id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TeachingEvaluationQuestion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TeachingEvaluationQuestion(...).copyWith(id: 12, name: "My name")
  /// ````
  TeachingEvaluationQuestion call({
    Object? scoreing = const $CopyWithPlaceholder(),
    Object? fillBlank = const $CopyWithPlaceholder(),
    Object? radio = const $CopyWithPlaceholder(),
    Object? typeId = const $CopyWithPlaceholder(),
    Object? typeName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return TeachingEvaluationQuestion(
      scoreing: scoreing == const $CopyWithPlaceholder()
          ? _value.scoreing
          // ignore: cast_nullable_to_non_nullable
          : scoreing as Scoreing?,
      fillBlank: fillBlank == const $CopyWithPlaceholder()
          ? _value.fillBlank
          // ignore: cast_nullable_to_non_nullable
          : fillBlank as FillBlank?,
      radio: radio == const $CopyWithPlaceholder()
          ? _value.radio
          // ignore: cast_nullable_to_non_nullable
          : radio as Radio?,
      typeId: typeId == const $CopyWithPlaceholder() || typeId == null
          ? _value.typeId
          // ignore: cast_nullable_to_non_nullable
          : typeId as int,
      typeName: typeName == const $CopyWithPlaceholder() || typeName == null
          ? _value.typeName
          // ignore: cast_nullable_to_non_nullable
          : typeName as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
    );
  }
}

extension $TeachingEvaluationQuestionCopyWith on TeachingEvaluationQuestion {
  /// Returns a callable class that can be used as follows: `instanceOfTeachingEvaluationQuestion.copyWith(...)` or like so:`instanceOfTeachingEvaluationQuestion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TeachingEvaluationQuestionCWProxy get copyWith =>
      _$TeachingEvaluationQuestionCWProxyImpl(this);
}

abstract class _$FillBlankCWProxy {
  FillBlank optionSetting(OptionSetting optionSetting);

  FillBlank index(int index);

  FillBlank questionInput(bool questionInput);

  FillBlank attribute(Attribute attribute);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FillBlank(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FillBlank(...).copyWith(id: 12, name: "My name")
  /// ````
  FillBlank call({
    OptionSetting? optionSetting,
    int? index,
    bool? questionInput,
    Attribute? attribute,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFillBlank.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFillBlank.copyWith.fieldName(...)`
class _$FillBlankCWProxyImpl implements _$FillBlankCWProxy {
  const _$FillBlankCWProxyImpl(this._value);

  final FillBlank _value;

  @override
  FillBlank optionSetting(OptionSetting optionSetting) =>
      this(optionSetting: optionSetting);

  @override
  FillBlank index(int index) => this(index: index);

  @override
  FillBlank questionInput(bool questionInput) =>
      this(questionInput: questionInput);

  @override
  FillBlank attribute(Attribute attribute) => this(attribute: attribute);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FillBlank(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FillBlank(...).copyWith(id: 12, name: "My name")
  /// ````
  FillBlank call({
    Object? optionSetting = const $CopyWithPlaceholder(),
    Object? index = const $CopyWithPlaceholder(),
    Object? questionInput = const $CopyWithPlaceholder(),
    Object? attribute = const $CopyWithPlaceholder(),
  }) {
    return FillBlank(
      optionSetting:
          optionSetting == const $CopyWithPlaceholder() || optionSetting == null
              ? _value.optionSetting
              // ignore: cast_nullable_to_non_nullable
              : optionSetting as OptionSetting,
      index: index == const $CopyWithPlaceholder() || index == null
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
      questionInput:
          questionInput == const $CopyWithPlaceholder() || questionInput == null
              ? _value.questionInput
              // ignore: cast_nullable_to_non_nullable
              : questionInput as bool,
      attribute: attribute == const $CopyWithPlaceholder() || attribute == null
          ? _value.attribute
          // ignore: cast_nullable_to_non_nullable
          : attribute as Attribute,
    );
  }
}

extension $FillBlankCopyWith on FillBlank {
  /// Returns a callable class that can be used as follows: `instanceOfFillBlank.copyWith(...)` or like so:`instanceOfFillBlank.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FillBlankCWProxy get copyWith => _$FillBlankCWProxyImpl(this);
}

abstract class _$RulesCWProxy {
  Rules otherSelectedOptionIds(List<dynamic> otherSelectedOptionIds);

  Rules otherQuestionId(String otherQuestionId);

  Rules currentSelectedOptionIds(List<dynamic> currentSelectedOptionIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Rules(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Rules(...).copyWith(id: 12, name: "My name")
  /// ````
  Rules call({
    List<dynamic>? otherSelectedOptionIds,
    String? otherQuestionId,
    List<dynamic>? currentSelectedOptionIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRules.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRules.copyWith.fieldName(...)`
class _$RulesCWProxyImpl implements _$RulesCWProxy {
  const _$RulesCWProxyImpl(this._value);

  final Rules _value;

  @override
  Rules otherSelectedOptionIds(List<dynamic> otherSelectedOptionIds) =>
      this(otherSelectedOptionIds: otherSelectedOptionIds);

  @override
  Rules otherQuestionId(String otherQuestionId) =>
      this(otherQuestionId: otherQuestionId);

  @override
  Rules currentSelectedOptionIds(List<dynamic> currentSelectedOptionIds) =>
      this(currentSelectedOptionIds: currentSelectedOptionIds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Rules(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Rules(...).copyWith(id: 12, name: "My name")
  /// ````
  Rules call({
    Object? otherSelectedOptionIds = const $CopyWithPlaceholder(),
    Object? otherQuestionId = const $CopyWithPlaceholder(),
    Object? currentSelectedOptionIds = const $CopyWithPlaceholder(),
  }) {
    return Rules(
      otherSelectedOptionIds:
          otherSelectedOptionIds == const $CopyWithPlaceholder() ||
                  otherSelectedOptionIds == null
              ? _value.otherSelectedOptionIds
              // ignore: cast_nullable_to_non_nullable
              : otherSelectedOptionIds as List<dynamic>,
      otherQuestionId: otherQuestionId == const $CopyWithPlaceholder() ||
              otherQuestionId == null
          ? _value.otherQuestionId
          // ignore: cast_nullable_to_non_nullable
          : otherQuestionId as String,
      currentSelectedOptionIds:
          currentSelectedOptionIds == const $CopyWithPlaceholder() ||
                  currentSelectedOptionIds == null
              ? _value.currentSelectedOptionIds
              // ignore: cast_nullable_to_non_nullable
              : currentSelectedOptionIds as List<dynamic>,
    );
  }
}

extension $RulesCopyWith on Rules {
  /// Returns a callable class that can be used as follows: `instanceOfRules.copyWith(...)` or like so:`instanceOfRules.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RulesCWProxy get copyWith => _$RulesCWProxyImpl(this);
}

abstract class _$OptionsCWProxy {
  Options ischapter(bool ischapter);

  Options optionId(int optionId);

  Options optionScore(int optionScore);

  Options value(String value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Options(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Options(...).copyWith(id: 12, name: "My name")
  /// ````
  Options call({
    bool? ischapter,
    int? optionId,
    int? optionScore,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOptions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOptions.copyWith.fieldName(...)`
class _$OptionsCWProxyImpl implements _$OptionsCWProxy {
  const _$OptionsCWProxyImpl(this._value);

  final Options _value;

  @override
  Options ischapter(bool ischapter) => this(ischapter: ischapter);

  @override
  Options optionId(int optionId) => this(optionId: optionId);

  @override
  Options optionScore(int optionScore) => this(optionScore: optionScore);

  @override
  Options value(String value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Options(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Options(...).copyWith(id: 12, name: "My name")
  /// ````
  Options call({
    Object? ischapter = const $CopyWithPlaceholder(),
    Object? optionId = const $CopyWithPlaceholder(),
    Object? optionScore = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return Options(
      ischapter: ischapter == const $CopyWithPlaceholder() || ischapter == null
          ? _value.ischapter
          // ignore: cast_nullable_to_non_nullable
          : ischapter as bool,
      optionId: optionId == const $CopyWithPlaceholder() || optionId == null
          ? _value.optionId
          // ignore: cast_nullable_to_non_nullable
          : optionId as int,
      optionScore:
          optionScore == const $CopyWithPlaceholder() || optionScore == null
              ? _value.optionScore
              // ignore: cast_nullable_to_non_nullable
              : optionScore as int,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
    );
  }
}

extension $OptionsCopyWith on Options {
  /// Returns a callable class that can be used as follows: `instanceOfOptions.copyWith(...)` or like so:`instanceOfOptions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OptionsCWProxy get copyWith => _$OptionsCWProxyImpl(this);
}

abstract class _$RadioCWProxy {
  Radio optionSetting(OptionSetting optionSetting);

  Radio options(List<Options> options);

  Radio index(int index);

  Radio questionInput(bool questionInput);

  Radio attribute(Attribute attribute);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Radio(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Radio(...).copyWith(id: 12, name: "My name")
  /// ````
  Radio call({
    OptionSetting? optionSetting,
    List<Options>? options,
    int? index,
    bool? questionInput,
    Attribute? attribute,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRadio.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRadio.copyWith.fieldName(...)`
class _$RadioCWProxyImpl implements _$RadioCWProxy {
  const _$RadioCWProxyImpl(this._value);

  final Radio _value;

  @override
  Radio optionSetting(OptionSetting optionSetting) =>
      this(optionSetting: optionSetting);

  @override
  Radio options(List<Options> options) => this(options: options);

  @override
  Radio index(int index) => this(index: index);

  @override
  Radio questionInput(bool questionInput) => this(questionInput: questionInput);

  @override
  Radio attribute(Attribute attribute) => this(attribute: attribute);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Radio(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Radio(...).copyWith(id: 12, name: "My name")
  /// ````
  Radio call({
    Object? optionSetting = const $CopyWithPlaceholder(),
    Object? options = const $CopyWithPlaceholder(),
    Object? index = const $CopyWithPlaceholder(),
    Object? questionInput = const $CopyWithPlaceholder(),
    Object? attribute = const $CopyWithPlaceholder(),
  }) {
    return Radio(
      optionSetting:
          optionSetting == const $CopyWithPlaceholder() || optionSetting == null
              ? _value.optionSetting
              // ignore: cast_nullable_to_non_nullable
              : optionSetting as OptionSetting,
      options: options == const $CopyWithPlaceholder() || options == null
          ? _value.options
          // ignore: cast_nullable_to_non_nullable
          : options as List<Options>,
      index: index == const $CopyWithPlaceholder() || index == null
          ? _value.index
          // ignore: cast_nullable_to_non_nullable
          : index as int,
      questionInput:
          questionInput == const $CopyWithPlaceholder() || questionInput == null
              ? _value.questionInput
              // ignore: cast_nullable_to_non_nullable
              : questionInput as bool,
      attribute: attribute == const $CopyWithPlaceholder() || attribute == null
          ? _value.attribute
          // ignore: cast_nullable_to_non_nullable
          : attribute as Attribute,
    );
  }
}

extension $RadioCopyWith on Radio {
  /// Returns a callable class that can be used as follows: `instanceOfRadio.copyWith(...)` or like so:`instanceOfRadio.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RadioCWProxy get copyWith => _$RadioCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachingEvaluationQuestionChapter _$TeachingEvaluationQuestionChapterFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationQuestionChapter(
      chineseNum: json['chineseNum'] as String? ?? '',
      questionInput: json['questionInput'] as bool? ?? false,
      attribute: json['attribute'] == null
          ? Attribute.emptyInstance()
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
      contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => TeachingEvaluationQuestion.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TeachingEvaluationQuestionChapterToJson(
        TeachingEvaluationQuestionChapter instance) =>
    <String, dynamic>{
      'chineseNum': instance.chineseNum,
      'questionInput': instance.questionInput,
      'attribute': instance.attribute.toJson(),
      'contents': instance.contents.map((e) => e.toJson()).toList(),
    };

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
      enableDesc: json['enableDesc'] as bool? ?? false,
      typeName: json['typeName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      typeId: (json['typeId'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      desc: json['desc'] as String? ?? '',
    );

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'enableDesc': instance.enableDesc,
      'typeName': instance.typeName,
      'name': instance.name,
      'typeId': instance.typeId,
      'id': instance.id,
      'desc': instance.desc,
    };

Tips _$TipsFromJson(Map<String, dynamic> json) => Tips(
      left: json['left'] as String? ?? '',
      center: json['center'] as String? ?? '',
      right: json['right'] as String? ?? '',
    );

Map<String, dynamic> _$TipsToJson(Tips instance) => <String, dynamic>{
      'left': instance.left,
      'center': instance.center,
      'right': instance.right,
    };

OptionSetting _$OptionSettingFromJson(Map<String, dynamic> json) =>
    OptionSetting(
      iconNum: (json['iconNum'] as num?)?.toInt() ?? 0,
      minScore: (json['minScore'] as num?)?.toInt() ?? 0,
      valueType: json['valueType'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      stepScore: (json['stepScore'] as num?)?.toInt() ?? 0,
      maxScore: (json['maxScore'] as num?)?.toInt() ?? 0,
      tips: json['tips'] == null
          ? Tips.emptyInstance()
          : Tips.fromJson(json['tips'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OptionSettingToJson(OptionSetting instance) =>
    <String, dynamic>{
      'iconNum': instance.iconNum,
      'minScore': instance.minScore,
      'valueType': instance.valueType,
      'icon': instance.icon,
      'stepScore': instance.stepScore,
      'maxScore': instance.maxScore,
      'tips': instance.tips.toJson(),
    };

Scoreing _$ScoreingFromJson(Map<String, dynamic> json) => Scoreing(
      labelId: json['labelId'] as String? ?? '',
      optionSetting: json['optionSetting'] == null
          ? OptionSetting.emptyInstance()
          : OptionSetting.fromJson(
              json['optionSetting'] as Map<String, dynamic>),
      index: (json['index'] as num?)?.toInt() ?? 0,
      questionInput: json['questionInput'] as bool? ?? false,
      attribute: json['attribute'] == null
          ? Attribute.emptyInstance()
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreingToJson(Scoreing instance) => <String, dynamic>{
      'labelId': instance.labelId,
      'optionSetting': instance.optionSetting.toJson(),
      'index': instance.index,
      'questionInput': instance.questionInput,
      'attribute': instance.attribute.toJson(),
    };

TeachingEvaluationQuestion _$TeachingEvaluationQuestionFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationQuestion(
      scoreing: json['scoreing'] == null
          ? null
          : Scoreing.fromJson(json['scoreing'] as Map<String, dynamic>),
      fillBlank: json['fillBlank'] == null
          ? null
          : FillBlank.fromJson(json['fillBlank'] as Map<String, dynamic>),
      radio: json['radio'] == null
          ? null
          : Radio.fromJson(json['radio'] as Map<String, dynamic>),
      typeId: (json['typeId'] as num?)?.toInt() ?? 0,
      typeName: json['typeName'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TeachingEvaluationQuestionToJson(
        TeachingEvaluationQuestion instance) =>
    <String, dynamic>{
      'scoreing': instance.scoreing?.toJson(),
      'fillBlank': instance.fillBlank?.toJson(),
      'radio': instance.radio?.toJson(),
      'typeId': instance.typeId,
      'typeName': instance.typeName,
      'id': instance.id,
    };

FillBlank _$FillBlankFromJson(Map<String, dynamic> json) => FillBlank(
      optionSetting: json['optionSetting'] == null
          ? OptionSetting.emptyInstance()
          : OptionSetting.fromJson(
              json['optionSetting'] as Map<String, dynamic>),
      index: (json['index'] as num?)?.toInt() ?? 0,
      questionInput: json['questionInput'] as bool? ?? false,
      attribute: json['attribute'] == null
          ? Attribute.emptyInstance()
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FillBlankToJson(FillBlank instance) => <String, dynamic>{
      'optionSetting': instance.optionSetting.toJson(),
      'index': instance.index,
      'questionInput': instance.questionInput,
      'attribute': instance.attribute.toJson(),
    };

Rules _$RulesFromJson(Map<String, dynamic> json) => Rules(
      otherSelectedOptionIds:
          json['otherSelectedOptionIds'] as List<dynamic>? ?? [],
      otherQuestionId: json['otherQuestionId'] as String? ?? '',
      currentSelectedOptionIds:
          json['currentSelectedOptionIds'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$RulesToJson(Rules instance) => <String, dynamic>{
      'otherSelectedOptionIds': instance.otherSelectedOptionIds,
      'otherQuestionId': instance.otherQuestionId,
      'currentSelectedOptionIds': instance.currentSelectedOptionIds,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      ischapter: json['ischapter'] as bool? ?? false,
      optionId: (json['optionId'] as num?)?.toInt() ?? 0,
      optionScore: (json['optionScore'] as num?)?.toInt() ?? 0,
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'ischapter': instance.ischapter,
      'optionId': instance.optionId,
      'optionScore': instance.optionScore,
      'value': instance.value,
    };

Radio _$RadioFromJson(Map<String, dynamic> json) => Radio(
      optionSetting: json['optionSetting'] == null
          ? OptionSetting.emptyInstance()
          : OptionSetting.fromJson(
              json['optionSetting'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      index: (json['index'] as num?)?.toInt() ?? 0,
      questionInput: json['questionInput'] as bool? ?? false,
      attribute: json['attribute'] == null
          ? Attribute.emptyInstance()
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RadioToJson(Radio instance) => <String, dynamic>{
      'optionSetting': instance.optionSetting.toJson(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'index': instance.index,
      'questionInput': instance.questionInput,
      'attribute': instance.attribute.toJson(),
    };
