import 'dart:math';

import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guettoolbox/data/model/course_lab_response.dart';
import 'package:guettoolbox/data/model/course_response.dart';
import 'package:guettoolbox/data/model/db/base.dart';
import 'package:guettoolbox/util/list.dart';

part 'semester_schedule.g.dart';

@Entity(tableName: 'semester_schedule')
@JsonSerializable(explicitToJson: true)
class SemesterSchedule extends BaseEntity {
  SemesterSchedule(
      {required this.id,
      required this.username,
      required this.isManuallyAdd,
      required super.updateTime,
      required this.courseIntId,
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
      required this.labLessonId,
      required this.batch,
      required this.assistantNo,
      required this.startWeek,
      required this.endWeek,
      required this.oddWeek,
      required this.weekday,
      required this.section,
      required this.experiment,
      required this.classroom,
      required this.classroomAlias,
      required this.classroomId,
      required this.comment});

  @PrimaryKey()
  @ColumnInfo(name: "id")
  String id;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "is_manually_add", defaultValue: false)
  @ColumnInfo(name: "is_manually_add")
  bool isManuallyAdd;

  @ColumnInfo(name: "course_int_id")
  @JsonKey(name: "course_int_id", defaultValue: 0)
  int courseIntId;

  @JsonKey(name: "type", defaultValue: "")
  String type;

  @JsonKey(name: "typename", defaultValue: "")
  String typename;

  @ColumnInfo(name: 'exam_type')
  @JsonKey(name: "examType", defaultValue: "")
  String examType;

  @ColumnInfo(name: 'college_name')
  @JsonKey(name: "collegeName", defaultValue: "")
  String collegeName;

  @ColumnInfo(name: 'college_no')
  @JsonKey(name: "collegeNo", defaultValue: "")
  String collegeNo;

  @ColumnInfo(name: 'major_name')
  @JsonKey(name: "majorName", defaultValue: "")
  String majorName;

  @ColumnInfo(name: 'major_no')
  @JsonKey(name: "majorNo", defaultValue: "")
  String majorNo;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @ColumnInfo(name: 'course_no')
  @JsonKey(name: "courseNo", defaultValue: "")
  String courseNo;

  @ColumnInfo(name: 'teacher_no')
  @JsonKey(name: "teacherNo", defaultValue: "")
  String teacherNo;

  @JsonKey(name: "teacher", defaultValue: "")
  String teacher;

  @JsonKey(name: "term", defaultValue: "")
  String term;

  @ColumnInfo(name: 'course_id')
  @JsonKey(name: "courseId", defaultValue: "")
  String courseId;

  @ColumnInfo(name: 'maximum_selectable')
  @JsonKey(name: "maximumSelectable", defaultValue: 0)
  int maximumSelectable;

  @JsonKey(name: "selected", defaultValue: 0)
  int selected;

  @JsonKey(name: "credits", defaultValue: 0.0)
  double credits;

  @ColumnInfo(name: 'is_lab')
  @JsonKey(name: "isLab", defaultValue: false)
  bool isLab;

  @ColumnInfo(name: 'lab_lesson_id')
  @JsonKey(name: "labLessonId", defaultValue: "")
  String labLessonId;

  @JsonKey(name: "batch", defaultValue: 0)
  int batch;

  @ColumnInfo(name: 'assistant_no')
  @JsonKey(name: "assistantNo", defaultValue: "")
  String assistantNo;

  @JsonKey(name: "comment", defaultValue: "")
  String comment;

  @JsonKey(name: "experiment", defaultValue: "")
  String experiment;

  @JsonKey(name: "classroom", defaultValue: "")
  String classroom;

  @ColumnInfo(name: 'classroom_alias')
  @JsonKey(name: "classroomAlias", defaultValue: "")
  String classroomAlias;

  @ColumnInfo(name: 'classroom_id')
  @JsonKey(name: "classroomId", defaultValue: "")
  String classroomId;

  @ColumnInfo(name: 'start_week')
  @JsonKey(name: "startWeek", defaultValue: 0)
  int startWeek;

  @ColumnInfo(name: 'end_week')
  @JsonKey(name: "endWeek", defaultValue: 0)
  int endWeek;

  @ColumnInfo(name: 'odd_week')
  @JsonKey(name: "oddWeek", defaultValue: false)
  bool oddWeek;

  @JsonKey(name: "weekday", defaultValue: 0)
  int weekday;

  @JsonKey(name: "section", defaultValue: 0)
  int section;

  factory SemesterSchedule.fromCourse(Course course, String username) {
    return SemesterSchedule(
        id: course.courseno,
        username: username,
        isManuallyAdd: false,
        updateTime: DateTime.now(),
        courseIntId: course.id,
        type: course.ctype,
        typename: course.tname,
        examType: course.examt,
        collegeName: course.dptname ?? "",
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
        labLessonId: "",
        batch: 0,
        assistantNo: "",
        startWeek: course.startweek,
        endWeek: course.endweek,
        oddWeek: course.oddweek ?? false,
        weekday: course.week,
        section: int.parse(course.seq),
        experiment: "",
        classroom: course.croomno ?? "",
        classroomAlias: "",
        classroomId: "",
        comment: course.comm ?? "");
  }

  factory SemesterSchedule.fromLabCourse(CourseLab course, String username) {
    return SemesterSchedule(
        id: course.xh,
        username: username,
        isManuallyAdd: false,
        updateTime: DateTime.now(),
        courseIntId: 0,
        type: "",
        typename: "",
        examType: "",
        collegeName: "",
        collegeNo: "",
        majorName: course.spname,
        majorNo: course.spno,
        grade: course.grade,
        name: course.cname,
        courseNo: course.labid,
        teacherNo: course.teacherno,
        teacher: course.name,
        term: course.term,
        courseId: course.courseid,
        maximumSelectable: course.persons,
        selected: course.stusct,
        credits: 0,
        isLab: true,
        labLessonId: course.xh,
        batch: course.bno,
        assistantNo: course.assistantno,
        startWeek: course.zc,
        endWeek: course.zc,
        oddWeek: false,
        weekday: course.xq,
        section: course.jc,
        experiment: course.itemname,
        classroom: course.srdd,
        classroomAlias: course.srname,
        classroomId: course.srid,
        comment: course.comm ?? "");
  }

  factory SemesterSchedule.fromJson(Map<String, dynamic> json) =>
      _$SemesterScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterScheduleToJson(this);
}

