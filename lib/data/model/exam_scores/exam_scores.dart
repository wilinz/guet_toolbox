import 'package:json_annotation/json_annotation.dart';

part 'exam_scores.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamScores {
  ExamScores(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  factory ExamScores.fromJson(Map<String, dynamic> json) => _$ExamScoresFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScoresToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.dptno,
      required this.dptname,
      required this.spno,
      required this.spname,
      required this.bj,
      required this.grade,
      required this.stid,
      required this.name,
      required this.term,
      required this.courseid,
      required this.courseno,
      required this.cname,
      this.courselevel,
      required this.score,
      required this.zpxs,
      required this.kctype,
      required this.typeno,
      required this.cid,
      required this.cno,
      required this.sycj,
      required this.qzcj,
      required this.pscj,
      required this.khcj,
      required this.zpcj,
      required this.kslb,
      required this.cjlb,
      required this.kssj,
      required this.xf,
      required this.xslb,
      this.tname1,
      required this.stage,
      required this.examt,
      required this.xs,
      required this.cjlx,
      required this.chk,
      this.comm});

  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "dptname", defaultValue: "")
  String dptname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "bj", defaultValue: "")
  String bj;
  @JsonKey(name: "grade", defaultValue: 0)
  int grade;
  @JsonKey(name: "stid", defaultValue: "")
  String stid;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "courselevel")
  dynamic courselevel;
  @JsonKey(name: "score", defaultValue: 0)
  int score;
  @JsonKey(name: "zpxs", defaultValue: "")
  String zpxs;
  @JsonKey(name: "kctype", defaultValue: "")
  String kctype;
  @JsonKey(name: "typeno", defaultValue: "")
  String typeno;
  @JsonKey(name: "cid", defaultValue: "")
  String cid;
  @JsonKey(name: "cno", defaultValue: "")
  String cno;
  @JsonKey(name: "sycj", defaultValue: 0.0)
  double sycj;
  @JsonKey(name: "qzcj", defaultValue: 0.0)
  double qzcj;
  @JsonKey(name: "pscj", defaultValue: 0.0)
  double pscj;
  @JsonKey(name: "khcj", defaultValue: 0.0)
  double khcj;
  @JsonKey(name: "zpcj", defaultValue: 0.0)
  double zpcj;
  @JsonKey(name: "kslb", defaultValue: "")
  String kslb;
  @JsonKey(name: "cjlb", defaultValue: "")
  String cjlb;
  @JsonKey(name: "kssj", defaultValue: 0)
  int kssj;
  @JsonKey(name: "xf", defaultValue: 0.0)
  double xf;
  @JsonKey(name: "xslb", defaultValue: "")
  String xslb;
  @JsonKey(name: "tname1")
  dynamic tname1;
  @JsonKey(name: "stage", defaultValue: 0.0)
  double stage;
  @JsonKey(name: "examt", defaultValue: "")
  String examt;
  @JsonKey(name: "xs", defaultValue: 0)
  int xs;
  @JsonKey(name: "cjlx", defaultValue: 0)
  int cjlx;
  @JsonKey(name: "chk", defaultValue: 0)
  int chk;
  @JsonKey(name: "comm")
  dynamic comm;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


