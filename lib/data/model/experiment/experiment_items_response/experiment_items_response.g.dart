// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperimentItemsResponse _$ExperimentItemsResponseFromJson(
        Map<String, dynamic> json) =>
    ExperimentItemsResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExperimentItemsResponseToJson(
        ExperimentItemsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'timestamp': instance.timestamp,
    };

ExperimentItems _$ExperimentItemsFromJson(Map<String, dynamic> json) =>
    ExperimentItems(
      name: json['name'] as String? ?? '',
      selectItem: json['selectItem'] as String?,
      selectItemString: json['selectItemString'] as String?,
      id: json['id'] as String? ?? '',
      stuId: json['stuId'] as String? ?? '',
      relation: json['relation'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ExperimentItemsToJson(ExperimentItems instance) =>
    <String, dynamic>{
      'name': instance.name,
      'selectItem': instance.selectItem,
      'selectItemString': instance.selectItemString,
      'id': instance.id,
      'stuId': instance.stuId,
      'relation': instance.relation,
      'type': instance.type,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      selectCount: (json['selectCount'] as num?)?.toInt() ?? 0,
      needComplete: (json['needComplete'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => ExperimentItems.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'selectCount': instance.selectCount,
      'needComplete': instance.needComplete,
      'type': instance.type,
      'list': instance.list.map((e) => e.toJson()).toList(),
    };
