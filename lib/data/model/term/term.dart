import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guettoolbox/util/datetime.dart';

part 'term.g.dart';

@JsonSerializable(explicitToJson: true)
class TermResponse {
  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Term> data;

  TermResponse({required this.success, required this.total, required this.data});

  factory TermResponse.fromJson(Map<String, dynamic> json) =>
      _$TermResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TermResponseToJson(this);
}

_parseDateTime(v) => DateTimeUtil.parseDate(v);

_parseStringToInt(v) => int.parse(v);

@Entity(tableName: 'terms')
@JsonSerializable(explicitToJson: true)
class Term {
  @PrimaryKey(autoGenerate: true)
  int id = 0;

  @ColumnInfo(name: "term")
  @JsonKey(name: "term", defaultValue: "")
  String term;

  @ColumnInfo(name: "start_date")
  @JsonKey(name: "startdate", fromJson: _parseDateTime)
  DateTime startDate;

  @ColumnInfo(name: "end_date")
  @JsonKey(name: "enddate", fromJson: _parseDateTime)
  DateTime endDate;

  @ColumnInfo(name: "week_num")
  @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
  int weekNum;

  @ColumnInfo(name: "term_name")
  @JsonKey(name: "termname", defaultValue: "")
  String termName;

  @ColumnInfo(name: "school_year")
  @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
  int schoolYear;

  @ColumnInfo(name: "comment")
  @JsonKey(name: "comm")
  String comment;

  Term(
      {required this.term,
      required this.startDate,
      required this.endDate,
      required this.weekNum,
      required this.termName,
      required this.schoolYear,
      required this.comment});

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

  Map<String, dynamic> toJson() => _$TermToJson(this);
}
