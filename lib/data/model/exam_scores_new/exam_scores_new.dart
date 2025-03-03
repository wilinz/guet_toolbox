import 'package:floor/floor.dart';
import 'package:guethub/data/model/db/base.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:kt_dart/kt.dart';

part 'exam_scores_new.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamScoresNewResponse {
  ExamScoresNewResponse(
      {required this.examScoresNews,
      required this.semesters,
      required this.id2semesters});

  @JsonKey(name: "semesterId2studentGrades", defaultValue: [])
  List<List<ExamScoresNew>> examScoresNews;

  @JsonKey(name: "semesters", defaultValue: [])
  List<Semesters> semesters;

  @JsonKey(name: "id2semesters", defaultValue: [])
  List<Id2semesters> id2semesters;

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    json['semesterId2studentGrades'] =
        json['semesterId2studentGrades'].values.toList();
    json['id2semesters'] = json['id2semesters'].values.toList();
    return json;
  }

  factory ExamScoresNewResponse.fromJsonWithPreprocessJson(
          Map<String, dynamic> json) =>
      _$ExamScoresNewResponseFromJson(_preprocessJson(json));

  factory ExamScoresNewResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamScoresNewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScoresNewResponseToJson(this);

  factory ExamScoresNewResponse.emptyInstance() => ExamScoresNewResponse(
      examScoresNews: [], semesters: [], id2semesters: []);
}

@Entity(tableName: 'exam_scores_new', primaryKeys: ['id', 'username'])
@JsonSerializable(explicitToJson: true)
class ExamScoresNew extends BaseEntity {
  ExamScoresNew({
    required this.id,
    required this.username,
    required this.semesterId,
    required this.semesterName,
    required this.courseCode,
    required this.courseName,
    required this.courseNameEn,
    required this.lessonCode,
    required this.lessonName,
    this.minorCourseCode,
    this.minorCourseName,
    this.minorCourseNameEn,
    required this.credits,
    required this.courseType,
    required this.courseProperty,
    required this.gaGrade,
    required this.passed,
    // this.gp,
    required this.gradeDetail,
    required this.published,
    // this.fillAGrade,
    required this.compulsory,
    this.unread = false,
    required this.scores,
    required this.gradeGrades,
    required this.creditsCourse,
    DateTime? createTime,
    DateTime? updateTime,
  }) {
    createTime?.let((it) {
      super.createTime = it;
    });
    updateTime?.let((it) {
      super.updateTime = it;
    });
  }

  @ColumnInfo(name: "id")
  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @ColumnInfo(name: "username")
  @JsonKey(name: "username", defaultValue: "")
  String username;

  @ColumnInfo(name: "semester_id")
  @JsonKey(name: "semesterId", defaultValue: 0)
  int semesterId;

  @ColumnInfo(name: "semester_name")
  @JsonKey(name: "semesterName", defaultValue: "")
  String semesterName;

  @ColumnInfo(name: "course_code")
  @JsonKey(name: "courseCode", defaultValue: "")
  String courseCode;

  @ColumnInfo(name: "course_name")
  @JsonKey(name: "courseName", defaultValue: "")
  String courseName;

  @ColumnInfo(name: "course_name_en")
  @JsonKey(name: "courseNameEn", defaultValue: "")
  String courseNameEn;

  @ColumnInfo(name: "lesson_code")
  @JsonKey(name: "lessonCode", defaultValue: "")
  String lessonCode;

  @ColumnInfo(name: "lesson_name")
  @JsonKey(name: "lessonName", defaultValue: "")
  String lessonName;

  @ColumnInfo(name: "minor_course_code")
  @JsonKey(name: "minorCourseCode")
  String? minorCourseCode;

  @ColumnInfo(name: "minor_course_name")
  @JsonKey(name: "minorCourseName")
  String? minorCourseName;

  @ColumnInfo(name: "minor_course_name_en")
  @JsonKey(name: "minorCourseNameEn")
  String? minorCourseNameEn;

  @ColumnInfo(name: "credits")
  @JsonKey(name: "credits", defaultValue: 0.0)
  double credits;

  @ColumnInfo(name: "course_type")
  @JsonKey(name: "courseType", defaultValue: "")
  String courseType;

  @ColumnInfo(name: "course_property")
  @JsonKey(name: "courseProperty", defaultValue: "")
  String courseProperty;

  @ColumnInfo(name: "ga_grade")
  @JsonKey(name: "gaGrade", defaultValue: "")
  String gaGrade;

  @ColumnInfo(name: "scores")
  @JsonKey(name: "scores", defaultValue: 0.0)
  double scores;

  @ColumnInfo(name: "grade_grades")
  @JsonKey(name: "gradeGrades", defaultValue: "")
  String gradeGrades;

  @ColumnInfo(name: "credits_course")
  @JsonKey(name: "creditsCourse", defaultValue: false)
  bool creditsCourse;

  @ColumnInfo(name: "passed")
  @JsonKey(name: "passed", defaultValue: false)
  bool passed;

  // @ColumnInfo(name: "gp")
  // @JsonKey(name: "gp")
  // dynamic gp;

