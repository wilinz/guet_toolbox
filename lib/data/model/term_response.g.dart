// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermResponse _$TermResponseFromJson(Map<String, dynamic> json) => TermResponse(
      success: json['success'] as bool? ?? false,
      total: json['total'] as int? ?? 0,
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
      startdate: json['startdate'] as String? ?? '',
      enddate: json['enddate'] as String? ?? '',
      weeknum: json['weeknum'] as String? ?? '',
      termname: json['termname'] as String? ?? '',
      schoolyear: json['schoolyear'] as String? ?? '',
      comm: json['comm'],
    );

Map<String, dynamic> _$TermToJson(Term instance) => <String, dynamic>{
      'term': instance.term,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'weeknum': instance.weeknum,
      'termname': instance.termname,
      'schoolyear': instance.schoolyear,
      'comm': instance.comm,
    };
