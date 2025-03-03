import 'package:json_annotation/json_annotation.dart';

part 'teaching_evaluation_questions_lab.g.dart';

List<TeachingEvaluationQuestionsLab> teachingEvaluationQuestionsLabListFormJson(List json) =>
    json.map((e) => TeachingEvaluationQuestionsLab.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> teachingEvaluationQuestionsLabListToJson(List<TeachingEvaluationQuestionsLab> instance) =>
    instance.map((e) => e.toJson()).toList();

@JsonSerializable(explicitToJson: true)
class TeachingEvaluationQuestionsLab {

  TeachingEvaluationQuestionsLab(
      {required this.chineseNum,
      required this.questionInput,
      required this.attribute});

  @JsonKey(name: "chineseNum", defaultValue: "")
  String chineseNum;

  @JsonKey(name: "questionInput", defaultValue: false)
  bool questionInput;

  @JsonKey(name: "attribute", defaultValue: Attribute.emptyInstance)
  Attribute attribute;


  factory TeachingEvaluationQuestionsLab.fromJson(Map<String, dynamic> json) => _$TeachingEvaluationQuestionsLabFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeachingEvaluationQuestionsLabToJson(this);
  
  factory TeachingEvaluationQuestionsLab.emptyInstance() => TeachingEvaluationQuestionsLab(chineseNum: "", questionInput: false, attribute: Attribute.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Attribute {

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


  factory Attribute.fromJson(Map<String, dynamic> json) => _$AttributeFromJson(json);
  
  Map<String, dynamic> toJson() => _$AttributeToJson(this);
  
  factory Attribute.emptyInstance() => Attribute(enableDesc: false, typeName: "", name: "", typeId: 0, id: 0, desc: "");
}

@JsonSerializable(explicitToJson: true)
class Tips {

  Tips(
      {required this.left,
      required this.center,
      required this.right});

  @JsonKey(name: "left", defaultValue: "")
  String left;

  @JsonKey(name: "center", defaultValue: "")
  String center;

  @JsonKey(name: "right", defaultValue: "")
  String right;


  factory Tips.fromJson(Map<String, dynamic> json) => _$TipsFromJson(json);
  
  Map<String, dynamic> toJson() => _$TipsToJson(this);
  
  factory Tips.emptyInstance() => Tips(left: "", center: "", right: "");
}

@JsonSerializable(explicitToJson: true)
class OptionSetting {

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


  factory OptionSetting.fromJson(Map<String, dynamic> json) => _$OptionSettingFromJson(json);
  
  Map<String, dynamic> toJson() => _$OptionSettingToJson(this);
  
  factory OptionSetting.emptyInstance() => OptionSetting(iconNum: 0, minScore: 0, valueType: "", icon: "", stepScore: 0, maxScore: 0, tips: Tips.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class Rules {

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
  
  factory Rules.emptyInstance() => Rules(otherSelectedOptionIds: [], otherQuestionId: "", currentSelectedOptionIds: []);
}

@JsonSerializable(explicitToJson: true)
class Options {

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


  factory Options.fromJson(Map<String, dynamic> json) => _$OptionsFromJson(json);
  
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
  
  factory Options.emptyInstance() => Options(ischapter: false, optionId: 0, optionScore: 0, value: "");
}


