// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TermResponse _$$_TermResponseFromJson(Map<String, dynamic> json) =>
    _$_TermResponse(
      success: json['success'] as bool? ?? false,
      total: json['total'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TermResponseToJson(_$_TermResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'total': instance.total,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$_Term _$$_TermFromJson(Map<String, dynamic> json) => _$_Term(
      term: json['term'] as String? ?? '',
      startDate: _parseDateTime(json['startdate']),
      endDate: _parseDateTime(json['enddate']),
      weekNum: json['weeknum'] == null ? 0 : _parseStringToInt(json['weeknum']),
      termName: json['termname'] as String? ?? '',
      schoolYear: _parseStringToInt(json['schoolyear']),
      comment: json['comm'] as String? ?? "",
    );

Map<String, dynamic> _$$_TermToJson(_$_Term instance) => <String, dynamic>{
      'term': instance.term,
      'startdate': instance.startDate.toIso8601String(),
      'enddate': instance.endDate.toIso8601String(),
      'weeknum': instance.weekNum,
      'termname': instance.termName,
      'schoolyear': instance.schoolYear,
      'comm': instance.comment,
    };
