import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_save.g.dart';

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateSave {

  TextbookEvaluateSave(
      {required this.semesterAssoc,
      required this.courseAssoc,
      required this.textbookEvaluateBatchAssoc,
      required this.textbookAssoc,
      required this.studentAssoc,
      required this.evaluateDetail,
      required this.finalScore});

  @JsonKey(name: "semesterAssoc", defaultValue: 0)
  int semesterAssoc;

  @JsonKey(name: "courseAssoc", defaultValue: 0)
  int courseAssoc;

  @JsonKey(name: "textbookEvaluateBatchAssoc", defaultValue: 0)
  int textbookEvaluateBatchAssoc;

  @JsonKey(name: "textbookAssoc", defaultValue: 0)
  int textbookAssoc;

  @JsonKey(name: "studentAssoc", defaultValue: 0)
  int studentAssoc;

  @JsonKey(name: "evaluateDetail", defaultValue: [])
  List<Map<String, dynamic>> evaluateDetail;

  @JsonKey(name: "finalScore", defaultValue: 0)
  double finalScore;


  factory TextbookEvaluateSave.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateSaveFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateSaveToJson(this);
  
  factory TextbookEvaluateSave.emptyInstance() => TextbookEvaluateSave(semesterAssoc: 0, courseAssoc: 0, textbookEvaluateBatchAssoc: 0, textbookAssoc: 0, studentAssoc: 0, evaluateDetail: [], finalScore: 0);
}

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateSaveOptions {

  TextbookEvaluateSaveOptions(
      {required this.contentZh,
      required this.contentEn,
      required this.score,
      required this.checked});

  @JsonKey(name: "contentZh", defaultValue: "")
  String contentZh;

  @JsonKey(name: "contentEn", defaultValue: "")
  String contentEn;

  @JsonKey(name: "score", defaultValue: 0)
  int score;

  @JsonKey(name: "checked", defaultValue: 0)
  int checked;


  factory TextbookEvaluateSaveOptions.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateSaveOptionsFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateSaveOptionsToJson(this);
  
  factory TextbookEvaluateSaveOptions.emptyInstance() => TextbookEvaluateSaveOptions(contentZh: "", contentEn: "", score: 0, checked: 0);
}

@JsonSerializable(explicitToJson: true)
class EvaluateDetail {

  EvaluateDetail(
      {required this.questionType,
      required this.type,
      required this.nameZh,
      required this.nameEn,
      required this.score,
      required this.options,
      required this.finalScore});

  @JsonKey(name: "questionType", defaultValue: "")
  String questionType;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "score", defaultValue: 0)
  int score;

  @JsonKey(name: "options", defaultValue: [])
  List<TextbookEvaluateSaveOptions> options;

  @JsonKey(name: "finalScore", defaultValue: 0)
  int finalScore;


  factory EvaluateDetail.fromJson(Map<String, dynamic> json) => _$EvaluateDetailFromJson(json);
  
  Map<String, dynamic> toJson() => _$EvaluateDetailToJson(this);
  
  factory EvaluateDetail.emptyInstance() => EvaluateDetail(questionType: "", type: "", nameZh: "", nameEn: "", score: 0, options: [], finalScore: 0);
}


