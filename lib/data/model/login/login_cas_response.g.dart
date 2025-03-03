// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_cas_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCasResponse _$LoginCasResponseFromJson(Map<String, dynamic> json) =>
    LoginCasResponse(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginCasResponseToJson(LoginCasResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      success: json['success'] as bool? ?? false,
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      code: json['code'] as String? ?? '',
      data: json['data'] as String? ?? '',
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
