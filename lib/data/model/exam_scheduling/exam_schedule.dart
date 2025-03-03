import 'package:json_annotation/json_annotation.dart';

part 'exam_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamScheduleResponse {
  ExamScheduleResponse({
    required this.success,
    required this.total,
    required this.data,
  });

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<ExamSchedule> data;

  factory ExamScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScheduleResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExamSchedule {
  ExamSchedule({
    required this.classroomNo,
    this.classroomName,
    this.teacher,
    this.teacher1,
    this.teacher2,
    this.js,
    this.js1,
    this.js2,
    this.studentId1,
    this.studentId2,
    required this.roomSeats,
    required this.pc,
    required this.term,
    required this.grade,
    this.department,
    required this.majorCode,
    required this.majorName,
    required this.courseId,
    required this.courseNo,
    this.labNo,
    this.labName,
    required this.departmentNo,
    required this.teacherNo,
    required this.teacherName,
    this.credit,
    required this.courseName,
    required this.enrollmentCount,
    required this.studentCount,
    this.scoreType,
    this.examType,
    this.examCategory,
    this.typeNo,
    required this.examDate,
    this.examTime,
    required this.examState,
    this.examMode,
    this.xm,
    this.referenceTime,
    required this.weekNo,
    required this.weekDay,
    required this.startSection,
    required this.endSection,
    required this.bkzt,
    required this.examTimeRange,
    required this.remarks,
    required this.classroomInfo,
    required this.serialNo,
    required this.zone,
    this.checked1,
    this.postDate,
    this.operator,
    this.pk,
  });

  @JsonKey(name: "croomno", defaultValue: "")
  String classroomNo;
  @JsonKey(name: "croomname")
  dynamic classroomName;
  @JsonKey(name: "tch")
  dynamic teacher;
  @JsonKey(name: "tch1")
  dynamic teacher1;
  @JsonKey(name: "tch2")
  dynamic teacher2;
  @JsonKey(name: "js")
  dynamic js;
  @JsonKey(name: "js1")
  dynamic js1;
  @JsonKey(name: "js2")
  dynamic js2;
  @JsonKey(name: "stid1")
  dynamic studentId1;
  @JsonKey(name: "stid2")
  dynamic studentId2;
  @JsonKey(name: "roomrs", defaultValue: 0)
  int roomSeats;
  @JsonKey(name: "pc", defaultValue: 0)
  int pc;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "dpt")
  dynamic department;
  @JsonKey(name: "spno", defaultValue: "")
  String majorCode;
  @JsonKey(name: "spname", defaultValue: "")
  String majorName;
  @JsonKey(name: "courseid", defaultValue: "")
  String courseId;
  @JsonKey(name: "courseno", defaultValue: "")
  String courseNo;
  @JsonKey(name: "labno")
  dynamic labNo;
  @JsonKey(name: "labname")
  dynamic labName;
  @JsonKey(name: "dptno", defaultValue: "")
  String departmentNo;
  @JsonKey(name: "teacherno", defaultValue: "")
  String teacherNo;
  @JsonKey(name: "name", defaultValue: "")
  String teacherName;
  @JsonKey(name: "xf")
  dynamic credit;
  @JsonKey(name: "cname", defaultValue: "")
  String courseName;
  @JsonKey(name: "sctcnt", defaultValue: "")
  String enrollmentCount;
  @JsonKey(name: "stucnt", defaultValue: "")
  String studentCount;
  @JsonKey(name: "scoretype")
  dynamic scoreType;
  @JsonKey(name: "examt")
  dynamic examType;
  @JsonKey(name: "kctype")
  dynamic examCategory;
  @JsonKey(name: "typeno")
  dynamic typeNo;
  @JsonKey(name: "examdate", defaultValue: "")
  String examDate;
  @JsonKey(name: "examtime")
  dynamic examTime;
  @JsonKey(name: "examstate", defaultValue: 0)
  int examState;
  @JsonKey(name: "exammode")
  dynamic examMode;
  @JsonKey(name: "xm")
  dynamic xm;
  @JsonKey(name: "refertime")
  dynamic referenceTime;
  @JsonKey(name: "zc", defaultValue: 0)
  int weekNo;
  @JsonKey(name: "xq", defaultValue: 0)
  int weekDay;
  @JsonKey(name: "ksjc", defaultValue: "")
  String startSection;
  @JsonKey(name: "jsjc", defaultValue: "")
  String endSection;
  @JsonKey(name: "bkzt", defaultValue: "")
  String bkzt;
  @JsonKey(name: "kssj", defaultValue: "")
  String examTimeRange;
  @JsonKey(name: "comm", defaultValue: "")
  String remarks;
  @JsonKey(name: "rooms", defaultValue: "")
  String classroomInfo;
  @JsonKey(name: "lsh", defaultValue: "")
  String serialNo;
  @JsonKey(name: "zone", defaultValue: 0)
  int zone;
  @JsonKey(name: "checked1")
  dynamic checked1;
  @JsonKey(name: "postdate")
  dynamic postDate;
  @JsonKey(name: "operator")
  dynamic operator;
  @JsonKey(name: "pk")
  dynamic pk;

  factory ExamSchedule.fromJson(Map<String, dynamic> json) => _$ExamScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScheduleToJson(this);
}