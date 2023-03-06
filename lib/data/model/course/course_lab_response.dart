import 'package:json_annotation/json_annotation.dart';

part 'course_lab_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseLabResponse {
  CourseLabResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<CourseLab> data;

  factory CourseLabResponse.fromJson(Map<String, dynamic> json) => _$CourseLabResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseLabResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CourseLab {
  CourseLab(
      {required this.term,
      required this.labid,
      required this.itemname,
      required this.courseid,
      required this.cname,
      required this.spno,
      required this.spname,
      required this.grade,
      required this.teacherno,
      required this.name,
      required this.srname,
      required this.srdd,
      required this.xh,
      required this.bno,
      required this.persons,
      required this.zc,
      required this.xq,
      required this.jc,
      required this.jc1,
      required this.assistantno,
      this.teachers,
      this.comm,
      this.courseno,
      required this.stusct,
      required this.srid,
      this.spnos});

  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "labid", defaultValue: "")
  String labid;
  @JsonKey(name: "itemname", defaultValue: "")
  String itemname;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherno;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "srname", defaultValue: "")
  String srname;
  @JsonKey(name: "srdd", defaultValue: "")
  String srdd;
  @JsonKey(name: "xh", defaultValue: "")
  String xh;
  @JsonKey(name: "bno", defaultValue: 0)
  int bno;
  @JsonKey(name: "persons", defaultValue: 0)
  int persons;
  @JsonKey(name: "zc", defaultValue: 0)
  int zc;
  @JsonKey(name: "xq", defaultValue: 0)
  int xq;
  @JsonKey(name: "jc", defaultValue: 0)
  int jc;
  @JsonKey(name: "jc1", defaultValue: 0)
  int jc1;
  @JsonKey(name: "assistantno", defaultValue: "")
  String assistantno;
  @JsonKey(name: "teachers")
  dynamic teachers;
  @JsonKey(name: "comm")
  dynamic comm;
  @JsonKey(name: "courseno")
  dynamic courseno;
  @JsonKey(name: "stusct", defaultValue: 0)
  int stusct;
  @JsonKey(name: "srid", defaultValue: "")
  String srid;
  @JsonKey(name: "spnos")
  dynamic spnos;

  factory CourseLab.fromJson(Map<String, dynamic> json) => _$CourseLabFromJson(json);

  Map<String, dynamic> toJson() => _$CourseLabToJson(this);
}


