// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermResponse _$TermResponseFromJson(Map<String, dynamic> json) => TermResponse(
      success: json['success'] as bool? ?? false,
      total: (json['total'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TermResponseToJson(TermResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Term _$TermFromJson(Map<String, dynamic> json) => Term(
      term: json['term'] as String? ?? '',
      startDate: _parseDateTime(json['startdate'] as String),
      endDate: _parseDateTime(json['enddate'] as String),
      weekNum: json['weeknum'] == null ? 0 : _parseStringToInt(json['weeknum']),
      termName: json['termname'] as String? ?? '',
      schoolYear: _parseStringToInt(json['schoolyear']),
      comment: json['comm'] as String? ?? '',
      systemId: (json['system_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TermToJson(Term instance) => <String, dynamic>{
      'term': instance.term,
      'startdate': instance.startDate.toIso8601String(),
      'enddate': instance.endDate.toIso8601String(),
      'weeknum': instance.weekNum,
      'termname': instance.termName,
      'schoolyear': instance.schoolYear,
      'comm': instance.comment,
      'system_id': instance.systemId,
    };
