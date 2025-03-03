// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_evaluation_questions_lab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachingEvaluationQuestionsLab _$TeachingEvaluationQuestionsLabFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationQuestionsLab(
      chineseNum: json['chineseNum'] as String? ?? '',
      questionInput: json['questionInput'] as bool? ?? false,
      attribute: json['attribute'] == null
          ? Attribute.emptyInstance()
          : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeachingEvaluationQuestionsLabToJson(
        TeachingEvaluationQuestionsLab instance) =>
    <String, dynamic>{
      'chineseNum': instance.chineseNum,
      'questionInput': instance.questionInput,
      'attribute': instance.attribute.toJson(),
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
