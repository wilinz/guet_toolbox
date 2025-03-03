import 'package:json_annotation/json_annotation.dart';

part 'exam_scores.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamScoresResponse {
  ExamScoresResponse({
    required this.success,
    required this.total,
    required this.data,
  });

  @JsonKey(name: 'success', defaultValue: false)
  bool success;
  @JsonKey(name: 'total', defaultValue: 0)
  int total;
  @JsonKey(name: 'data', defaultValue: [])
  List<ExamScore> data;

  factory ExamScoresResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamScoresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScoresResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExamScore {
  ExamScore({
    required this.departmentNumber,
    required this.departmentName,
    required this.specializationNumber,
    required this.specializationName,
    required this.classNumber,
    required this.enrollmentYear,
    required this.studentId,
    required this.name,
    required this.term,
    required this.courseId,
    required this.courseNumber,
    required this.courseName,
    this.courseLevel,
    required this.score,
    required this.overallScoreAlias,
    required this.courseType,
    required this.typeNo,
    required this.cid,
    required this.cno,
    required this.labScore,
    required this.midtermScore,
    required this.regularScore,
    required this.examScore,
    required this.overallScore,
    required this.examCategory,
    required this.scoreCategory,
    required this.examTime,
    required this.credit,
    required this.studentCategory,
    this.teacherName,
    required this.stage,
    required this.examType,
    required this.xs,
    required this.scoreType,
    required this.chk,
    this.remarks,
  });

  @JsonKey(name: 'dptno', defaultValue: '')
  String departmentNumber;
  @JsonKey(name: 'dptname', defaultValue: '')
  String departmentName;
  @JsonKey(name: 'spno', defaultValue: '')
  String specializationNumber;
  @JsonKey(name: 'spname', defaultValue: '')
  String specializationName;
  @JsonKey(name: 'bj', defaultValue: '')
  String classNumber;
  @JsonKey(name: 'grade', defaultValue: 0)
  int enrollmentYear;
  @JsonKey(name: 'stid', defaultValue: '')
  String studentId;
  @JsonKey(name: 'name', defaultValue: '')
  String name;
  @JsonKey(name: 'term', defaultValue: '')
  String term;
  @JsonKey(name: 'courseid', defaultValue: '')
  String courseId;
  @JsonKey(name: 'courseno', defaultValue: '')
  String courseNumber;
  @JsonKey(name: 'cname', defaultValue: '')
  String courseName;
  @JsonKey(name: 'courselevel')
  dynamic courseLevel;
  @JsonKey(name: 'score', defaultValue: 0)
  double score;
  @JsonKey(name: 'zpxs', defaultValue: '')
  String overallScoreAlias;
  @JsonKey(name: 'kctype', defaultValue: '')
  String courseType;
  @JsonKey(name: 'typeno', defaultValue: '')
  String typeNo;
  @JsonKey(name: 'cid', defaultValue: '')
  String cid;
  @JsonKey(name: 'cno', defaultValue: '')
  String cno;
  @JsonKey(name: 'sycj', defaultValue: 0.0)
  double labScore;
  @JsonKey(name: 'qzcj', defaultValue: 0.0)
  double midtermScore;
  @JsonKey(name: 'pscj', defaultValue: 0.0)
  double regularScore;
  @JsonKey(name: 'khcj', defaultValue: 0.0)
  double examScore;
  @JsonKey(name: 'zpcj', defaultValue: 0.0)
  double overallScore;
  @JsonKey(name: 'kslb', defaultValue: '')
  String examCategory;
  @JsonKey(name: 'cjlb', defaultValue: '')
  String scoreCategory;
  @JsonKey(name: 'kssj', defaultValue: 0)
  int examTime;
  @JsonKey(name: 'xf', defaultValue: 0.0)
  double credit;
  @JsonKey(name: 'xslb', defaultValue: '')
  String studentCategory;
  @JsonKey(name: 'tname1')
  String? teacherName;
  @JsonKey(name: 'stage', defaultValue: 0.0)
  double stage;
  @JsonKey(name: 'examt', defaultValue: '')
  String examType;
  @JsonKey(name: 'xs', defaultValue: 0)
  int xs;
  @JsonKey(name: 'cjlx', defaultValue: 0)
  int scoreType;
  @JsonKey(name: 'chk', defaultValue: 0)
  int chk;
  @JsonKey(name: 'comm')
  String? remarks;

  factory ExamScore.fromJson(Map<String, dynamic> json) =>
      _$ExamScoreFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScoreToJson(this);
}
