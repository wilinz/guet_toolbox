import 'dart:convert';

import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:guethub/data/model/teaching_evaluation_submit/teaching_evaluation_submit.dart';
import 'package:guethub/logger.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teaching_evaluation_questions.g.dart';

List<Map<String, dynamic>> handleTeachingEvaluationQuestionsJson(
    List<dynamic> json) {
  final jsonData = json.map((e) => e as Map<String, dynamic>).toList();

  final chapters = <Map<String, dynamic>>[];
  final contents = <Map<String, dynamic>>[];
  Map<String, dynamic>? currentChapter;

  final typeNames = jsonData
      .map((e) => e['attribute']['typeName'])
      .where((e) => e != 'chapter')
      .distinctBy((e) => e);

  void saveChapter() {
    if (currentChapter != null) {
      currentChapter['contents'] = List.of(contents);
      contents.clear();
      chapters.add(currentChapter);
    }
  }

  for (final item in jsonData) {
    final typeId = item['attribute']['typeId'];
    final typeName = item['attribute']['typeName'];
    final id = item['attribute']['id'];

    if (typeId == 8) {
      saveChapter();
      currentChapter = item;
    } else {
      final content = <String, dynamic>{};
      for (final field in typeNames) {
        content[field] = null;
      }
      content['typeId'] = typeId;
      content['typeName'] = typeName;
      content['id'] = id;
      content[typeName] = item;
      contents.add(content);
    }
    logger.d(typeName);
  }
  saveChapter();
  return chapters;
}

List<TeachingEvaluationQuestionChapter>
    teachingEvaluationQuestionsListFormJsonWithHandle(List json) =>
        teachingEvaluationQuestionsListFormJson(
            handleTeachingEvaluationQuestionsJson(json));

List<TeachingEvaluationQuestionChapter> teachingEvaluationQuestionsListFormJson(
        List json) =>
    json
        .map((e) => TeachingEvaluationQuestionChapter.fromJson(
            e as Map<String, dynamic>))
        .toList();

