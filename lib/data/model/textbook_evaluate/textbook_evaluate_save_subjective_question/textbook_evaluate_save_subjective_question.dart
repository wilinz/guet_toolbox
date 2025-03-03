import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_save_subjective_question.g.dart';

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateSaveSubjectiveQuestion {

  TextbookEvaluateSaveSubjectiveQuestion(
      {required this.questionType,
      required this.type,
      required this.nameZh,
      required this.nameEn,
      required this.required,
      required this.maxSize,
      required this.answer});

  @JsonKey(name: "questionType", defaultValue: "")
  String questionType;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "required", defaultValue: false)
  bool required;

  @JsonKey(name: "maxSize", defaultValue: "")
  String maxSize;

  @JsonKey(name: "answer", defaultValue: "")
  String answer;


  factory TextbookEvaluateSaveSubjectiveQuestion.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateSaveSubjectiveQuestionFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateSaveSubjectiveQuestionToJson(this);
  
  factory TextbookEvaluateSaveSubjectiveQuestion.emptyInstance() => TextbookEvaluateSaveSubjectiveQuestion(questionType: "", type: "", nameZh: "", nameEn: "", required: false, maxSize: "", answer: "");
}


