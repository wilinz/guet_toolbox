import 'package:json_annotation/json_annotation.dart';

part 'pedagogical_evaluation_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PedagogicalEvaluationResponse {
  PedagogicalEvaluationResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<PedagogicalEvaluation> data;

  factory PedagogicalEvaluationResponse.fromJson(Map<String, dynamic> json) => _$PedagogicalEvaluationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PedagogicalEvaluationResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PedagogicalEvaluation {
  PedagogicalEvaluation(
      {required this.term,
      required this.stid,
      required this.courseid,
      required this.teacherno,
      required this.courseno,
      required this.cname,
      required this.name,
      required this.lb,
      required this.chk,
      required this.can});

  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "stid", defaultValue: "")
  String stid;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherno;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "lb", defaultValue: 0)
  int lb;
  @JsonKey(name: "chk", defaultValue: 0)
  int chk;
  @JsonKey(name: "can", defaultValue: false)
  bool can;

  factory PedagogicalEvaluation.fromJson(Map<String, dynamic> json) => _$PedagogicalEvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$PedagogicalEvaluationToJson(this);
}


