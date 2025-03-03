import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';
import 'package:guethub/data/model/teaching_evaluation_questions/teaching_evaluation_questions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'teaching_evaluation_submit.g.dart';

@CopyWith()
@autoequal
class QuestionAndAnswer with EquatableMixin {
  String questionId;
  String questionnaireId;
  TeachingEvaluationQuestion question;
  QuestionAnsSave answer;

  QuestionAndAnswer(
      {required this.questionnaireId,
      required this.question,
      QuestionAnsSave? answer,
      String? questionId})
      : this.answer = answer ??
            QuestionAnsSave(
                questionId: question.id.toString(),
                questionnaireId: questionnaireId,
                type: question.typeId.toString(),
                score: (question.scoreing?.optionSetting.iconNum ?? 1) - 1,
                questionAnsExpSave: question.radio != null
                    ? [
                        QuestionAnsExpSave(
                            optionId: "1", questionnaireId: questionnaireId)
                      ]
                    : []),
        questionId = questionId ?? question.id.toString();

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class TeachingEvaluationSubmit with EquatableMixin {
  TeachingEvaluationSubmit(
      {required this.stdSumTaskId,
      required this.anonymous,
      required this.evaluationQuestionnaireRes});

  @JsonKey(name: "stdSumTaskId", defaultValue: "")
  String stdSumTaskId;

  @JsonKey(name: "anonymous", defaultValue: false)
  bool anonymous;

  @JsonKey(
      name: "evaluationQuestionnaireRes",
      defaultValue: EvaluationQuestionnaireRes.emptyInstance)
  EvaluationQuestionnaireRes evaluationQuestionnaireRes;

  factory TeachingEvaluationSubmit.fromJson(Map<String, dynamic> json) =>
      _$TeachingEvaluationSubmitFromJson(json);

  Map<String, dynamic> toJson() => _$TeachingEvaluationSubmitToJson(this);

  factory TeachingEvaluationSubmit.emptyInstance() => TeachingEvaluationSubmit(
      stdSumTaskId: "",
      anonymous: false,
      evaluationQuestionnaireRes: EvaluationQuestionnaireRes.emptyInstance());

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class QuestionAnsSave with EquatableMixin {
  QuestionAnsSave(
      {required this.questionId,
      required this.questionnaireId,
      required this.type,
      required this.score,
      this.answer,
      required this.questionAnsExpSave});

  @JsonKey(name: "questionId", defaultValue: "")
  String questionId;

  @JsonKey(name: "questionnaireId", defaultValue: "")
  String questionnaireId;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "score", defaultValue: 0)
  int score;

  @JsonKey(name: "answer")
  String? answer;

  @JsonKey(name: "questionAnsExpSaveList", defaultValue: [])
  List<QuestionAnsExpSave> questionAnsExpSave;

  factory QuestionAnsSave.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnsSaveFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAnsSaveToJson(this);

  factory QuestionAnsSave.emptyInstance() => QuestionAnsSave(
      questionId: "",
      questionnaireId: "",
      type: "",
      score: 0,
      questionAnsExpSave: []);

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class QuestionAnsExpSave with EquatableMixin {
  QuestionAnsExpSave({required this.optionId, required this.questionnaireId});

  @JsonKey(name: "optionId", defaultValue: "")
  String optionId;

  @JsonKey(name: "questionnaireId", defaultValue: "")
  String questionnaireId;

  factory QuestionAnsExpSave.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnsExpSaveFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAnsExpSaveToJson(this);

  factory QuestionAnsExpSave.emptyInstance() =>
      QuestionAnsExpSave(optionId: "", questionnaireId: "");

  @override
  List<Object?> get props => _$props;
}

@CopyWith()
@autoequal
@JsonSerializable(explicitToJson: true)
class EvaluationQuestionnaireRes with EquatableMixin {
  EvaluationQuestionnaireRes(
      {required this.questionnaireId,
      required this.questionnaireName,
      required this.enable,
      required this.answer,
      required this.score,
      required this.questionAnsSaveList});

  @JsonKey(name: "questionnaireId", defaultValue: "")
  String questionnaireId;

  @JsonKey(name: "questionnaireName", defaultValue: "")
  String questionnaireName;

  @JsonKey(name: "enable", defaultValue: false)
  bool enable;

  @JsonKey(name: "answer", defaultValue: "")
  String answer;

  @JsonKey(name: "score", defaultValue: 0)
  int score;

  @JsonKey(name: "questionAnsSaveList", defaultValue: [])
  List<QuestionAnsSave> questionAnsSaveList;

  factory EvaluationQuestionnaireRes.fromJson(Map<String, dynamic> json) =>
      _$EvaluationQuestionnaireResFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationQuestionnaireResToJson(this);

  factory EvaluationQuestionnaireRes.emptyInstance() =>
      EvaluationQuestionnaireRes(
          questionnaireId: "",
          questionnaireName: "",
          enable: false,
          answer: "",
          score: 0,
          questionAnsSaveList: []);

  @override
  List<Object?> get props => _$props;
}
