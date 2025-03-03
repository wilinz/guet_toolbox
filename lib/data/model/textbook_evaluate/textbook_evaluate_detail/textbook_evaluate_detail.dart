import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_detail.g.dart';

List<TextbookEvaluateDetail> textbookEvaluateDetailListFormJson(List json) =>
    json.map((e) => TextbookEvaluateDetail.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> textbookEvaluateDetailListToJson(List<TextbookEvaluateDetail> instance) =>
    instance.map((e) => e.toJson()).toList();

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateDetail {

  TextbookEvaluateDetail(
      {this.answer,
      this.finalScore,
      this.fontNum,
      this.maxSize,
      this.nameEn,
      required this.nameZh,
      this.options,
      required this.questionType,
      this.required,
      this.score,
      this.scoreFont,
      this.selectNum,
      required this.type});

  @JsonKey(name: "answer")
  dynamic answer;

  @JsonKey(name: "finalScore")
  dynamic finalScore;

  @JsonKey(name: "fontNum")
  dynamic fontNum;

  @JsonKey(name: "maxSize")
  int? maxSize;

  @JsonKey(name: "nameEn")
  String? nameEn;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "options", defaultValue: [])
  List<Options>? options;

  @JsonKey(name: "questionType", defaultValue: QuestionType.emptyInstance)
  QuestionType questionType;

  @JsonKey(name: "required")
  bool? required;

  @JsonKey(name: "score")
  int? score;

  @JsonKey(name: "scoreFont")
  dynamic scoreFont;

  @JsonKey(name: "selectNum")
  dynamic selectNum;

  @JsonKey(name: "type", defaultValue: "")
  String type;


  factory TextbookEvaluateDetail.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TextbookEvaluateDetailToJson(this);

  factory TextbookEvaluateDetail.emptyInstance() => TextbookEvaluateDetail(nameZh: "", questionType: QuestionType.emptyInstance(), type: "");
}

@JsonSerializable(explicitToJson: true)
class Options {

  Options(
      {this.checked,
      required this.contentEn,
      required this.contentZh,
      required this.score});

  @JsonKey(name: "checked")
  dynamic checked;

  @JsonKey(name: "contentEn", defaultValue: "")
  String contentEn;

  @JsonKey(name: "contentZh", defaultValue: "")
  String contentZh;

  @JsonKey(name: "score", defaultValue: 0)
  int score;


  factory Options.fromJson(Map<String, dynamic> json) => _$OptionsFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  factory Options.emptyInstance() => Options(contentEn: "", contentZh: "", score: 0);
}

@JsonSerializable(explicitToJson: true)
class QuestionType {

  QuestionType(
      {required this.$type,
      required this.$name});

  @JsonKey(name: r"$type", defaultValue: "")
  String $type;

  @JsonKey(name: r"$name", defaultValue: "")
  String $name;


  factory QuestionType.fromJson(Map<String, dynamic> json) => _$QuestionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTypeToJson(this);

  factory QuestionType.emptyInstance() => QuestionType($type: "", $name: "");
}


