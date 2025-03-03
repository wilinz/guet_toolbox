import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfileResponse {

  UserProfileResponse(
      {required this.code,
      required this.data,
      required this.msg,
      required this.success});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "data", defaultValue: UserProfile.emptyInstance)
  UserProfile data;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "success", defaultValue: false)
  bool success;


  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
  
  factory UserProfileResponse.emptyInstance() => UserProfileResponse(code: 0, data: UserProfile.emptyInstance(), msg: "", success: false);
}

@CopyWith()
@JsonSerializable(explicitToJson: true)
class UserProfile {

  UserProfile(
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


  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  
  factory UserProfile.emptyInstance() => UserProfile(avatar: "", createdAt: "", id: "", nickname: "", updatedAt: "", userId: "");
}


