import 'package:json_annotation/json_annotation.dart';

part 'plan_course_detail_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PlanCourseDetailResponse {
  PlanCourseDetailResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<PlanCourseDetail> data;

  factory PlanCourseDetailResponse.fromJson(Map<String, dynamic> json) => _$PlanCourseDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCourseDetailResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlanCourseDetail {
  PlanCourseDetail(
      {this.id,
      required this.term,
      required this.courseid,
      this.cname,
      required this.spno,
      required this.grade,
      this.tname,
      required this.xf,
      required this.scted,
      required this.courseno,
      required this.name,
      required this.maxstu,
      required this.sctcnt,
      this.stid,
      this.comm,
      required this.lot,
      required this.ap,
      this.xm});

  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseid;
  @JsonKey(name: "cname")
  String? cname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "tname")
  String? tname;
  @JsonKey(name: "xf", defaultValue: "")
  String xf;
  @JsonKey(name: "scted", defaultValue: 0)
  int scted;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseno;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "maxstu", defaultValue: 0)
  int maxstu;
  @JsonKey(name: "sctcnt", defaultValue: 0)
  int sctcnt;
  @JsonKey(name: "stid")
  dynamic stid;
  @JsonKey(name: "comm")
  String? comm;
  @JsonKey(name: "lot", defaultValue: 0)
  int lot;
  @JsonKey(name: "ap", defaultValue: "")
  String ap;
  @JsonKey(name: "xm")
  dynamic xm;
  @JsonKey(name: "stype", defaultValue: "正常")
  String stype="正常";

  factory PlanCourseDetail.fromJson(Map<String, dynamic> json) => _$PlanCourseDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PlanCourseDetailToJson(this);

  PlanCourseDetail copyWith({
    String? id,
    String? term,
    String? courseid,
    String? cname,
    String? spno,
    String? grade,
    String? tname,
    String? xf,
    int? scted,
    String? courseno,
    String? name,
    int? maxstu,
    int? sctcnt,
    dynamic? stid,
    String? comm,
    int? lot,
    String? ap,
    dynamic? xm,
  }) {
    return PlanCourseDetail(
      id: id ?? this.id,
      term: term ?? this.term,
      courseid: courseid ?? this.courseid,
      cname: cname ?? this.cname,
      spno: spno ?? this.spno,
      grade: grade ?? this.grade,
      tname: tname ?? this.tname,
      xf: xf ?? this.xf,
      scted: scted ?? this.scted,
      courseno: courseno ?? this.courseno,
      name: name ?? this.name,
      maxstu: maxstu ?? this.maxstu,
      sctcnt: sctcnt ?? this.sctcnt,
      stid: stid ?? this.stid,
      comm: comm ?? this.comm,
      lot: lot ?? this.lot,
      ap: ap ?? this.ap,
      xm: xm ?? this.xm,
    );
  }
}


