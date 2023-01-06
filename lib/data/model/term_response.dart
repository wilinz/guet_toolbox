import 'package:json_annotation/json_annotation.dart';

part 'term_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TermResponse {
  TermResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Term> data;

  factory TermResponse.fromJson(Map<String, dynamic> json) => _$TermResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TermResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Term {
  Term(
      {required this.term,
      required this.startdate,
      required this.enddate,
      required this.weeknum,
      required this.termname,
      required this.schoolyear,
      this.comm});

  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "startdate", defaultValue: "")
  String startdate;
  @JsonKey(name: "enddate", defaultValue: "")
  String enddate;
  @JsonKey(name: "weeknum", defaultValue: "")
  String weeknum;
  @JsonKey(name: "termname", defaultValue: "")
  String termname;
  @JsonKey(name: "schoolyear", defaultValue: "")
  String schoolyear;
  @JsonKey(name: "comm")
  dynamic comm;

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

  Map<String, dynamic> toJson() => _$TermToJson(this);
}


