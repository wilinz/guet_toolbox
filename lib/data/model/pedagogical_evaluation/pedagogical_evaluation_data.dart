import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pedagogical_evaluation_data.g.dart';

@JsonSerializable(explicitToJson: true)
class PedagogicalEvaluationData {
  PedagogicalEvaluationData(
      {required this.term,
      required this.stid,
      required this.teacherno,
      required this.courseno,
      required this.courseid,
      required this.score,
      required this.chk,
      required this.lb,
      required this.bz,
      required this.cname,
      required this.name,
      required this.can,
      required this.userid});

  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "stid", defaultValue: "")
  String stid;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherno;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "score", defaultValue: 0)
  num score;
  @JsonKey(name: "chk", defaultValue: 0)
  int chk;
  @JsonKey(name: "lb", defaultValue: 0)
  int lb;
  @JsonKey(name: "bz", defaultValue: "")
  String bz;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "can", defaultValue: false)
  bool can;
  @JsonKey(name: "userid", defaultValue: "")
  String userid;

  factory PedagogicalEvaluationData.fromResponse(
      PedagogicalEvaluation pe, String comment, num score) {
    return PedagogicalEvaluationData(
        term: pe.term,
        stid: pe.stid,
        teacherno: pe.teacherno,
        courseno: pe.courseno,
        courseid: pe.courseid,
        score: score,
        chk: pe.chk,
        lb: pe.lb,
        bz: comment,
        cname: pe.cname,
        name: pe.name,
        can: pe.can,
        userid: "");
  }

  factory PedagogicalEvaluationData.fromJson(Map<String, dynamic> json) =>
      _$PedagogicalEvaluationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PedagogicalEvaluationDataToJson(this);
}