  @ColumnInfo(name: "grade_detail")
  @JsonKey(name: "gradeDetail", defaultValue: "")
  String gradeDetail;

  @ColumnInfo(name: "published")
  @JsonKey(name: "published", defaultValue: false)
  bool published;

  // @ColumnInfo(name: "fill_a_grace")
  // @JsonKey(name: "fillAGrace")
  // dynamic fillAGrade;

  @ColumnInfo(name: "compulsory")
  @JsonKey(name: "compulsory", defaultValue: false)
  bool compulsory;

  @ColumnInfo(name: "unread")
  @JsonKey(name: "unread", defaultValue: false)
  bool unread = false;

  factory ExamScoresNew.fromJson(Map<String, dynamic> json) =>
      _$ExamScoresNewFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScoresNewToJson(this);

  factory ExamScoresNew.emptyInstance() => ExamScoresNew(
      id: 0,
      username: "",
      semesterId: 0,
      semesterName: "",
      courseCode: "",
      courseName: "",
      courseNameEn: "",
      lessonCode: "",
      lessonName: "",
      credits: 0,
      courseType: "",
      courseProperty: "",
      gaGrade: "",
      passed: false,
      gradeDetail: "",
      published: false,
      compulsory: false,
      scores: 0,
      gradeGrades: "",
      creditsCourse: false,
      updateTime: DateTime.now());
}

@JsonSerializable(explicitToJson: true)
class Semesters {
  Semesters(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.calendarAssoc,
      required this.schoolYear,
      required this.startDate,
      required this.endDate,
      required this.weekStartOnSunday,
      required this.countInTerm,
      required this.season,
      required this.enabled,
      this.fileInfoAssoc,
      required this.approvedYear,
      required this.lessonGenCode,
      required this.includeMonths,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "calendarAssoc", defaultValue: 0)
  int calendarAssoc;

  @JsonKey(name: "schoolYear", defaultValue: "")
  String schoolYear;

  @JsonKey(name: "startDate", defaultValue: "")
  String startDate;

  @JsonKey(name: "endDate", defaultValue: "")
  String endDate;

  @JsonKey(name: "weekStartOnSunday", defaultValue: false)
  bool weekStartOnSunday;

  @JsonKey(name: "countInTerm", defaultValue: false)
  bool countInTerm;

  @JsonKey(name: "season", defaultValue: "")
  String season;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "fileInfoAssoc")
  dynamic fileInfoAssoc;

  @JsonKey(name: "approvedYear", defaultValue: "")
  String approvedYear;

  @JsonKey(name: "lessonGenCode", defaultValue: "")
  String lessonGenCode;

  @JsonKey(name: "includeMonths", defaultValue: [])
  List<int> includeMonths;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory Semesters.fromJson(Map<String, dynamic> json) =>
      _$SemestersFromJson(json);

  Map<String, dynamic> toJson() => _$SemestersToJson(this);

  factory Semesters.emptyInstance() => Semesters(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      calendarAssoc: 0,
      schoolYear: "",
      startDate: "",
      endDate: "",
      weekStartOnSunday: false,
      countInTerm: false,
      season: "",
      enabled: false,
      approvedYear: "",
      lessonGenCode: "",
      includeMonths: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Id2semesters {
  Id2semesters(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.calendarAssoc,
      required this.schoolYear,
      required this.startDate,
      required this.endDate,
      required this.weekStartOnSunday,
      required this.countInTerm,
      required this.season,
      required this.enabled,
      this.fileInfoAssoc,
      required this.approvedYear,
      required this.lessonGenCode,
      required this.includeMonths,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "calendarAssoc", defaultValue: 0)
  int calendarAssoc;

  @JsonKey(name: "schoolYear", defaultValue: "")
  String schoolYear;

  @JsonKey(name: "startDate", defaultValue: "")
  String startDate;

  @JsonKey(name: "endDate", defaultValue: "")
  String endDate;

  @JsonKey(name: "weekStartOnSunday", defaultValue: false)
  bool weekStartOnSunday;

  @JsonKey(name: "countInTerm", defaultValue: false)
  bool countInTerm;

  @JsonKey(name: "season", defaultValue: "")
  String season;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "fileInfoAssoc")
  dynamic fileInfoAssoc;

  @JsonKey(name: "approvedYear", defaultValue: "")
  String approvedYear;

  @JsonKey(name: "lessonGenCode", defaultValue: "")
  String lessonGenCode;

  @JsonKey(name: "includeMonths", defaultValue: [])
  List<int> includeMonths;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory Id2semesters.fromJson(Map<String, dynamic> json) =>
      _$Id2semestersFromJson(json);

  Map<String, dynamic> toJson() => _$Id2semestersToJson(this);

  factory Id2semesters.emptyInstance() => Id2semesters(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      calendarAssoc: 0,
      schoolYear: "",
      startDate: "",
      endDate: "",
      weekStartOnSunday: false,
      countInTerm: false,
      season: "",
      enabled: false,
      approvedYear: "",
      lessonGenCode: "",
      includeMonths: [],
      transient: false,
      name: "");
}