List<SemesterSchedule> generateSemesterSchedule(
    List<Course> courses, List<CourseLab> labs, String username) {
  // List<Course> courseGroup = [];
  // List<CourseLab> labCourseGroup = [];
  // Map<String,List<Classroom>> classrooms = {};
  final list1 = courses.map((e) {
    // final last = () => courseGroup.first;
    // if (courseGroup.isEmpty ||
    //     !(last().courseno == e.courseno &&
    //         e.week == last().week &&
    //         e.seq == last().seq)) {
    //   courseGroup = courses
    //       .where((e1) =>
    //           e.courseno == e1.courseno && e.week == e1.week && e.seq == e1.seq)
    //       .toList();
    //   final classrooms0 = courseGroup
    //       .where((e) => !TextUtil.isEmpty(e.croomno))
    //       .map((e) => Classroom(e.startweek, e.endweek, e.croomno!))
    //       .toSet()
    //       .toList();
    //   classrooms = groupAndMerge(classrooms0);
    // }
    return SemesterSchedule.fromCourse(
        e /*, classrooms.values.expand((e) => e).toList()*/, username);
  });
  final list2 = labs.map((e) {
    // final last = () => labCourseGroup.first;
    // if (labCourseGroup.isEmpty ||
    //     !(last().labid == e.labid && e.xq == last().xq && e.jc == last().jc)) {
    //   labCourseGroup = labs
    //       .where((e1) => e.srdd == e1.srdd && e.xq == e1.xq && e.jc == e1.jc)
    //       .toList();
    //   final classrooms0 = labCourseGroup
    //       .where((e) => !TextUtil.isEmpty(e.srdd))
    //       .map((e) => Classroom(e.zc, e.zc, e.srdd))
    //       .toSet()
    //       .toList();
    //   classrooms = groupAndMerge(classrooms0);
    // }
    return SemesterSchedule.fromLabCourse(
        e /*, classrooms.values.expand((e) => e).toList()*/, username);
  });
  return [...list1, ...list2];
}

@JsonSerializable(explicitToJson: true)
class Classroom {
  @JsonKey(name: "startWeek", defaultValue: 0)
  int startWeek;
  @JsonKey(name: "endWeek", defaultValue: 0)
  int endWeek;
  @JsonKey(name: "room", defaultValue: "")
  String room;

  Classroom(this.startWeek, this.endWeek, this.room);

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassroomToJson(this);
}

Map<String, List<Classroom>> groupAndMerge(List<Classroom> classrooms) {
  Map<String, List<Classroom>> groupedClassrooms =
      classrooms.groupBy((c) => c.room);
  Map<String, List<Classroom>> mergedClassrooms = {};
  for (List<Classroom> group in groupedClassrooms.values) {
    Classroom? merged = null;
    for (Classroom classroom in group) {
      if (merged == null) {
        merged = classroom;
      } else if (classroom.startWeek <= merged.endWeek + 1) {
        merged = merge(merged, classroom);
      } else {
        if (!mergedClassrooms.containsKey(merged.room)) {
          mergedClassrooms[merged.room] = [];
        }
        mergedClassrooms[merged.room]?.add(merged);
        merged = classroom;
      }
    }
    if (merged != null) {
      if (!mergedClassrooms.containsKey(merged.room)) {
        mergedClassrooms[merged.room] = [];
      }
      mergedClassrooms[merged.room]?.add(merged);
    }
  }
  return mergedClassrooms;
}

Classroom merge(Classroom a, Classroom b) {
  return Classroom(
    min(a.startWeek, b.startWeek),
    max(a.endWeek, b.endWeek),
    a.room,
  );
}
