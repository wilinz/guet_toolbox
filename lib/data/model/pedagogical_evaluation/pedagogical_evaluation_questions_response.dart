import 'package:guethub/data/model/pedagogical_evaluation/pedagogical_evaluation_options.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pedagogical_evaluation_questions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PedagogicalEvaluationQuestionsResponse {
  PedagogicalEvaluationQuestionsResponse(
      {required this.success, required this.total, required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<PedagogicalEvaluationQuestion> data;

  factory PedagogicalEvaluationQuestionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PedagogicalEvaluationQuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PedagogicalEvaluationQuestionsResponseToJson(this);
}

int? _parseScore(dynamic v) {
  if (v is int) return v;
  if (v is String) return int.parse(v);
  return null;
}

@JsonSerializable(explicitToJson: true)
class PedagogicalEvaluationQuestion {
  PedagogicalEvaluationQuestion(
      {required this.lsh,
      required this.term,
      required this.mc,
      required this.nr,
      required this.xh,
      this.lb,
      required this.qz,
      required this.zbnh,
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
      required this.zt,
      this.score}) {
    options = _generateOptions(this);
  }


  @override
  String toString() {
    return 'PedagogicalEvaluationQuestion{lsh: $lsh, term: $term, mc: $mc, nr: $nr, xh: $xh, lb: $lb, qz: $qz, zbnh: $zbnh, dja: $dja, afz: $afz, djb: $djb, bfz: $bfz, djc: $djc, cfz: $cfz, djd: $djd, dfz: $dfz, dje: $dje, efz: $efz, zt: $zt, score: $score, options: $options}';
  }

  @JsonKey(name: "lsh", defaultValue: 0)
  int lsh;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "mc", defaultValue: "")
  String mc;
  @JsonKey(name: "nr", defaultValue: "")
  String nr;
  @JsonKey(name: "xh", defaultValue: 0)
  int xh;
  @JsonKey(name: "lb")
  dynamic lb;
  @JsonKey(name: "qz", defaultValue: 0.0)
  double qz;
  @JsonKey(name: "zbnh", defaultValue: "")
  String zbnh;
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
  @JsonKey(name: "zt", defaultValue: 0)
  int zt;
  @JsonKey(name: "score", fromJson: _parseScore)
  int? score;

  @JsonKey(ignore: true)
  List<PedagogicalEvaluationOption> options = [];

  List<PedagogicalEvaluationOption> _generateOptions(
      PedagogicalEvaluationQuestion option) {
    return [
      PedagogicalEvaluationOption(
          index: 0, name: option.dja, score: option.afz),
      PedagogicalEvaluationOption(
          index: 1, name: option.djb, score: option.bfz),
      PedagogicalEvaluationOption(
          index: 2, name: option.djc, score: option.cfz),
      PedagogicalEvaluationOption(
          index: 3, name: option.djd, score: option.dfz),
      PedagogicalEvaluationOption(index: 4, name: option.dje, score: option.efz)
    ];
  }

  factory PedagogicalEvaluationQuestion.fromJson(Map<String, dynamic> json) =>
      _$PedagogicalEvaluationQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$PedagogicalEvaluationQuestionToJson(this);
}
