import 'dart:math';

import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/course/course_lab_response.dart';
import 'package:guethub/data/model/db/base.dart';
import 'package:guethub/data/model/new_schedule/new_schedule.dart';
import 'package:guethub/util/datetime.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:guethub/data/model/semesters/semesters.dart' as semester;

import '../exam_schedule/exam_schedule.dart';
import 'course_response.dart';
import 'tools.dart';
import 'package:guethub/logger.dart';
part 'semester_schedule.g.dart';

extension IntervalCheck on int {
  bool isIn(int lowerBound, int upperBound) {
    return this >= lowerBound && this <= upperBound;
  }
}

class WeekRange {
  int weekStart;
  int weekEnd;

  WeekRange(this.weekStart, this.weekEnd);
}

@CopyWith()
@Entity(tableName: 'semester_schedule', primaryKeys: [
  'id',
  'username'
], indices: [
  Index(unique: false, value: ['source'])
])
@autoequal
@JsonSerializable(explicitToJson: true)
class SemesterSchedule extends BaseEntityEquatable {
  SemesterSchedule({
    required this.id,
    required this.username,
    required this.source,
    this.startDateTime,
    this.endDateTime,
    this.startTime,
    this.endTime,
    required this.type,
    required this.typename,
    required this.examType,
    required this.collegeName,
    required this.majorName,
    required this.grade,
    required this.name,
    required this.courseNo,
    required this.teachers,
    required this.term,
    required this.termName,
    required this.capacity,
    required this.selected,
    required this.credits,
    required this.isLab,
    required this.labLessonId,
    required this.batch,
    required this.startWeek,
    required this.endWeek,
    required this.weekday,
    required this.section,
    required this.experiment,
    required this.experimentNo,
    required this.classroom,
    required this.classroomAlias,
    required this.comment,
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
  String id;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  @JsonKey(name: "source", defaultValue: '')
  @ColumnInfo(name: "source")
  String source;

  @ColumnInfo(name: "start_datetime")
  @JsonKey(
      name: "start_datetime",
      fromJson: DateTimeUtils.fromRfc3339,
      toJson: DateTimeUtils.toRfc3339)
  DateTime? startDateTime;

  @ColumnInfo(name: "end_datetime")
  @JsonKey(
      name: "end_datetime",
      fromJson: DateTimeUtils.fromRfc3339,
      toJson: DateTimeUtils.toRfc3339)
  DateTime? endDateTime;

  @JsonKey(name: "start_time", defaultValue: '')
  @ColumnInfo(name: "start_time")
  String? startTime;

  @JsonKey(name: "end_time", defaultValue: '')
  @ColumnInfo(name: "end_time")
  String? endTime;

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

  @ColumnInfo(name: 'major_name')
  @JsonKey(name: "majorName", defaultValue: "")
  String majorName;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @ColumnInfo(name: 'course_no')
  @JsonKey(name: "courseNo", defaultValue: "")
  String courseNo;

  @JsonKey(name: "teachers", defaultValue: "")
  String teachers;

  @JsonKey(name: "term", defaultValue: "")
  String term;

  @ColumnInfo(name: 'term_name')
  @JsonKey(name: "term_name", defaultValue: "")
  String termName;

  @ColumnInfo(name: 'capacity')
  @JsonKey(name: "capacity", defaultValue: 0)
  int capacity;

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

  @JsonKey(name: "comment", defaultValue: "")
  String comment;

  @JsonKey(name: "experiment", defaultValue: "")
  String experiment;

  @ColumnInfo(name: "experiment_no")
  @JsonKey(name: "experiment_no", defaultValue: "")
  String experimentNo;

  @JsonKey(name: "classroom", defaultValue: "")
  String classroom;

  @ColumnInfo(name: 'classroom_alias')
  @JsonKey(name: "classroomAlias", defaultValue: "")
  String classroomAlias;

  @ColumnInfo(name: 'start_week')
  @JsonKey(name: "startWeek", defaultValue: 0)
  int startWeek;

  @ColumnInfo(name: 'end_week')
  @JsonKey(name: "endWeek", defaultValue: 0)
  int endWeek;

  @JsonKey(name: "weekday", defaultValue: 0)
  int weekday;

  @JsonKey(name: "section", defaultValue: 0)
  int section;

  factory SemesterSchedule.emptyInstance() {
    return SemesterSchedule(
      id: '',
      username: '',
      source: SemesterScheduleSource.manual,
      startDateTime: null,
      endDateTime: null,
      type: '',
      typename: '',
      examType: '',
      collegeName: '',
      majorName: '',
      grade: '',
      name: '',
      courseNo: '',
      teachers: '',
      term: '',
      termName: '',
      capacity: 0,
      selected: 0,
      credits: 0.0,
      isLab: false,
      labLessonId: '',
      batch: 0,
      startWeek: 0,
      endWeek: 0,
      weekday: 0,
      section: 0,
      experiment: '',
      experimentNo: '',
      classroom: '',
      classroomAlias: '',
      comment: '',
    );
  }

  static List<SemesterSchedule> fromNewCourse(StudentTableVms studentTableVms,
      Activities course, String username, semester.Semester semester) {
    ArrangedLessonSearchVms lesson = studentTableVms.arrangedLessonSearchVms
        .firstWhere((e) => e.id == course.lessonId);

    List<int> getSections(int startUnit, int endUnit) {
      if (startUnit <= 0) startUnit = 1;
      if (endUnit <= 0) endUnit = 1;

      if (startUnit.isIn(1, 2)) {
        if (endUnit.isIn(1, 2)) {
          return [1];
        } else if (endUnit.isIn(3, 4)) {
          return [1, 2];
        } else if (endUnit.isIn(6, 7)) {
          return [1, 2, 3];
        } else if (endUnit.isIn(8, 9)) {
          return [1, 2, 3, 4];
        } else if (endUnit >= 10) {
          return [1, 2, 3, 4, 5];
        }
      } else if (startUnit.isIn(3, 4)) {
        if (endUnit.isIn(3, 4)) {
          return [2];
        } else if (endUnit.isIn(6, 7)) {
          return [2, 3];
        } else if (endUnit.isIn(8, 9)) {
          return [2, 3, 4];
        } else if (endUnit >= 10) {
          return [2, 3, 4, 5];
        }
      } else if (startUnit.isIn(6, 7)) {
        if (endUnit.isIn(6, 7)) {
          return [3];
        } else if (endUnit.isIn(8, 9)) {
          return [3, 4];
        } else if (endUnit >= 10) {
          return [3, 4, 5];
        }
      } else if (startUnit.isIn(8, 9)) {
        if (endUnit.isIn(8, 9)) {
          return [4];
        } else if (endUnit >= 10) {
          return [4, 5];
        }
      } else if (startUnit >= 10) {
        return [5];
      }

      return [1];
    }

    List<SemesterSchedule> getSemesterSchedule(int weekStart, int weekEnd) {
      final sections =
          getSections(course.startUnit.toInt(), course.endUnit.toInt());

      final isLab = course.lessonId < 0;
      return sections
          .map((section) => SemesterSchedule(
              id: course.lessonId.toString() +
                  "_${weekStart}_${weekEnd}_${course.weekday}_${section}",
              username: username,
              source: SemesterScheduleSource.bkjwtest,
              updateTime: DateTime.now(),
              startTime: course.startTime,
              endTime: course.endTime,
              type: course.courseType?.code ?? '',
              typename: course.courseType?.name ?? '',
              examType: lesson.examMode?.name ?? '',
              collegeName: studentTableVms.department,
              majorName: studentTableVms.major,
              grade: studentTableVms.grade,
              name: course.courseName,
              courseNo: course.lessonCode,
              teachers: course.teachers.join(', '),
              term: semester.id.toString(),
              termName: semester.name,
              capacity: course.limitCount.toInt(),
              selected: course.stdCount.toInt(),
              credits: course.credits ?? 0,
              isLab: isLab,
              labLessonId: isLab ? course.lessonId.toString() : '',
              batch: 0,
              startWeek: weekStart,
              endWeek: weekEnd,
              weekday: course.weekday.toInt(),
              section: section,
              experiment: isLab ? course.projectName : '',
              experimentNo: isLab ? course.projectCode : '',
              classroom: !isLab ? (course.room ?? "") : course.roomDescribe,
              classroomAlias:
                  !isLab ? (course.building ?? "") : (course.room ?? ""),
              comment: course.lessonRemark ?? ""))
          .toList();
    }

    final weekRangeList = mergeWeeks(course.weekIndexes);
    try {
      return weekRangeList
          .map((e) => getSemesterSchedule(e.weekStart, e.weekEnd))
          .expand((e) => e)
          .toList();
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  factory SemesterSchedule.fromExamSchedule(ExamSchedule schedule) {
    var section = schedule.section;
    if (section < 1) section = 1;
    if (section > 5) section = 5;
    final datetimeFormat = DateFormat("HH:mm");
    return SemesterSchedule(
      id: schedule.id,
      username: schedule.username,
      source: SemesterScheduleSource.bkjwtest_exam_schedule,
      startDateTime: schedule.startTime,
      endDateTime: schedule.endTime,
      startTime: datetimeFormat.format(schedule.startTime!.toLocal()),
      endTime: datetimeFormat.format(schedule.endTime!.toLocal()),
      updateTime: DateTime.now(),
      type: "",
      typename: "",
      examType: schedule.tag,
      collegeName: "",
      majorName: "",
      grade: "",
      name: schedule.course,
      courseNo: "",
      teachers: "",
      term: "",
      termName: "",
      capacity: 0,
      selected: 0,
      credits: 0,
      isLab: false,
      labLessonId: "",
      batch: 0,
      startWeek: schedule.week!,
      endWeek: schedule.week!,
      weekday: schedule.weekday,
      section: section,
      experiment: "",
      experimentNo: '',
      classroom: schedule.room,
      classroomAlias: schedule.campus + schedule.building,
      comment: schedule.status,
    );
  }

  static (String, String) getTimeBySection(int rawSection) {
    if (rawSection < 1) rawSection = 1;
    if (rawSection > 6) rawSection = 6;
    switch (rawSection) {
      case 1:
        return ("08:25", "10:00");
      case 2:
        return ("10:25", "12:00");
      case 3:
        return ("14:30", "16:05");
      case 4:
        return ("16:30", "18:05");
      case 5:
        return ("19:30", "21:10");
      case 6:
        return ("21:20", "22:05");
    }
    throw Exception("GetTimeBySection Error");
  }

  factory SemesterSchedule.fromCourse(OldCourse course, String username) {
    int rawSection = int.parse(course.seq);
    var section = rawSection;
    if (section < 1) section = 1;
    if (section > 5) section = 5;

    final (satrtTime, endTime) = getTimeBySection(rawSection);

    return SemesterSchedule(
        id: course.id.toString(),
        username: username,
        source: SemesterScheduleSource.bkjw,
        updateTime: DateTime.now(),
        type: course.ctype,
        typename: course.tname,
        examType: course.examt,
        startTime: satrtTime,
        endTime: endTime,
        collegeName: course.dptname ?? "",
        majorName: course.spname,
        grade: course.grade,
        name: course.cname,
        courseNo: course.courseno,
        teachers: course.name,
        term: course.term,
        termName: course.term,
        capacity: course.maxcnt,
        selected: course.sctcnt,
        credits: course.xf,
        isLab: false,
        labLessonId: "",
        batch: 0,
        startWeek: course.startweek,
        endWeek: course.endweek,
        weekday: course.week,
        section: section,
        experiment: "",
        experimentNo: '',
        classroom: course.croomno ?? "",
        classroomAlias: "",
        comment: course.comm ?? "");
  }

  factory SemesterSchedule.fromLabCourse(CourseLab course, String username) {
    int rawSection = course.jc;
    var section = rawSection;
    if (section < 1) section = 1;
    if (section > 5) section = 5;

    final (satrtTime, endTime) = getTimeBySection(rawSection);

    return SemesterSchedule(
        id: course.xh,
        source: SemesterScheduleSource.bkjw,
        username: username,
        updateTime: DateTime.now(),
        type: "",
        typename: "",
        examType: "",
        collegeName: "",
        startTime: satrtTime,
        endTime: endTime,
        majorName: course.spname,
        grade: course.grade,
        name: course.cname,
        courseNo: course.labid,
        teachers: course.name,
        term: course.term,
        termName: course.term,
        capacity: course.persons,
        selected: course.stusct,
        credits: 0,
        isLab: true,
        labLessonId: course.xh,
        batch: course.bno,
        startWeek: course.zc,
        endWeek: course.zc,
        weekday: course.xq,
        section: section,
        experiment: course.itemname,
        experimentNo: "",
        classroom: course.srdd,
        classroomAlias: course.srname,
        comment: course.comm ?? "");
  }

  factory SemesterSchedule.fromJson(Map<String, dynamic> json) =>
      _$SemesterScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterScheduleToJson(this);

  @override
  List<Object?> get props => _$props;
}

@Deprecated('Old system')
List<SemesterSchedule> generateSemesterSchedule(
    List<OldCourse> courses, List<CourseLab> labs, String username) {
  final list1 = courses.map((e) {
    return SemesterSchedule.fromCourse(e, username);
  });
  final list2 = labs.map((e) {
    return SemesterSchedule.fromLabCourse(e, username);
  });
  return [...list1, ...list2];
}

List<SemesterSchedule> generateSystem2SemesterSchedule(
    List<OldCourse> courses, String username) {
  final list1 = courses.map((e) {
    return SemesterSchedule.fromCourse(e, username);
  }).toList();
  return list1;
}

List<SemesterSchedule> generateSemesterScheduleNew(
    NewSchedule schedule, String username, semester.Semester semester) {
  return schedule.studentTableVms[0].activities
      .map((e) => SemesterSchedule.fromNewCourse(
          schedule.studentTableVms[0], e, username, semester))
      .expand((element) => element)
      .toList();
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

class SemesterScheduleSource {
  static const String system = 'system';
  static const String user = 'user';

  static const String bkjw = 'bkjw';
  static const String bkjwtest = 'bkjwtest';
  static const String bkjwtest_exam_schedule = 'bkjwtest_exam_schedule';
  static const String manual = 'manual';

  static String toSystemAndUser(String source) =>
      source == manual ? user : system;
}
