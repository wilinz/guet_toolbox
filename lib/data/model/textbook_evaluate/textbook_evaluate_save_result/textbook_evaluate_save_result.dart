import 'package:json_annotation/json_annotation.dart';

part 'textbook_evaluate_save_result.g.dart';

@JsonSerializable(explicitToJson: true)
class TextbookEvaluateSaveResult {

  TextbookEvaluateSaveResult(
      {required this.success,
      required this.type,
      required this.content});

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "content", defaultValue: "")
  String content;


  factory TextbookEvaluateSaveResult.fromJson(Map<String, dynamic> json) => _$TextbookEvaluateSaveResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$TextbookEvaluateSaveResultToJson(this);
  
  factory TextbookEvaluateSaveResult.emptyInstance() => TextbookEvaluateSaveResult(success: false, type: "", content: "");
}


