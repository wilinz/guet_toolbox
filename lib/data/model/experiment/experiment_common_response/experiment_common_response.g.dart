// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperimentCommonResponse _$ExperimentCommonResponseFromJson(
        Map<String, dynamic> json) =>
    ExperimentCommonResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: json['result'],
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExperimentCommonResponseToJson(
        ExperimentCommonResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'result': instance.result,
      'timestamp': instance.timestamp,
    };
