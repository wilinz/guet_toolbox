import 'package:json_annotation/json_annotation.dart';

part 'exam_scheduling.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamScheduling {
  ExamScheduling(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  factory ExamScheduling.fromJson(Map<String, dynamic> json) => _$ExamSchedulingFromJson(json);

  Map<String, dynamic> toJson() => _$ExamSchedulingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.croomno,
      this.croomname,
      this.tch,
      this.tch1,
      this.tch2,
      this.js,
      this.js1,
      this.js2,
      this.stid1,
      this.stid2,
      required this.roomrs,
      required this.pc,
      required this.term,
      required this.grade,
      this.dpt,
      required this.spno,
      required this.spname,
      required this.courseid,
      required this.courseno,
      this.labno,
      this.labname,
      required this.dptno,
      required this.teacherno,
      required this.name,
      this.xf,
      required this.cname,
      required this.sctcnt,
      required this.stucnt,
      this.scoretype,
      this.examt,
      this.kctype,
      this.typeno,
      required this.examdate,
      this.examtime,
      required this.examstate,
      this.exammode,
      this.xm,
      this.refertime,
      required this.zc,
      required this.xq,
      required this.ksjc,
      required this.jsjc,
      required this.bkzt,
      required this.kssj,
      required this.comm,
      required this.rooms,
      required this.lsh,
      required this.zone,
      this.checked1,
      this.postdate,
      this.operator,
      this.pk});

  @JsonKey(name: "croomno", defaultValue: "")
  String croomno;
  @JsonKey(name: "croomname")
  dynamic croomname;
  @JsonKey(name: "tch")
  dynamic tch;
  @JsonKey(name: "tch1")
  dynamic tch1;
  @JsonKey(name: "tch2")
  dynamic tch2;
  @JsonKey(name: "js")
  dynamic js;
  @JsonKey(name: "js1")
  dynamic js1;
  @JsonKey(name: "js2")
  dynamic js2;
  @JsonKey(name: "stid1")
  dynamic stid1;
  @JsonKey(name: "stid2")
  dynamic stid2;
  @JsonKey(name: "roomrs", defaultValue: 0)
  int roomrs;
  @JsonKey(name: "pc", defaultValue: 0)
  int pc;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "dpt")
  dynamic dpt;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "labno")
  dynamic labno;
  @JsonKey(name: "labname")
  dynamic labname;
  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherno;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "xf")
  dynamic xf;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "sctcnt", defaultValue: "")
  String sctcnt;
  @JsonKey(name: "stucnt", defaultValue: "")
  String stucnt;
  @JsonKey(name: "scoretype")
  dynamic scoretype;
  @JsonKey(name: "examt")
  dynamic examt;
  @JsonKey(name: "kctype")
  dynamic kctype;
  @JsonKey(name: "typeno")
  dynamic typeno;
  @JsonKey(name: "examdate", defaultValue: "")
  String examdate;
  @JsonKey(name: "examtime")
  dynamic examtime;
  @JsonKey(name: "examstate", defaultValue: 0)
  int examstate;
  @JsonKey(name: "exammode")
  dynamic exammode;
  @JsonKey(name: "xm")
  dynamic xm;
  @JsonKey(name: "refertime")
  dynamic refertime;
  @JsonKey(name: "zc", defaultValue: 0)
  int zc;
  @JsonKey(name: "xq", defaultValue: 0)
  int xq;
  @JsonKey(name: "ksjc", defaultValue: "")
  String ksjc;
  @JsonKey(name: "jsjc", defaultValue: "")
  String jsjc;
  @JsonKey(name: "bkzt", defaultValue: "")
  String bkzt;
  @JsonKey(name: "kssj", defaultValue: "")
  String kssj;
  @JsonKey(name: "comm", defaultValue: "")
  String comm;
  @JsonKey(name: "rooms", defaultValue: "")
  String rooms;
  @JsonKey(name: "lsh", defaultValue: "")
  String lsh;
  @JsonKey(name: "zone", defaultValue: 0)
  int zone;
  @JsonKey(name: "checked1")
  dynamic checked1;
  @JsonKey(name: "postdate")
  dynamic postdate;
  @JsonKey(name: "operator")
  dynamic operator;
  @JsonKey(name: "pk")
  dynamic pk;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


