import 'package:json_annotation/json_annotation.dart';

part 'dynamic_code.g.dart';

@JsonSerializable(explicitToJson: true)
class DynamicCode {
  DynamicCode(
      {required this.result,
      required this.returnMessage,
      required this.codeTime,
      required this.mobile});

  @JsonKey(name: "res", defaultValue: "")
  String result;
  @JsonKey(name: "returnMessage", defaultValue: "")
  String returnMessage;
  @JsonKey(name: "codeTime", defaultValue: 0)
  int codeTime;
  @JsonKey(name: "mobile", defaultValue: "")
  String mobile;

  factory DynamicCode.fromJson(Map<String, dynamic> json) =>
      _$DynamicCodeFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicCodeToJson(this);
}
