import 'package:json_annotation/json_annotation.dart';

part 'course_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseResponse {
  CourseResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<OldCourse> data;

  factory CourseResponse.fromJson(Map<String, dynamic> json) => _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OldCourse {
  OldCourse(
      {required this.id,
      required this.ctype,
      required this.tname,
      required this.examt,
      this.dptname,
      required this.dptno,
      required this.spname,
      required this.spno,
      required this.grade,
      required this.cname,
      required this.courseno,
      required this.teacherno,
      required this.name,
      required this.term,
      required this.courseid,
      this.croomno,
      this.comm,
      required this.startweek,
      required this.endweek,
      this.oddweek,
      required this.week,
      required this.seq,
      required this.maxcnt,
      required this.xf,
      required this.llxs,
      required this.syxs,
      required this.sjxs,
      required this.qtxs,
      required this.sctcnt,
      required this.hours});

  @JsonKey(name: "id", defaultValue: 0)
  int id;
  @JsonKey(name: "ctype", defaultValue: "")
  String ctype;
  @JsonKey(name: "tname", defaultValue: "")
  String tname;
  @JsonKey(name: "examt", defaultValue: "")
  String examt;
  @JsonKey(name: "dptname")
  dynamic dptname;
  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "cname", defaultValue: "")
  String cname;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherno;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "croomno")
  String? croomno;
  @JsonKey(name: "comm")
  String? comm;
  @JsonKey(name: "startweek", defaultValue: 0)
  int startweek;
  @JsonKey(name: "endweek", defaultValue: 0)
  int endweek;
  @JsonKey(name: "oddweek")
  dynamic oddweek;
  @JsonKey(name: "week", defaultValue: 0)
  int week;
  @JsonKey(name: "seq", defaultValue: "")
  String seq;
  @JsonKey(name: "maxcnt", defaultValue: 0)
  int maxcnt;
  @JsonKey(name: "xf", defaultValue: 0.0)
  double xf;
  @JsonKey(name: "llxs", defaultValue: 0.0)
  double llxs;
  @JsonKey(name: "syxs", defaultValue: 0.0)
  double syxs;
  @JsonKey(name: "sjxs", defaultValue: 0.0)
  double sjxs;
  @JsonKey(name: "qtxs", defaultValue: 0.0)
  double qtxs;
  @JsonKey(name: "sctcnt", defaultValue: 0)
  int sctcnt;
  @JsonKey(name: "hours", defaultValue: 0)
  int hours;

  factory OldCourse.fromJson(Map<String, dynamic> json) => _$OldCourseFromJson(json);

  Map<String, dynamic> toJson() => _$OldCourseToJson(this);
}


