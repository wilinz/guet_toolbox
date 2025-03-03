import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {

  LoginResponse(
      {required this.code,
      required this.data,
      required this.msg,
      required this.success});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "data", defaultValue: LoginResult.emptyInstance)
  LoginResult data;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "success", defaultValue: false)
  bool success;


  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
  
  factory LoginResponse.emptyInstance() => LoginResponse(code: 0, data: LoginResult.emptyInstance(), msg: "", success: false);
}

@JsonSerializable(explicitToJson: true)
class LoginResult {

  LoginResult(
      {required this.avatar,
      required this.createdAt,
      required this.id,
      required this.nickname,
      required this.updatedAt,
      required this.userId});

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "created_at", defaultValue: "")
  String createdAt;

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "nickname", defaultValue: "")
  String nickname;

  @JsonKey(name: "updated_at", defaultValue: "")
  String updatedAt;

  @JsonKey(name: "user_id", defaultValue: "")
  String userId;


  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
  
  factory LoginResult.emptyInstance() => LoginResult(avatar: "", createdAt: "", id: "", nickname: "", updatedAt: "", userId: "");
}


