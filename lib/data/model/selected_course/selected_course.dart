import 'package:json_annotation/json_annotation.dart';

part 'selected_course.g.dart';

@JsonSerializable(explicitToJson: true)
class SelectedCourse {
  SelectedCourse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  factory SelectedCourse.fromJson(Map<String, dynamic> json) => _$SelectedCourseFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedCourseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.xf,
      required this.classno,
      required this.spno,
      this.spname,
      required this.tname,
      required this.tname1,
      required this.grade,
      required this.cname,
      required this.pycc,
      required this.dpt,
      required this.dptno,
      this.xm,
      this.warn,
      this.role,
      this.demo,
      required this.testtype,
      required this.stid,
      required this.name,
      required this.term,
      required this.courseid,
      required this.courseno,
      required this.stype,
      this.khsj,
      required this.state,
      required this.xksj,
      required this.ip,
      this.comm,
      required this.checked,
      this.pscj,
      this.khzt,
      this.cjf,
      this.setjc,
      this.textnum});

  @JsonKey(name: "xf", defaultValue: "")
  String xf;
  @JsonKey(name: "classno", defaultValue: "")
  String classno;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname")
  dynamic spname;
  @JsonKey(name: "tname", defaultValue: "")
  String tname;
  @JsonKey(name: "tname1", defaultValue: "")
  String tname1;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "pycc", defaultValue: "")
  String pycc;
  @JsonKey(name: "dpt", defaultValue: "")
  String dpt;
  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "xm")
  dynamic xm;
  @JsonKey(name: "warn")
  dynamic warn;
  @JsonKey(name: "role")
  dynamic role;
  @JsonKey(name: "demo")
  String? demo;
  @JsonKey(name: "testtype", defaultValue: "")
  String testtype;
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
  @JsonKey(name: "stype", defaultValue: "")
  String stype;
  @JsonKey(name: "khsj")
  dynamic khsj;
  @JsonKey(name: "state", defaultValue: 0)
  int state;
  @JsonKey(name: "xksj", defaultValue: "")
  String xksj;
  @JsonKey(name: "ip", defaultValue: "")
  String ip;
  @JsonKey(name: "comm")
  String? comm;
  @JsonKey(name: "checked", defaultValue: 0)
  int checked;
  @JsonKey(name: "pscj")
  dynamic pscj;
  @JsonKey(name: "khzt")
  dynamic khzt;
  @JsonKey(name: "cjf")
  dynamic cjf;
  @JsonKey(name: "setjc")
  dynamic setjc;
  @JsonKey(name: "textnum")
  dynamic textnum;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


