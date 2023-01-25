import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guettoolbox/util/datetime.dart';

part 'term_response.g.dart';

part 'term_response.freezed.dart';

@freezed
class TermResponse with _$TermResponse {
  @JsonSerializable(explicitToJson: true)
  const factory TermResponse({
    @JsonKey(name: "success", defaultValue: false) @Default(false) bool success,
    @JsonKey(name: "total", defaultValue: 0) @Default(0) int total,
    @JsonKey(name: "data", defaultValue: []) @Default(<Term>[]) List<Term> data,
  }) = _TermResponse;

  factory TermResponse.fromJson(Map<String, dynamic> json) =>
      _$TermResponseFromJson(json);
}

_parseDateTime(v) => DateTimeUtil.parseDate(v);

_parseStringToInt(v) => int.parse(v);

@freezed
class Term with _$Term {
  @JsonSerializable(explicitToJson: true)
  const factory Term({
    @JsonKey(name: "term", defaultValue: "") @Default("") String term,
    @JsonKey(name: "startdate", fromJson: _parseDateTime)
        required DateTime startDate,
    @JsonKey(name: "enddate", fromJson: _parseDateTime)
        required DateTime endDate,
    @Default(0)
    @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
        int weekNum,
    @Default("") @JsonKey(name: "termname", defaultValue: "") String termName,
    @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
        required int schoolYear,
    @Default("") @JsonKey(name: "comm") String comment,
  }) = _Term;

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}
