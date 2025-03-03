import 'package:json_annotation/json_annotation.dart';

part 'app_common_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AppCommonResponse {

  AppCommonResponse(
      {required this.code,
      required this.success,
      required this.msg,
      this.data});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data")
  dynamic data;


  factory AppCommonResponse.fromJson(Map<String, dynamic> json) => _$AppCommonResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$AppCommonResponseToJson(this);
  
  factory AppCommonResponse.emptyInstance() => AppCommonResponse(code: 0, success: false, msg: "");
}


