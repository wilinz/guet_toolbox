// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_image.dart';

// **************************************************************************
// AutoequalGenerator
// **************************************************************************

extension _$BackgroundImageInfoAutoequal on BackgroundImageInfo {
  List<Object?> get _$props => [path];
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackgroundImageInfo _$BackgroundImageInfoFromJson(Map<String, dynamic> json) =>
    BackgroundImageInfo(
      path: json['path'] as String? ?? '',
      enable: json['enable'] as bool? ?? false,
    );

Map<String, dynamic> _$BackgroundImageInfoToJson(
        BackgroundImageInfo instance) =>
    <String, dynamic>{
      'path': instance.path,
      'enable': instance.enable,
    };
