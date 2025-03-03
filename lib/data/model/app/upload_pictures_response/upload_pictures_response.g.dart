// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_pictures_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPicturesResponse _$UploadPicturesResponseFromJson(
        Map<String, dynamic> json) =>
    UploadPicturesResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      success: json['success'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data:
          (json['data'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$UploadPicturesResponseToJson(
        UploadPicturesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };
