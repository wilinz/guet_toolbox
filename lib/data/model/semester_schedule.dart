import 'package:guettoolbox/data/model/course_lab_response.dart';
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'semester_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class SemesterSchedule {
  SemesterSchedule(
      {required this.id,
      required this.type,
      required this.typename,
      required this.examType,
      required this.collegeName,
      required this.collegeNo,
      required this.majorName,
      required this.majorNo,
      required this.grade,
      required this.name,
      required this.courseNo,
      required this.teacherNo,
      required this.teacher,
      required this.term,
      required this.courseId,
      required this.maximumSelectable,
      required this.selected,
      required this.credits,
      required this.isLab,
      required this.labId,
      required this.batch,
      required this.assistantNo,
      required this.lessons});

  @JsonKey(name: "id", defaultValue: 0)
  int id;
  @JsonKey(name: "type", defaultValue: "")
  String type;
  @JsonKey(name: "typename", defaultValue: "")
  String typename;
  @JsonKey(name: "examType", defaultValue: "")
  String examType;
  @JsonKey(name: "collegeName", defaultValue: "")
  String collegeName;
  @JsonKey(name: "collegeNo", defaultValue: "")
  String collegeNo;
  @JsonKey(name: "majorName", defaultValue: "")
  String majorName;
  @JsonKey(name: "majorNo", defaultValue: "")
  String majorNo;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "name", defaultValue: "")
  String name;
  @JsonKey(name: "courseNo", defaultValue: "")
  String courseNo;
  @JsonKey(name: "teacherNo", defaultValue: "")
  String teacherNo;
  @JsonKey(name: "teacher", defaultValue: "")
  String teacher;
  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "courseId", defaultValue: "")
  String courseId;

  @JsonKey(name: "maximumSelectable", defaultValue: 0)
  int maximumSelectable;
  @JsonKey(name: "selected", defaultValue: 0)
  int selected;
  @JsonKey(name: "credits", defaultValue: 0.0)
  double credits;
  @JsonKey(name: "isLab", defaultValue: false)
  bool isLab;
  @JsonKey(name: "labId", defaultValue: "")
  String labId;
  int batch;
  @JsonKey(name: "assistantNo", defaultValue: "")
  String assistantNo;
  @JsonKey(name: "lessons", defaultValue: [])
  List<Lessons> lessons;

  factory SemesterSchedule.fromCourse(Course course, List<Lessons> lessons) {
    return SemesterSchedule(
        id: course.id,
        type: course.ctype,
        typename: course.tname,
        examType: course.examt,
        collegeName: course.dptname??"",
        collegeNo: course.dptno,
        majorName: course.spname,
        majorNo: course.spno,
        grade: course.grade,
        name: course.cname,
        courseNo: course.courseno,
        teacherNo: course.teacherno,
        teacher: course.name,
        term: course.term,
        courseId: course.courseid,
        maximumSelectable: course.maxcnt,
        selected: course.sctcnt,
        credits: course.xf,
        isLab: false,
        labId: "",
        batch: 0,
        assistantNo: "",
        lessons: lessons);
  }

  factory SemesterSchedule.fromLabCourse(
      CourseLab course, List<Lessons> lessons) {
    return SemesterSchedule(
        id: 0,
        type: "",
        typename: "",
        examType: "",
        collegeName: "",
        collegeNo: "",
        majorName: course.spname,
        majorNo: course.spno,
        grade: course.grade,
        name: course.cname,
        courseNo: course.xh,
        teacherNo: course.teacherno,
        teacher: course.name,
        term: course.term,
        courseId: course.courseid,
        maximumSelectable: course.persons,
        selected: course.stusct,
        credits: 0,
        isLab: true,
        labId: course.labid,
        batch: course.bno,
        assistantNo: course.assistantno,
        lessons: lessons);
  }

  factory SemesterSchedule.fromJson(Map<String, dynamic> json) =>
      _$SemesterScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterScheduleToJson(this);
}

List<SemesterSchedule> generateSemesterSchedule(
    List<Course> courses, List<CourseLab> labs) {
  final courseNoList = courses.map((e) => e.courseno).toSet().toList();
  final list1 = courseNoList.map((courseNo) {
    final courseList = courses.where((e) => e.courseno == courseNo).toList();
    final lessons = courseList
        .map((lesson) => Lessons(
            starWeek: lesson.startweek,
            endWeek: lesson.endweek,
            oddWeek: lesson.oddweek ?? false,
            weekday: lesson.week,
            section: int.parse(lesson.seq),
            experiment: "",
            classroom: lesson.croomno ?? "",
            classroomAlias: "",
            classroomId: "",
            comment: lesson.comm ?? ""))
        .toList();
    return SemesterSchedule.fromCourse(courseList.first, lessons);
  });

  final labCourseNoList = labs.map((e) => e.xh).toSet().toList();
  final list2 = labCourseNoList.map((labCourseNo) {
    final labCourseList = labs.where((e) => e.xh == labCourseNo).toList();
    final lessons = labCourseList
        .map((lesson) => Lessons(
            starWeek: lesson.zc,
            endWeek: lesson.zc,
            oddWeek: false,
            weekday: lesson.xq,
            section: lesson.jc,
            experiment: lesson.itemname,
            classroom: lesson.srdd,
            classroomAlias: lesson.srname,
            classroomId: lesson.srid,
            comment: lesson.comm??""))
        .toList();
    return SemesterSchedule.fromLabCourse(labCourseList.first, lessons);
  });
  return [...list1, ...list2];
}

@JsonSerializable(explicitToJson: true)
class Lessons {
  Lessons({
    required this.starWeek,
    required this.endWeek,
    required this.oddWeek,
    required this.weekday,
    required this.section,
    required this.experiment,
    required this.classroom,
    required this.classroomAlias,
    required this.classroomId,
    required this.comment,
  });

  @JsonKey(name: "comment", defaultValue: "")
  String comment;
  @JsonKey(name: "experiment", defaultValue: "")
  String experiment;
  @JsonKey(name: "classroom", defaultValue: "")
  String classroom;
  @JsonKey(name: "classroomAlias", defaultValue: "")
  String classroomAlias;
  @JsonKey(name: "classroomId", defaultValue: "")
  String classroomId;
  @JsonKey(name: "batch", defaultValue: 0)
  @JsonKey(name: "starWeek", defaultValue: 0)
  int starWeek;
  @JsonKey(name: "endWeek", defaultValue: 0)
  int endWeek;
  @JsonKey(name: "oddWeek", defaultValue: false)
  bool oddWeek;
  @JsonKey(name: "weekday", defaultValue: 0)
  int weekday;
  @JsonKey(name: "section", defaultValue: 0)
  int section;

  factory Lessons.fromJson(Map<String, dynamic> json) =>
      _$LessonsFromJson(json);

  Map<String, dynamic> toJson() => _$LessonsToJson(this);
}
