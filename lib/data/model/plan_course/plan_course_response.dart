import 'package:guethub/data/model/plan_course/plan_course_detail_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_course_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanCourseResponse {
  PlanCourseResponse(
      {required this.success, required this.total, required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<PlanCourse> data;

  factory PlanCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCourseResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlanCourse {
  PlanCourse(
      {required this.id,
      required this.term,
      required this.courseid,
      required this.cname,
      required this.spno,
      required this.grade,
      required this.tname,
      required this.xf,
      required this.scted,
      this.courseno,
      this.name,
      required this.maxstu,
      required this.sctcnt,
      this.stid,
      this.comm,
      required this.lot,
      this.ap,
      this.xm});

  @JsonKey(name: "id", defaultValue: "")
  String id;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "tname", defaultValue: "")
  String tname;
  @JsonKey(name: "xf", defaultValue: "")
  String xf;
  @JsonKey(name: "scted", defaultValue: 0)
  int scted;
  @JsonKey(name: "courseno")
  dynamic courseno;
  @JsonKey(name: "name")
  dynamic name;
  @JsonKey(name: "maxstu", defaultValue: 0)
  int maxstu;
  @JsonKey(name: "sctcnt", defaultValue: 0)
  int sctcnt;
  @JsonKey(name: "stid")
  dynamic stid;
  @JsonKey(name: "comm")
  dynamic comm;
  @JsonKey(name: "lot", defaultValue: 0)
  int lot;
  @JsonKey(name: "ap")
  dynamic ap;
  @JsonKey(name: "xm")
  dynamic xm;
  @JsonKey(ignore: true)
  List<PlanCourseDetail> details = [];

  factory PlanCourse.fromJson(Map<String, dynamic> json) =>
      _$PlanCourseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCourseToJson(this);
}
