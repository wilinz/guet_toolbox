// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] == null
          ? LoginResult.emptyInstance()
          : LoginResult.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data.toJson(),
      'msg': instance.msg,
      'success': instance.success,
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      avatar: json['avatar'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      id: json['id'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
      'id': instance.id,
      'nickname': instance.nickname,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
    };
