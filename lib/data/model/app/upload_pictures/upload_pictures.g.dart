// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_pictures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPictures _$UploadPicturesFromJson(Map<String, dynamic> json) =>
    UploadPictures(
      code: (json['code'] as num?)?.toInt() ?? 0,
      success: json['success'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data:
          (json['data'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$UploadPicturesToJson(UploadPictures instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };
