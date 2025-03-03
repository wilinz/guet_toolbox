import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_questions_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pedagogical_evaluation_questions_save_request.g.dart';

List<PedagogicalEvaluationQuestionsSaveRequest>
    pedagogicalEvaluationSaveRequestListFormJson(
            List<Map<String, dynamic>> json) =>
        json.map((e) => PedagogicalEvaluationQuestionsSaveRequest.fromJson(e)).toList();

List<Map<String, dynamic>> pedagogicalEvaluationSaveRequestListToJson(
        List<PedagogicalEvaluationQuestionsSaveRequest> instance) =>
    instance.map((e) => e.toJson()).toList();

@JsonSerializable(explicitToJson: true)
class PedagogicalEvaluationQuestionsSaveRequest {
  PedagogicalEvaluationQuestionsSaveRequest(
      {required this.term,
      required this.lsh,
      required this.courseid,
      required this.lb,
      required this.score,
      required this.teacherno,
      required this.courseno,
      required this.dja,
      required this.afz,
      required this.djb,
      required this.bfz,
      required this.djc,
      required this.cfz,
      required this.djd,
      required this.dfz,
      required this.dje,
      required this.efz,
      required this.nr,
      required this.zbnh,
      required this.qz,
      required this.zp});

  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "lsh", defaultValue: 0)
  int lsh;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "lb", defaultValue: 0)
  int lb;
  @JsonKey(name: "score", defaultValue: 0)
  int score;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherno;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "dja", defaultValue: "")
  String dja;
  @JsonKey(name: "afz", defaultValue: 0)
  int afz;
  @JsonKey(name: "djb", defaultValue: "")
  String djb;
  @JsonKey(name: "bfz", defaultValue: 0)
  int bfz;
  @JsonKey(name: "djc", defaultValue: "")
  String djc;
  @JsonKey(name: "cfz", defaultValue: 0)
  int cfz;
  @JsonKey(name: "djd", defaultValue: "")
  String djd;
  @JsonKey(name: "dfz", defaultValue: 0)
  int dfz;
  @JsonKey(name: "dje", defaultValue: "")
  String dje;
  @JsonKey(name: "efz", defaultValue: 0)
  int efz;
  @JsonKey(name: "nr", defaultValue: "")
  String nr;
  @JsonKey(name: "zbnh", defaultValue: "")
  String zbnh;
  @JsonKey(name: "qz", defaultValue: 0.0)
  double qz;
  @JsonKey(name: "zp", defaultValue: 0)
  int zp;

  factory PedagogicalEvaluationQuestionsSaveRequest.fromJson(
          Map<String, dynamic> json) =>
      _$PedagogicalEvaluationQuestionsSaveRequestFromJson(json);

  static PedagogicalEvaluationQuestionsSaveRequest? fromResponse(
      PedagogicalEvaluationQuestion resp,
      String term,
      String courseid,
      String teacherno,
      String courseno,
      int lb) {
    if (resp.score == null) return null;
    return PedagogicalEvaluationQuestionsSaveRequest(
        term: term,
        lsh: resp.lsh,
        courseid: courseid,
        lb: lb,
        score: resp.score!,
        teacherno: teacherno,
        courseno: courseno,
        dja: resp.dja,
        afz: resp.afz,
        djb: resp.djb,
        bfz: resp.bfz,
        djc: resp.djc,
        cfz: resp.cfz,
        djd: resp.djd,
        dfz: resp.dfz,
        dje: resp.dje,
        efz: resp.efz,
        nr: resp.nr,
        zbnh: resp.zbnh,
        qz: resp.qz,
        zp: 0);
  }

  Map<String, dynamic> toJson() =>
      _$PedagogicalEvaluationQuestionsSaveRequestToJson(this);
}
