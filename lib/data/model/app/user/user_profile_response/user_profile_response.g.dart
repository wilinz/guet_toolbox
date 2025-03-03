// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileCWProxy {
  UserProfile avatar(String avatar);

  UserProfile createdAt(String createdAt);

  UserProfile id(String id);

  UserProfile nickname(String nickname);

  UserProfile updatedAt(String updatedAt);

  UserProfile userId(String userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    String? avatar,
    String? createdAt,
    String? id,
    String? nickname,
    String? updatedAt,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserProfile.copyWith.fieldName(...)`
class _$UserProfileCWProxyImpl implements _$UserProfileCWProxy {
  const _$UserProfileCWProxyImpl(this._value);

  final UserProfile _value;

  @override
  UserProfile avatar(String avatar) => this(avatar: avatar);

  @override
  UserProfile createdAt(String createdAt) => this(createdAt: createdAt);

  @override
  UserProfile id(String id) => this(id: id);

  @override
  UserProfile nickname(String nickname) => this(nickname: nickname);

  @override
  UserProfile updatedAt(String updatedAt) => this(updatedAt: updatedAt);

  @override
  UserProfile userId(String userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    Object? avatar = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? nickname = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return UserProfile(
      avatar: avatar == const $CopyWithPlaceholder() || avatar == null
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      nickname: nickname == const $CopyWithPlaceholder() || nickname == null
          ? _value.nickname
          // ignore: cast_nullable_to_non_nullable
          : nickname as String,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as String,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
    );
  }
}

extension $UserProfileCopyWith on UserProfile {
  /// Returns a callable class that can be used as follows: `instanceOfUserProfile.copyWith(...)` or like so:`instanceOfUserProfile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserProfileCWProxy get copyWith => _$UserProfileCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] == null
          ? UserProfile.emptyInstance()
          : UserProfile.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data.toJson(),
      'msg': instance.msg,
      'success': instance.success,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      avatar: json['avatar'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      id: json['id'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
      'id': instance.id,
      'nickname': instance.nickname,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
    };
