import 'package:json_annotation/json_annotation.dart';

part 'login_cas_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginCasResponse {
  LoginCasResponse(
      {required this.meta,
      required this.data});

  @JsonKey(name: "meta")
  Meta meta;
  @JsonKey(name: "data")
  Data data;

  factory LoginCasResponse.fromJson(Map<String, dynamic> json) => _$LoginCasResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCasResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Meta {
  Meta(
      {required this.success,
      required this.statusCode,
      required this.message});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "statusCode", defaultValue: 0)
  int statusCode;
  @JsonKey(name: "message", defaultValue: "")
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.code,
      required this.data});

  @JsonKey(name: "code", defaultValue: "")
  String code;
  @JsonKey(name: "data", defaultValue: "")
  String data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


