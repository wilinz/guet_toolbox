// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersionResponse _$AppVersionResponseFromJson(Map<String, dynamic> json) =>
    AppVersionResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: AppVersion.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String? ?? '',
    );

Map<String, dynamic> _$AppVersionResponseToJson(AppVersionResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data.toJson(),
      'msg': instance.msg,
    };

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) => AppVersion(
      id: json['id'] as String? ?? '',
      appName: json['app_name'] as String? ?? '',
      appid: json['appid'] as String? ?? '',
      canHide: json['can_hide'] as bool? ?? false,
      changelog: json['changelog'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      downloadUrl: json['download_url'] as String? ?? '',
      isForce: json['is_force'] as bool? ?? false,
      updatedAt: json['updated_at'] as String? ?? '',
      versionCode: (json['version_code'] as num?)?.toInt() ?? 0,
      versionName: json['version_name'] as String? ?? '',
      enabledSystem: (json['enabled_system'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$AppVersionToJson(AppVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_name': instance.appName,
      'appid': instance.appid,
      'can_hide': instance.canHide,
      'changelog': instance.changelog,
      'created_at': instance.createdAt,
      'download_url': instance.downloadUrl,
      'is_force': instance.isForce,
      'enabled_system': instance.enabledSystem,
      'updated_at': instance.updatedAt,
      'version_code': instance.versionCode,
      'version_name': instance.versionName,
    };
