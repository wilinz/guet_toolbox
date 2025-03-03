import 'package:json_annotation/json_annotation.dart';

part 'plan_course.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanCourse {
  PlanCourse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  factory PlanCourse.fromJson(Map<String, dynamic> json) => _$PlanCourseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.dptno,
      required this.dptname,
      required this.spno,
      required this.spname,
      required this.stid,
      required this.grade,
      required this.classno,
      required this.name,
      required this.coursetype,
      required this.tname,
      required this.cname,
      required this.credithour,
      this.score,
      this.zpxs,
      required this.term,
      this.sterm,
      this.scname,
      required this.courseid,
      this.courseno,
      this.stp,
      this.xf,
      required this.chk});

  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "dptname", defaultValue: "")
  String dptname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "stid", defaultValue: "")
  String stid;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "classno", defaultValue: "")
  String classno;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "coursetype", defaultValue: "")
  String coursetype;
  @JsonKey(name: "tname", defaultValue: "")
  String tname;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "credithour", defaultValue: "")
  String credithour;
  @JsonKey(name: "score")
  String? score;
  @JsonKey(name: "zpxs")
  String? zpxs;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "sterm")
  String? sterm;
  @JsonKey(name: "scname")
  String? scname;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "courseno")
  String? courseno;
  @JsonKey(name: "stp")
  String? stp;
  @JsonKey(name: "xf")
  String? xf;
  @JsonKey(name: "chk", defaultValue: "")
  String chk;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


