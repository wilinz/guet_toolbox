// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicCode _$DynamicCodeFromJson(Map<String, dynamic> json) => DynamicCode(
      result: json['res'] as String? ?? '',
      returnMessage: json['returnMessage'] as String? ?? '',
      codeTime: json['codeTime'] as int? ?? 0,
    );

Map<String, dynamic> _$DynamicCodeToJson(DynamicCode instance) =>
    <String, dynamic>{
      'res': instance.result,
      'returnMessage': instance.returnMessage,
      'codeTime': instance.codeTime,
    };
