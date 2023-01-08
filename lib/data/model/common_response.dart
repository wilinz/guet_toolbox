import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CommonResponse {
  CommonResponse(
      {required this.success,
      required this.msg,
      this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "msg", defaultValue: "")
  String msg;
  @JsonKey(name: "data")
  dynamic data;

  factory CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}