List<Map<String, dynamic>> teachingEvaluationQuestionsListToJson(
        List<TeachingEvaluationQuestionChapter> instance) =>
    instance.map((e) => e.toJson()).toList();

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class TeachingEvaluationQuestionChapter with EquatableMixin {
  TeachingEvaluationQuestionChapter(
      {required this.chineseNum,
      required this.questionInput,
      required this.attribute,
      required this.contents});

  @JsonKey(name: "chineseNum", defaultValue: "")
  String chineseNum;

  @JsonKey(name: "questionInput", defaultValue: false)
  bool questionInput;

  @JsonKey(name: "attribute", defaultValue: Attribute.emptyInstance)
  Attribute attribute;

  @JsonKey(name: "contents", defaultValue: [])
  List<TeachingEvaluationQuestion> contents;

  factory TeachingEvaluationQuestionChapter.fromJson(
          Map<String, dynamic> json) =>
      _$TeachingEvaluationQuestionChapterFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TeachingEvaluationQuestionChapterToJson(this);

  factory TeachingEvaluationQuestionChapter.emptyInstance() =>
      TeachingEvaluationQuestionChapter(
          chineseNum: "",
          questionInput: false,
          attribute: Attribute.emptyInstance(),
          contents: []);

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class Attribute with EquatableMixin {
  Attribute(
      {required this.enableDesc,
      required this.typeName,
      required this.name,
      required this.typeId,
      required this.id,
      required this.desc});

  @JsonKey(name: "enableDesc", defaultValue: false)
  bool enableDesc;

  @JsonKey(name: "typeName", defaultValue: "")
  String typeName;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "typeId", defaultValue: 0)
  int typeId;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "desc", defaultValue: "")
  String desc;

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);

  factory Attribute.emptyInstance() => Attribute(
      enableDesc: false, typeName: "", name: "", typeId: 0, id: 0, desc: "");

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class Tips with EquatableMixin {
  Tips({required this.left, required this.center, required this.right});

  @JsonKey(name: "left", defaultValue: "")
  String left;

  @JsonKey(name: "center", defaultValue: "")
  String center;

  @JsonKey(name: "right", defaultValue: "")
  String right;

  factory Tips.fromJson(Map<String, dynamic> json) => _$TipsFromJson(json);

  Map<String, dynamic> toJson() => _$TipsToJson(this);

  factory Tips.emptyInstance() => Tips(left: "", center: "", right: "");

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class OptionSetting with EquatableMixin {
  OptionSetting(
      {required this.iconNum,
      required this.minScore,
      required this.valueType,
      required this.icon,
      required this.stepScore,
      required this.maxScore,
      required this.tips});

  @JsonKey(name: "iconNum", defaultValue: 0)
  int iconNum;

  @JsonKey(name: "minScore", defaultValue: 0)
  int minScore;

  @JsonKey(name: "valueType", defaultValue: "")
  String valueType;

  @JsonKey(name: "icon", defaultValue: "")
  String icon;

  @JsonKey(name: "stepScore", defaultValue: 0)
  int stepScore;

  @JsonKey(name: "maxScore", defaultValue: 0)
  int maxScore;

  @JsonKey(name: "tips", defaultValue: Tips.emptyInstance)
  Tips tips;

  factory OptionSetting.fromJson(Map<String, dynamic> json) =>
      _$OptionSettingFromJson(json);

  Map<String, dynamic> toJson() => _$OptionSettingToJson(this);

  factory OptionSetting.emptyInstance() => OptionSetting(
      iconNum: 0,
      minScore: 0,
      valueType: "",
      icon: "",
      stepScore: 0,
      maxScore: 0,
      tips: Tips.emptyInstance());

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class Scoreing with EquatableMixin {
  Scoreing(
      {required this.labelId,
      required this.optionSetting,
      required this.index,
      required this.questionInput,
      required this.attribute});

  @JsonKey(name: "labelId", defaultValue: "")
  String labelId;

  @JsonKey(name: "optionSetting", defaultValue: OptionSetting.emptyInstance)
  OptionSetting optionSetting;

  @JsonKey(name: "index", defaultValue: 0)
  int index;

  @JsonKey(name: "questionInput", defaultValue: false)
  bool questionInput;

  @JsonKey(name: "attribute", defaultValue: Attribute.emptyInstance)
  Attribute attribute;

  factory Scoreing.fromJson(Map<String, dynamic> json) =>
      _$ScoreingFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreingToJson(this);

  factory Scoreing.emptyInstance() => Scoreing(
      labelId: "",
      optionSetting: OptionSetting.emptyInstance(),
      index: 0,
      questionInput: false,
      attribute: Attribute.emptyInstance());

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class TeachingEvaluationQuestion with EquatableMixin {
  TeachingEvaluationQuestion(
      {this.scoreing,
      this.fillBlank,
      this.radio,
      required this.typeId,
      required this.typeName,
      required this.id});

  @JsonKey(name: "scoreing")
  Scoreing? scoreing;

  @JsonKey(name: "fillBlank")
  FillBlank? fillBlank;

  @JsonKey(name: "radio")
  Radio? radio;

  @JsonKey(name: "typeId", defaultValue: 0)
  int typeId;

  @JsonKey(name: "typeName", defaultValue: "")
  String typeName;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  factory TeachingEvaluationQuestion.fromJson(Map<String, dynamic> json) =>
      _$TeachingEvaluationQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$TeachingEvaluationQuestionToJson(this);

  factory TeachingEvaluationQuestion.emptyInstance() =>
      TeachingEvaluationQuestion(
          scoreing: Scoreing.emptyInstance(), typeId: 0, typeName: "", id: 0);

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class FillBlank with EquatableMixin {
  FillBlank(
      {required this.optionSetting,
      required this.index,
      required this.questionInput,
      required this.attribute});

  @JsonKey(name: "optionSetting", defaultValue: OptionSetting.emptyInstance)
  OptionSetting optionSetting;

  @JsonKey(name: "index", defaultValue: 0)
  int index;

  @JsonKey(name: "questionInput", defaultValue: false)
  bool questionInput;

  @JsonKey(name: "attribute", defaultValue: Attribute.emptyInstance)
  Attribute attribute;

  factory FillBlank.fromJson(Map<String, dynamic> json) =>
      _$FillBlankFromJson(json);

  Map<String, dynamic> toJson() => _$FillBlankToJson(this);

  factory FillBlank.emptyInstance() => FillBlank(
      optionSetting: OptionSetting.emptyInstance(),
      index: 0,
      questionInput: false,
      attribute: Attribute.emptyInstance());

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class Rules with EquatableMixin {
  Rules(
      {required this.otherSelectedOptionIds,
      required this.otherQuestionId,
      required this.currentSelectedOptionIds});

  @JsonKey(name: "otherSelectedOptionIds", defaultValue: [])
  List otherSelectedOptionIds;

  @JsonKey(name: "otherQuestionId", defaultValue: "")
  String otherQuestionId;

  @JsonKey(name: "currentSelectedOptionIds", defaultValue: [])
  List currentSelectedOptionIds;

  factory Rules.fromJson(Map<String, dynamic> json) => _$RulesFromJson(json);

  Map<String, dynamic> toJson() => _$RulesToJson(this);

  factory Rules.emptyInstance() => Rules(
      otherSelectedOptionIds: [],
      otherQuestionId: "",
      currentSelectedOptionIds: []);

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class Options with EquatableMixin {
  Options(
      {required this.ischapter,
      required this.optionId,
      required this.optionScore,
      required this.value});

  @JsonKey(name: "ischapter", defaultValue: false)
  bool ischapter;

  @JsonKey(name: "optionId", defaultValue: 0)
  int optionId;

  @JsonKey(name: "optionScore", defaultValue: 0)
  int optionScore;

  @JsonKey(name: "value", defaultValue: "")
  String value;

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  factory Options.emptyInstance() =>
      Options(ischapter: false, optionId: 0, optionScore: 0, value: "");

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class Radio with EquatableMixin {
  Radio(
      {required this.optionSetting,
      required this.options,
      required this.index,
      required this.questionInput,
      required this.attribute});

  @JsonKey(name: "optionSetting", defaultValue: OptionSetting.emptyInstance)
  OptionSetting optionSetting;

  @JsonKey(name: "options", defaultValue: [])
  List<Options> options;

  @JsonKey(name: "index", defaultValue: 0)
  int index;

  @JsonKey(name: "questionInput", defaultValue: false)
  bool questionInput;

  @JsonKey(name: "attribute", defaultValue: Attribute.emptyInstance)
  Attribute attribute;

  factory Radio.fromJson(Map<String, dynamic> json) => _$RadioFromJson(json);

  Map<String, dynamic> toJson() => _$RadioToJson(this);

  factory Radio.emptyInstance() => Radio(
      optionSetting: OptionSetting.emptyInstance(),
      options: [],
      index: 0,
      questionInput: false,
      attribute: Attribute.emptyInstance());

  @override
  List<Object?> get props => _$props;
}
