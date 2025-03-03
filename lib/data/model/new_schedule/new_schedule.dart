import 'package:json_annotation/json_annotation.dart';

import '../new_course_lesson/new_course_lesson.dart';

part 'new_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class NewSchedule {
  NewSchedule({required this.studentTableVms});

  @JsonKey(name: "studentTableVms", defaultValue: [])
  List<StudentTableVms> studentTableVms;

  factory NewSchedule.fromJson(Map<String, dynamic> json) =>
      _$NewScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$NewScheduleToJson(this);

  factory NewSchedule.emptyInstance() => NewSchedule(studentTableVms: []);
}

@JsonSerializable(explicitToJson: true)
class CourseType {
  CourseType(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.creditsCourse,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "creditsCourse", defaultValue: false)
  bool creditsCourse;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory CourseType.fromJson(Map<String, dynamic> json) =>
      _$CourseTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTypeToJson(this);

  factory CourseType.emptyInstance() => CourseType(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "",
      creditsCourse: false);
}

@JsonSerializable(explicitToJson: true)
class PeriodInfo {
  PeriodInfo(
      {required this.total,
      required this.weeks,
      required this.theory,
      required this.theoryUnit,
      required this.requireTheory,
      this.practice,
      this.practiceUnit,
      this.requirePractice,
      this.focusPractice,
      this.focusPracticeUnit,
      this.dispersedPractice,
      this.test,
      this.testUnit,
      this.requireTest,
      this.experiment,
      this.experimentUnit,
      this.requireExperiment,
      this.machine,
      this.machineUnit,
      this.requireMachine,
      this.design,
      this.designUnit,
      this.requireDesign,
      required this.periodsPerWeek,
      this.extra,
      this.extraUnit,
      this.requireExtra});

  @JsonKey(name: "total", defaultValue: 0)
  num total;

  @JsonKey(name: "weeks", defaultValue: 0.0)
  double weeks;

  @JsonKey(name: "theory", defaultValue: 0)
  num theory;

  @JsonKey(name: "theoryUnit", defaultValue: "")
  String theoryUnit;

  @JsonKey(name: "requireTheory", defaultValue: 0)
  num requireTheory;

  @JsonKey(name: "practice")
  dynamic practice;

  @JsonKey(name: "practiceUnit")
  dynamic practiceUnit;

  @JsonKey(name: "requirePractice")
  dynamic requirePractice;

  @JsonKey(name: "focusPractice")
  dynamic focusPractice;

  @JsonKey(name: "focusPracticeUnit")
  dynamic focusPracticeUnit;

  @JsonKey(name: "dispersedPractice")
  dynamic dispersedPractice;

  @JsonKey(name: "test")
  dynamic test;

  @JsonKey(name: "testUnit")
  dynamic testUnit;

  @JsonKey(name: "requireTest")
  dynamic requireTest;

  @JsonKey(name: "experiment")
  dynamic experiment;

  @JsonKey(name: "experimentUnit")
  dynamic experimentUnit;

  @JsonKey(name: "requireExperiment")
  dynamic requireExperiment;

  @JsonKey(name: "machine")
  dynamic machine;

  @JsonKey(name: "machineUnit")
  dynamic machineUnit;

  @JsonKey(name: "requireMachine")
  dynamic requireMachine;

  @JsonKey(name: "design")
  dynamic design;

  @JsonKey(name: "designUnit")
  dynamic designUnit;

  @JsonKey(name: "requireDesign")
  dynamic requireDesign;

  @JsonKey(name: "periodsPerWeek", defaultValue: 0)
  num periodsPerWeek;

  @JsonKey(name: "extra")
  dynamic extra;

  @JsonKey(name: "extraUnit")
  dynamic extraUnit;

  @JsonKey(name: "requireExtra")
  dynamic requireExtra;

  factory PeriodInfo.fromJson(Map<String, dynamic> json) =>
      _$PeriodInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodInfoToJson(this);

  factory PeriodInfo.emptyInstance() => PeriodInfo(
      total: 0,
      weeks: 0,
      theory: 0,
      theoryUnit: "",
      requireTheory: 0,
      periodsPerWeek: 0);
}

@JsonSerializable(explicitToJson: true)
class Activities {
  Activities({
    required this.lessonId,
    required this.lessonCode,
    required this.lessonName,
    this.courseCode,
    required this.courseName,
    required this.weeksStr,
    required this.weekIndexes,
    this.room,
    this.building,
    this.campus,
    required this.weekday,
    required this.startUnit,
    required this.endUnit,
    required this.startUnitName,
    required this.endUnitName,
    this.lessonRemark,
    required this.teachers,
    this.courseType,
    this.credits,
    this.periodInfo,
    required this.stdCount,
    required this.limitCount,
    required this.startTime,
    required this.endTime,
    this.groupNum,
    this.semesterId,
    this.taskPeopleNum,
    required this.roomDescribe,
    required this.projectName,
    required this.projectCode,
  });

  @JsonKey(name: "lessonId", defaultValue: 0)
  num lessonId;

  @JsonKey(name: "lessonCode", defaultValue: "")
  String lessonCode;

  @JsonKey(name: "lessonName", defaultValue: "")
  String lessonName;

  @JsonKey(name: "courseCode")
  String? courseCode;

  @JsonKey(name: "courseName", defaultValue: "")
  String courseName;

  @JsonKey(name: "weeksStr", defaultValue: "")
  String weeksStr;

  @JsonKey(name: "weekIndexes", defaultValue: [])
  List<int> weekIndexes;

  @JsonKey(name: "room")
  String? room;

  @JsonKey(name: "building")
  String? building;

  @JsonKey(name: "campus")
  String? campus;

  @JsonKey(name: "weekday", defaultValue: 0)
  num weekday;

  @JsonKey(name: "startUnit", defaultValue: 0)
  num startUnit;

  @JsonKey(name: "endUnit", defaultValue: 0)
  num endUnit;

  @JsonKey(name: "startUnitName", defaultValue: 0)
  num startUnitName;

  @JsonKey(name: "endUnitName", defaultValue: 0)
  num endUnitName;

  @JsonKey(name: "lessonRemark")
  String? lessonRemark;

  @JsonKey(name: "teachers", defaultValue: [])
  List<String> teachers;

  @JsonKey(name: "courseType")
  CourseType? courseType;

  @JsonKey(name: "credits")
  double? credits;

  @JsonKey(name: "periodInfo")
  PeriodInfo? periodInfo;

  @JsonKey(name: "stdCount", defaultValue: 0)
  num stdCount;

  @JsonKey(name: "limitCount", defaultValue: 0)
  num limitCount;

  @JsonKey(name: "startTime", defaultValue: "")
  String startTime;

  @JsonKey(name: "endTime", defaultValue: "")
  String endTime;

  @JsonKey(name: "groupNum")
  dynamic groupNum;

  @JsonKey(name: "semesterId")
  num? semesterId;

  @JsonKey(name: "taskPeopleNum")
  dynamic taskPeopleNum;

  @JsonKey(name: "roomDescribe", defaultValue: "")
  String roomDescribe;

  @JsonKey(name: "projectName", defaultValue: "")
  String projectName;

  @JsonKey(name: "projectCode", defaultValue: "")
  String projectCode;

  @JsonKey(name: "lesson", defaultValue: null)
  NewCourseLesson? lesson;

  factory Activities.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitiesToJson(this);

  factory Activities.emptyInstance() => Activities(
      lessonId: 0,
      lessonCode: "",
      lessonName: "",
      courseName: "",
      weeksStr: "",
      weekIndexes: [],
      weekday: 0,
      startUnit: 0,
      endUnit: 0,
      startUnitName: 0,
      endUnitName: 0,
      teachers: [],
      stdCount: 0,
      limitCount: 0,
      startTime: "",
      endTime: "",
      roomDescribe: "",
      projectCode: "",
      projectName: "");
}

@JsonSerializable(explicitToJson: true)
class RequiredPeriodInfo {
  RequiredPeriodInfo(
      {required this.total,
      required this.weeks,
      required this.theory,
      required this.theoryUnit,
      required this.requireTheory,
      this.practice,
      this.practiceUnit,
      required this.requirePractice,
      required this.focusPractice,
      required this.focusPracticeUnit,
      this.dispersedPractice,
      this.test,
      this.testUnit,
      this.requireTest,
      this.experiment,
      this.experimentUnit,
      this.requireExperiment,
      this.machine,
      this.machineUnit,
      this.requireMachine,
      this.design,
      this.designUnit,
      this.requireDesign,
      required this.periodsPerWeek,
      this.extra,
      this.extraUnit,
      this.requireExtra});

  @JsonKey(name: "total", defaultValue: 0)
  num total;

  @JsonKey(name: "weeks", defaultValue: 0.0)
  double weeks;

  @JsonKey(name: "theory", defaultValue: 0)
  num theory;

  @JsonKey(name: "theoryUnit", defaultValue: "")
  String theoryUnit;

  @JsonKey(name: "requireTheory", defaultValue: 0)
  num requireTheory;

  @JsonKey(name: "practice")
  dynamic practice;

  @JsonKey(name: "practiceUnit")
  dynamic practiceUnit;

  @JsonKey(name: "requirePractice", defaultValue: 0)
  num requirePractice;

  @JsonKey(name: "focusPractice", defaultValue: 0)
  num focusPractice;

  @JsonKey(name: "focusPracticeUnit", defaultValue: "")
  String focusPracticeUnit;

  @JsonKey(name: "dispersedPractice")
  dynamic dispersedPractice;

  @JsonKey(name: "test")
  dynamic test;

  @JsonKey(name: "testUnit")
  dynamic testUnit;

  @JsonKey(name: "requireTest")
  dynamic requireTest;

  @JsonKey(name: "experiment")
  dynamic experiment;

  @JsonKey(name: "experimentUnit")
  dynamic experimentUnit;

  @JsonKey(name: "requireExperiment")
  dynamic requireExperiment;

  @JsonKey(name: "machine")
  dynamic machine;

  @JsonKey(name: "machineUnit")
  dynamic machineUnit;

  @JsonKey(name: "requireMachine")
  dynamic requireMachine;

  @JsonKey(name: "design")
  dynamic design;

  @JsonKey(name: "designUnit")
  dynamic designUnit;

  @JsonKey(name: "requireDesign")
  dynamic requireDesign;

  @JsonKey(name: "periodsPerWeek", defaultValue: 0)
  num periodsPerWeek;

  @JsonKey(name: "extra")
  dynamic extra;

  @JsonKey(name: "extraUnit")
  dynamic extraUnit;

  @JsonKey(name: "requireExtra")
  dynamic requireExtra;

  factory RequiredPeriodInfo.fromJson(Map<String, dynamic> json) =>
      _$RequiredPeriodInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RequiredPeriodInfoToJson(this);

  factory RequiredPeriodInfo.emptyInstance() => RequiredPeriodInfo(
      total: 0,
      weeks: 0,
      theory: 0,
      theoryUnit: "",
      requireTheory: 0,
      requirePractice: 0,
      focusPractice: 0,
      focusPracticeUnit: "",
      periodsPerWeek: 0);
}

@JsonSerializable(explicitToJson: true)
class DateTimeText {
  DateTimeText(
      {required this.textZh, required this.textEn, required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;

  factory DateTimeText.fromJson(Map<String, dynamic> json) =>
      _$DateTimeTextFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeTextToJson(this);

  factory DateTimeText.emptyInstance() =>
      DateTimeText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class DateTimePlaceText {
  DateTimePlaceText(
      {required this.textZh, required this.textEn, required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;

  factory DateTimePlaceText.fromJson(Map<String, dynamic> json) =>
      _$DateTimePlaceTextFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimePlaceTextToJson(this);

  factory DateTimePlaceText.emptyInstance() =>
      DateTimePlaceText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class DateTimePlacePersonText {
  DateTimePlacePersonText(
      {required this.textZh, required this.textEn, required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;

  factory DateTimePlacePersonText.fromJson(Map<String, dynamic> json) =>
      _$DateTimePlacePersonTextFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimePlacePersonTextToJson(this);

  factory DateTimePlacePersonText.emptyInstance() =>
      DateTimePlacePersonText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class RoomSeatText {
  RoomSeatText(
      {required this.textZh, required this.textEn, required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;

  factory RoomSeatText.fromJson(Map<String, dynamic> json) =>
      _$RoomSeatTextFromJson(json);

  Map<String, dynamic> toJson() => _$RoomSeatTextToJson(this);

  factory RoomSeatText.emptyInstance() =>
      RoomSeatText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class ScheduleText {
  ScheduleText(
      {required this.dateTimeText,
      required this.dateTimePlaceText,
      required this.dateTimePlacePersonText,
      required this.roomSeatText});

  @JsonKey(name: "dateTimeText", defaultValue: DateTimeText.emptyInstance)
  DateTimeText dateTimeText;

  @JsonKey(
      name: "dateTimePlaceText", defaultValue: DateTimePlaceText.emptyInstance)
  DateTimePlaceText dateTimePlaceText;

  @JsonKey(
      name: "dateTimePlacePersonText",
      defaultValue: DateTimePlacePersonText.emptyInstance)
  DateTimePlacePersonText dateTimePlacePersonText;

  @JsonKey(name: "roomSeatText", defaultValue: RoomSeatText.emptyInstance)
  RoomSeatText roomSeatText;

  factory ScheduleText.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTextFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleTextToJson(this);

  factory ScheduleText.emptyInstance() => ScheduleText(
      dateTimeText: DateTimeText.emptyInstance(),
      dateTimePlaceText: DateTimePlaceText.emptyInstance(),
      dateTimePlacePersonText: DateTimePlacePersonText.emptyInstance(),
      roomSeatText: RoomSeatText.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class TimeTableLayout {
  TimeTableLayout(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.enabled,
      this.changeMonth,
      this.changeDayOfMonth});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "changeMonth")
  dynamic changeMonth;

  @JsonKey(name: "changeDayOfMonth")
  dynamic changeDayOfMonth;

  factory TimeTableLayout.fromJson(Map<String, dynamic> json) =>
      _$TimeTableLayoutFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTableLayoutToJson(this);

  factory TimeTableLayout.emptyInstance() =>
      TimeTableLayout(id: 0, nameZh: "", nameEn: "", enabled: false);
}

@JsonSerializable(explicitToJson: true)
class BizType {
  BizType({required this.id, required this.nameZh, required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  factory BizType.fromJson(Map<String, dynamic> json) =>
      _$BizTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BizTypeToJson(this);

  factory BizType.emptyInstance() => BizType(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class Calendar {
  Calendar({required this.id, required this.nameZh, this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarToJson(this);

  factory Calendar.emptyInstance() => Calendar(id: 0, nameZh: "");
}

@JsonSerializable(explicitToJson: true)
class Semester {
  Semester(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.calendar,
      required this.schoolYear,
      required this.startDate,
      required this.endDate,
      required this.weekStartOnSunday,
      required this.countInTerm,
      required this.season,
      required this.enabled,
      this.fileInfo});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "calendar", defaultValue: Calendar.emptyInstance)
  Calendar calendar;

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

  @JsonKey(name: "fileInfo")
  dynamic fileInfo;

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);

  factory Semester.emptyInstance() => Semester(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      calendar: Calendar.emptyInstance(),
      schoolYear: "",
      startDate: "",
      endDate: "",
      weekStartOnSunday: false,
      countInTerm: false,
      season: "",
      enabled: false);
}

@JsonSerializable(explicitToJson: true)
class StageInfo {
  StageInfo({required this.stage, this.stageNum, this.stageGrantNum});

  @JsonKey(name: "stage", defaultValue: false)
  bool stage;

  @JsonKey(name: "stageNum")
  dynamic stageNum;

  @JsonKey(name: "stageGrantNum")
  dynamic stageGrantNum;

  factory StageInfo.fromJson(Map<String, dynamic> json) =>
      _$StageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StageInfoToJson(this);

  factory StageInfo.emptyInstance() => StageInfo(stage: false);
}

@JsonSerializable(explicitToJson: true)
class Education {
  Education(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);

  factory Education.emptyInstance() => Education(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class DefaultOpenDepart {
  DefaultOpenDepart(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory DefaultOpenDepart.fromJson(Map<String, dynamic> json) =>
      _$DefaultOpenDepartFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultOpenDepartToJson(this);

  factory DefaultOpenDepart.emptyInstance() => DefaultOpenDepart(
      id: 0,
      nameZh: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class DefaultExamMode {
  DefaultExamMode(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory DefaultExamMode.fromJson(Map<String, dynamic> json) =>
      _$DefaultExamModeFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultExamModeToJson(this);

  factory DefaultExamMode.emptyInstance() => DefaultExamMode(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class BelongBizType {
  BelongBizType({required this.id, required this.nameZh, required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  factory BelongBizType.fromJson(Map<String, dynamic> json) =>
      _$BelongBizTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BelongBizTypeToJson(this);

  factory BelongBizType.emptyInstance() =>
      BelongBizType(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class SuitableBizTypes {
  SuitableBizTypes(
      {required this.id, required this.nameZh, required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  factory SuitableBizTypes.fromJson(Map<String, dynamic> json) =>
      _$SuitableBizTypesFromJson(json);

  Map<String, dynamic> toJson() => _$SuitableBizTypesToJson(this);

  factory SuitableBizTypes.emptyInstance() =>
      SuitableBizTypes(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class MngtDepartment {
  MngtDepartment(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory MngtDepartment.fromJson(Map<String, dynamic> json) =>
      _$MngtDepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$MngtDepartmentToJson(this);

  factory MngtDepartment.emptyInstance() => MngtDepartment(
      id: 0,
      nameZh: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class TeachLang {
  TeachLang(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory TeachLang.fromJson(Map<String, dynamic> json) =>
      _$TeachLangFromJson(json);

  Map<String, dynamic> toJson() => _$TeachLangToJson(this);

  factory TeachLang.emptyInstance() => TeachLang(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Course {
  Course(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.periodInfo,
      required this.stageInfo,
      required this.credits,
      required this.calculateGp,
      required this.theory,
      required this.experiment,
      required this.practice,
      required this.test,
      required this.machine,
      required this.design,
      required this.extra,
      required this.enabled,
      this.extraCredits,
      this.remark,
      required this.flags,
      this.flag,
      this.platformLink,
      this.claim,
      required this.allowMakeUp,
      required this.allowDelay,
      required this.education,
      required this.courseType,
      required this.defaultOpenDepart,
      this.grantCourseLevel,
      required this.defaultExamMode,
      required this.defaultPreCourses,
      required this.belongBizType,
      required this.suitableBizTypes,
      required this.mngtDepartment,
      required this.teachLang,
      required this.minorCourses,
      this.tags,
      required this.lessonType,
      required this.seasons,
      required this.suitMajors,
      this.courseTaxon,
      this.courseProperty,
      this.openResearchDepartment,
      this.defaultOpenMajor,
      this.courseManager,
      this.courseSpec,
      this.professor,
      required this.textbooks,
      required this.courseLevelRequireList,
      required this.defaultPreCourseList,
      this.teachType});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "periodInfo", defaultValue: PeriodInfo.emptyInstance)
  PeriodInfo periodInfo;

  @JsonKey(name: "stageInfo", defaultValue: StageInfo.emptyInstance)
  StageInfo stageInfo;

  @JsonKey(name: "credits", defaultValue: 0)
  double? credits;

  @JsonKey(name: "calculateGp", defaultValue: false)
  bool calculateGp;

  @JsonKey(name: "theory", defaultValue: false)
  bool theory;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "practice", defaultValue: false)
  bool practice;

  @JsonKey(name: "test", defaultValue: false)
  bool test;

  @JsonKey(name: "machine", defaultValue: false)
  bool machine;

  @JsonKey(name: "design", defaultValue: false)
  bool design;

  @JsonKey(name: "extra", defaultValue: false)
  bool extra;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "extraCredits")
  double? extraCredits;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "flags", defaultValue: [])
  List flags;

  @JsonKey(name: "flag")
  dynamic flag;

  @JsonKey(name: "platformLink")
  dynamic platformLink;

  @JsonKey(name: "claim")
  dynamic claim;

  @JsonKey(name: "allowMakeUp", defaultValue: false)
  bool allowMakeUp;

  @JsonKey(name: "allowDelay", defaultValue: false)
  bool allowDelay;

  @JsonKey(name: "education", defaultValue: Education.emptyInstance)
  Education education;

  @JsonKey(name: "courseType", defaultValue: CourseType.emptyInstance)
  CourseType courseType;

  @JsonKey(
      name: "defaultOpenDepart", defaultValue: DefaultOpenDepart.emptyInstance)
  DefaultOpenDepart defaultOpenDepart;

  @JsonKey(name: "grantCourseLevel")
  dynamic grantCourseLevel;

  @JsonKey(name: "defaultExamMode", defaultValue: DefaultExamMode.emptyInstance)
  DefaultExamMode defaultExamMode;

  @JsonKey(name: "defaultPreCourses", defaultValue: [])
  List defaultPreCourses;

  @JsonKey(name: "belongBizType", defaultValue: BelongBizType.emptyInstance)
  BelongBizType belongBizType;

  @JsonKey(name: "suitableBizTypes", defaultValue: [])
  List<SuitableBizTypes> suitableBizTypes;

  @JsonKey(name: "mngtDepartment", defaultValue: MngtDepartment.emptyInstance)
  MngtDepartment mngtDepartment;

  @JsonKey(name: "teachLang", defaultValue: TeachLang.emptyInstance)
  TeachLang teachLang;

  @JsonKey(name: "minorCourses", defaultValue: [])
  List minorCourses;

  @JsonKey(name: "tags")
  dynamic tags;

  @JsonKey(name: "lessonType", defaultValue: "")
  String lessonType;

  @JsonKey(name: "seasons", defaultValue: [])
  List seasons;

  @JsonKey(name: "suitMajors", defaultValue: [])
  List suitMajors;

  @JsonKey(name: "courseTaxon")
  dynamic courseTaxon;

  @JsonKey(name: "courseProperty")
  dynamic courseProperty;

  @JsonKey(name: "openResearchDepartment")
  dynamic openResearchDepartment;

  @JsonKey(name: "defaultOpenMajor")
  dynamic defaultOpenMajor;

  @JsonKey(name: "courseManager")
  dynamic courseManager;

  @JsonKey(name: "courseSpec")
  dynamic courseSpec;

  @JsonKey(name: "professor")
  dynamic professor;

  @JsonKey(name: "textbooks", defaultValue: [])
  List textbooks;

  @JsonKey(name: "courseLevelRequireList", defaultValue: [])
  List courseLevelRequireList;

  @JsonKey(name: "defaultPreCourseList", defaultValue: [])
  List defaultPreCourseList;

  @JsonKey(name: "teachType")
  dynamic teachType;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  factory Course.emptyInstance() => Course(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      periodInfo: PeriodInfo.emptyInstance(),
      stageInfo: StageInfo.emptyInstance(),
      credits: 0,
      calculateGp: false,
      theory: false,
      experiment: false,
      practice: false,
      test: false,
      machine: false,
      design: false,
      extra: false,
      enabled: false,
      flags: [],
      allowMakeUp: false,
      allowDelay: false,
      education: Education.emptyInstance(),
      courseType: CourseType.emptyInstance(),
      defaultOpenDepart: DefaultOpenDepart.emptyInstance(),
      defaultExamMode: DefaultExamMode.emptyInstance(),
      defaultPreCourses: [],
      belongBizType: BelongBizType.emptyInstance(),
      suitableBizTypes: [],
      mngtDepartment: MngtDepartment.emptyInstance(),
      teachLang: TeachLang.emptyInstance(),
      minorCourses: [],
      lessonType: "",
      seasons: [],
      suitMajors: [],
      textbooks: [],
      courseLevelRequireList: [],
      defaultPreCourseList: []);
}

@JsonSerializable(explicitToJson: true)
class OpenDepartment {
  OpenDepartment(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory OpenDepartment.fromJson(Map<String, dynamic> json) =>
      _$OpenDepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$OpenDepartmentToJson(this);

  factory OpenDepartment.emptyInstance() => OpenDepartment(
      id: 0,
      nameZh: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class ScheduleAssignDepartment {
  ScheduleAssignDepartment(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory ScheduleAssignDepartment.fromJson(Map<String, dynamic> json) =>
      _$ScheduleAssignDepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleAssignDepartmentToJson(this);

  factory ScheduleAssignDepartment.emptyInstance() => ScheduleAssignDepartment(
      id: 0,
      nameZh: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class ExamMode {
  ExamMode(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory ExamMode.fromJson(Map<String, dynamic> json) =>
      _$ExamModeFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModeToJson(this);

  factory ExamMode.emptyInstance() => ExamMode(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class CourseProperty {
  CourseProperty(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.delayedExam,
      required this.makeUpExam,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "delayedExam", defaultValue: false)
  bool delayedExam;

  @JsonKey(name: "makeUpExam", defaultValue: false)
  bool makeUpExam;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory CourseProperty.fromJson(Map<String, dynamic> json) =>
      _$CoursePropertyFromJson(json);

  Map<String, dynamic> toJson() => _$CoursePropertyToJson(this);

  factory CourseProperty.emptyInstance() => CourseProperty(
      nameZh: "",
      nameEn: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      delayedExam: false,
      makeUpExam: false,
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class Campus {
  Campus(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.enabled});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);

  Map<String, dynamic> toJson() => _$CampusToJson(this);

  factory Campus.emptyInstance() =>
      Campus(id: 0, nameZh: "", nameEn: "", code: "", enabled: false);
}

@JsonSerializable(explicitToJson: true)
class Department {
  Department(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.abbrZh,
      this.abbrEn,
      required this.college,
      required this.research,
      required this.openCourse,
      required this.experiment,
      this.telephone,
      this.address,
      required this.indexNo,
      required this.recruitTypeSet,
      required this.recruitTypes});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "abbrZh", defaultValue: "")
  String abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "college", defaultValue: false)
  bool college;

  @JsonKey(name: "research", defaultValue: false)
  bool research;

  @JsonKey(name: "openCourse", defaultValue: false)
  bool openCourse;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "telephone")
  dynamic telephone;

  @JsonKey(name: "address")
  dynamic address;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

  factory Department.emptyInstance() => Department(
      id: 0,
      nameZh: "",
      code: "",
      abbrZh: "",
      college: false,
      research: false,
      openCourse: false,
      experiment: false,
      indexNo: 0,
      recruitTypeSet: [],
      recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class Person {
  Person({required this.id, required this.nameZh, required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  factory Person.emptyInstance() => Person(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class Teacher {
  Teacher(
      {required this.id,
      required this.code,
      required this.teaching,
      required this.zaiZhi,
      required this.hireType,
      this.researchDirection,
      this.belongSeries,
      this.nameZh,
      required this.department,
      this.researchDepartment,
      required this.person,
      this.title,
      this.type,
      this.major,
      this.preEducation,
      this.degreeType});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "teaching", defaultValue: false)
  bool teaching;

  @JsonKey(name: "zaiZhi", defaultValue: false)
  bool zaiZhi;

  @JsonKey(name: "hireType", defaultValue: "")
  String hireType;

  @JsonKey(name: "researchDirection")
  dynamic researchDirection;

  @JsonKey(name: "belongSeries")
  dynamic belongSeries;

  @JsonKey(name: "nameZh")
  dynamic nameZh;

  @JsonKey(name: "department", defaultValue: Department.emptyInstance)
  Department department;

  @JsonKey(name: "researchDepartment")
  dynamic researchDepartment;

  @JsonKey(name: "person", defaultValue: Person.emptyInstance)
  Person person;

  @JsonKey(name: "title")
  dynamic title;

  @JsonKey(name: "type")
  dynamic type;

  @JsonKey(name: "major")
  dynamic major;

  @JsonKey(name: "preEducation")
  dynamic preEducation;

  @JsonKey(name: "degreeType")
  dynamic degreeType;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  factory Teacher.emptyInstance() => Teacher(
      id: 0,
      code: "",
      teaching: false,
      zaiZhi: false,
      hireType: "",
      department: Department.emptyInstance(),
      person: Person.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class TeacherAssignmentList {
  TeacherAssignmentList(
      {required this.teacher,
      required this.person,
      required this.role,
      required this.indexNo,
      this.age});

  @JsonKey(name: "teacher", defaultValue: Teacher.emptyInstance)
  Teacher teacher;

  @JsonKey(name: "person", defaultValue: Person.emptyInstance)
  Person person;

  @JsonKey(name: "role", defaultValue: "")
  String role;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "age")
  dynamic age;

  factory TeacherAssignmentList.fromJson(Map<String, dynamic> json) =>
      _$TeacherAssignmentListFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherAssignmentListToJson(this);

  factory TeacherAssignmentList.emptyInstance() => TeacherAssignmentList(
      teacher: Teacher.emptyInstance(),
      person: Person.emptyInstance(),
      role: "",
      indexNo: 0);
}

@JsonSerializable(explicitToJson: true)
class AdminclassVms {
  AdminclassVms(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.grade,
      required this.stdCount,
      required this.planCount,
      required this.enabled,
      this.abbrZh,
      this.abbrEn,
      this.remark});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "stdCount", defaultValue: 0)
  num stdCount;

  @JsonKey(name: "planCount", defaultValue: 0)
  num planCount;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "abbrZh")
  dynamic abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "remark")
  dynamic remark;

  factory AdminclassVms.fromJson(Map<String, dynamic> json) =>
      _$AdminclassVmsFromJson(json);

  Map<String, dynamic> toJson() => _$AdminclassVmsToJson(this);

  factory AdminclassVms.emptyInstance() => AdminclassVms(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      grade: "",
      stdCount: 0,
      planCount: 0,
      enabled: false);
}

@JsonSerializable(explicitToJson: true)
class TeacherScheduleTextVms {
  TeacherScheduleTextVms(
      {required this.personId, this.teacherId, required this.scheduleText});

  @JsonKey(name: "personId", defaultValue: 0)
  num personId;

  @JsonKey(name: "teacherId")
  dynamic teacherId;

  @JsonKey(name: "scheduleText", defaultValue: "")
  String scheduleText;

  factory TeacherScheduleTextVms.fromJson(Map<String, dynamic> json) =>
      _$TeacherScheduleTextVmsFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherScheduleTextVmsToJson(this);

  factory TeacherScheduleTextVms.emptyInstance() =>
      TeacherScheduleTextVms(personId: 0, scheduleText: "");
}

@JsonSerializable(explicitToJson: true)
class ArrangedLessonSearchVms {
  ArrangedLessonSearchVms(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      this.remark,
      required this.requiredPeriodInfo,
      this.actualPeriods,
      required this.scheduleText,
      required this.stdCount,
      required this.limitCount,
      this.retakeCount,
      required this.reserveCount,
      required this.suggestScheduleWeeks,
      required this.calcRelatedAdminclasses,
      this.adminclassSetup,
      required this.allowMakeup,
      this.allowDelay,
      this.expActualPeriods,
      required this.needAssign,
      required this.auto,
      this.scheduleRemark,
      required this.enforce,
      this.arrangeExamType,
      this.arrangeExamTypeZh,
      this.lessonKind,
      this.selectionRemark,
      required this.generateSeatNumber,
      this.midtermRetake,
      required this.actualTheoryPeriod,
      required this.actualPracticePeriod,
      required this.actualTestPeriod,
      required this.actualExperimentPeriod,
      required this.actualMachinePeriod,
      required this.actualDesignPeriod,
      required this.actualExtraPeriod,
      this.auditState,
      this.currentNode,
      this.passed,
      this.submitDate,
      required this.noAttendCount,
      this.practiceWeekScheduleText,
      this.timeTableLayout,
      this.bizType,
      this.semester,
      required this.course,
      required this.preCourses,
      this.courseType,
      this.openDepartment,
      this.scheduleAssignDepartment,
      this.scheduleState,
      this.examMode,
      this.courseProperty,
      this.campus,
      this.teachLang,
      this.roomType,
      this.suggestScheduleWeeksInfo,
      this.scheduleWeeksInfo,
      required this.teacherAssignmentList,
      this.scheduleStartWeek,
      this.scheduleEndWeek,
      this.scheduleCurrentWeek,
      required this.scheduleChangeWeeks,
      this.planExamWeek,
      required this.adminclassIds,
      this.adminClasses,
      required this.adminclassVms,
      this.minorCourse,
      this.tags,
      required this.crossBizTypes,
      required this.courseLevelRequireList,
      this.hasSchedule,
      required this.compulsorys,
      this.courseStdCount,
      required this.teacherScheduleTextVms,
      this.lessonKindText,
      this.compulsorysStr,
      this.auditLogVms,
      this.examMethod,
      this.examDuration,
      required this.teacherAssignmentString,
      required this.teacherAssignmentStr,
      required this.lessonKindZh,
      required this.lessonKindEn});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "remark")
  String? remark;

  @JsonKey(
      name: "requiredPeriodInfo",
      defaultValue: RequiredPeriodInfo.emptyInstance)
  RequiredPeriodInfo requiredPeriodInfo;

  @JsonKey(name: "actualPeriods")
  num? actualPeriods;

  @JsonKey(name: "scheduleText", defaultValue: ScheduleText.emptyInstance)
  ScheduleText scheduleText;

  @JsonKey(name: "stdCount", defaultValue: 0)
  num stdCount;

  @JsonKey(name: "limitCount", defaultValue: 0)
  num limitCount;

  @JsonKey(name: "retakeCount")
  num? retakeCount;

  @JsonKey(name: "reserveCount", defaultValue: 0)
  num reserveCount;

  @JsonKey(name: "suggestScheduleWeeks", defaultValue: [])
  List suggestScheduleWeeks;

  @JsonKey(name: "calcRelatedAdminclasses", defaultValue: false)
  bool calcRelatedAdminclasses;

  @JsonKey(name: "adminclassSetup")
  bool? adminclassSetup;

  @JsonKey(name: "allowMakeup", defaultValue: false)
  bool allowMakeup;

  @JsonKey(name: "allowDelay")
  bool? allowDelay;

  @JsonKey(name: "expActualPeriods")
  num? expActualPeriods;

  @JsonKey(name: "needAssign", defaultValue: false)
  bool needAssign;

  @JsonKey(name: "auto", defaultValue: false)
  bool auto;

  @JsonKey(name: "scheduleRemark")
  dynamic scheduleRemark;

  @JsonKey(name: "enforce", defaultValue: false)
  bool enforce;

  @JsonKey(name: "arrangeExamType")
  String? arrangeExamType;

  @JsonKey(name: "arrangeExamTypeZh")
  String? arrangeExamTypeZh;

  @JsonKey(name: "lessonKind")
  String? lessonKind;

  @JsonKey(name: "selectionRemark")
  dynamic selectionRemark;

  @JsonKey(name: "generateSeatNumber", defaultValue: false)
  bool generateSeatNumber;

  @JsonKey(name: "midtermRetake")
  bool? midtermRetake;

  @JsonKey(name: "actualTheoryPeriod", defaultValue: 0)
  num actualTheoryPeriod;

  @JsonKey(name: "actualPracticePeriod", defaultValue: 0)
  num actualPracticePeriod;

  @JsonKey(name: "actualTestPeriod", defaultValue: 0)
  num actualTestPeriod;

  @JsonKey(name: "actualExperimentPeriod", defaultValue: 0)
  num actualExperimentPeriod;

  @JsonKey(name: "actualMachinePeriod", defaultValue: 0)
  num actualMachinePeriod;

  @JsonKey(name: "actualDesignPeriod", defaultValue: 0)
  num actualDesignPeriod;

  @JsonKey(name: "actualExtraPeriod", defaultValue: 0)
  num actualExtraPeriod;

  @JsonKey(name: "auditState")
  String? auditState;

  @JsonKey(name: "currentNode")
  dynamic currentNode;

  @JsonKey(name: "passed")
  dynamic passed;

  @JsonKey(name: "submitDate")
  dynamic submitDate;

  @JsonKey(name: "noAttendCount", defaultValue: 0)
  num noAttendCount;

  @JsonKey(name: "practiceWeekScheduleText")
  dynamic practiceWeekScheduleText;

  @JsonKey(name: "timeTableLayout")
  TimeTableLayout? timeTableLayout;

  @JsonKey(name: "bizType")
  BizType? bizType;

  @JsonKey(name: "semester")
  Semester? semester;

  @JsonKey(name: "course", defaultValue: Course.emptyInstance)
  Course course;

  @JsonKey(name: "preCourses", defaultValue: [])
  List preCourses;

  @JsonKey(name: "courseType")
  CourseType? courseType;

  @JsonKey(name: "openDepartment")
  OpenDepartment? openDepartment;

  @JsonKey(name: "scheduleAssignDepartment")
  ScheduleAssignDepartment? scheduleAssignDepartment;

  @JsonKey(name: "scheduleState")
  String? scheduleState;

  @JsonKey(name: "examMode")
  ExamMode? examMode;

  @JsonKey(name: "courseProperty")
  CourseProperty? courseProperty;

  @JsonKey(name: "campus")
  Campus? campus;

  @JsonKey(name: "teachLang")
  TeachLang? teachLang;

  @JsonKey(name: "roomType")
  dynamic roomType;

  @JsonKey(name: "suggestScheduleWeeksInfo")
  String? suggestScheduleWeeksInfo;

  @JsonKey(name: "scheduleWeeksInfo")
  String? scheduleWeeksInfo;

  @JsonKey(name: "teacherAssignmentList", defaultValue: [])
  List<TeacherAssignmentList> teacherAssignmentList;

  @JsonKey(name: "scheduleStartWeek")
  num? scheduleStartWeek;

  @JsonKey(name: "scheduleEndWeek")
  num? scheduleEndWeek;

  @JsonKey(name: "scheduleCurrentWeek")
  num? scheduleCurrentWeek;

  @JsonKey(name: "scheduleChangeWeeks", defaultValue: [])
  List<num> scheduleChangeWeeks;

  @JsonKey(name: "planExamWeek")
  dynamic planExamWeek;

  @JsonKey(name: "adminclassIds", defaultValue: [])
  List<num> adminclassIds;

  @JsonKey(name: "adminClasses")
  String? adminClasses;

  @JsonKey(name: "adminclassVms", defaultValue: [])
  List<AdminclassVms> adminclassVms;

  @JsonKey(name: "minorCourse")
  dynamic minorCourse;

  @JsonKey(name: "tags")
  dynamic tags;

  @JsonKey(name: "crossBizTypes", defaultValue: [])
  List crossBizTypes;

  @JsonKey(name: "courseLevelRequireList", defaultValue: [])
  List courseLevelRequireList;

  @JsonKey(name: "hasSchedule")
  bool? hasSchedule;

  @JsonKey(name: "compulsorys", defaultValue: [])
  List<String> compulsorys;

  @JsonKey(name: "courseStdCount")
  num? courseStdCount;

  @JsonKey(name: "teacherScheduleTextVms", defaultValue: [])
  List<TeacherScheduleTextVms> teacherScheduleTextVms;

  @JsonKey(name: "lessonKindText")
  String? lessonKindText;

  @JsonKey(name: "compulsorysStr")
  String? compulsorysStr;

  @JsonKey(name: "auditLogVms")
  dynamic auditLogVms;

  @JsonKey(name: "examMethod")
  dynamic examMethod;

  @JsonKey(name: "examDuration")
  dynamic examDuration;

  @JsonKey(name: "teacherAssignmentString", defaultValue: "")
  String teacherAssignmentString;

  @JsonKey(name: "teacherAssignmentStr", defaultValue: "")
  String teacherAssignmentStr;

  @JsonKey(name: "lessonKindZh", defaultValue: "")
  String lessonKindZh;

  @JsonKey(name: "lessonKindEn", defaultValue: "")
  String lessonKindEn;

  factory ArrangedLessonSearchVms.fromJson(Map<String, dynamic> json) =>
      _$ArrangedLessonSearchVmsFromJson(json);

  Map<String, dynamic> toJson() => _$ArrangedLessonSearchVmsToJson(this);

  factory ArrangedLessonSearchVms.emptyInstance() => ArrangedLessonSearchVms(
      id: 0,
      nameZh: "",
      code: "",
      requiredPeriodInfo: RequiredPeriodInfo.emptyInstance(),
      scheduleText: ScheduleText.emptyInstance(),
      stdCount: 0,
      limitCount: 0,
      reserveCount: 0,
      suggestScheduleWeeks: [],
      calcRelatedAdminclasses: false,
      allowMakeup: false,
      needAssign: false,
      auto: false,
      enforce: false,
      generateSeatNumber: false,
      actualTheoryPeriod: 0,
      actualPracticePeriod: 0,
      actualTestPeriod: 0,
      actualExperimentPeriod: 0,
      actualMachinePeriod: 0,
      actualDesignPeriod: 0,
      actualExtraPeriod: 0,
      noAttendCount: 0,
      course: Course.emptyInstance(),
      preCourses: [],
      teacherAssignmentList: [],
      scheduleChangeWeeks: [],
      adminclassIds: [],
      adminclassVms: [],
      crossBizTypes: [],
      courseLevelRequireList: [],
      compulsorys: [],
      teacherScheduleTextVms: [],
      teacherAssignmentString: "",
      teacherAssignmentStr: "",
      lessonKindZh: "",
      lessonKindEn: "");
}

@JsonSerializable(explicitToJson: true)
class Type {
  Type(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  factory Type.emptyInstance() => Type(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class DegreeType {
  DegreeType(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<num> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<num> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory DegreeType.fromJson(Map<String, dynamic> json) =>
      _$DegreeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DegreeTypeToJson(this);

  factory DegreeType.emptyInstance() => DegreeType(
      nameZh: "",
      id: 0,
      code: "",
      enabled: false,
      bizTypeAssocs: [],
      bizTypeIds: [],
      transient: false,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class MinorCourses {
  MinorCourses(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.periodInfo,
      required this.stageInfo,
      required this.credits,
      required this.calculateGp,
      required this.theory,
      required this.experiment,
      required this.practice,
      required this.test,
      required this.machine,
      required this.design,
      required this.extra,
      required this.enabled,
      this.extraCredits,
      this.remark,
      required this.flags,
      this.flag,
      this.platformLink,
      this.claim,
      required this.allowMakeUp,
      required this.allowDelay});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "periodInfo", defaultValue: PeriodInfo.emptyInstance)
  PeriodInfo periodInfo;

  @JsonKey(name: "stageInfo", defaultValue: StageInfo.emptyInstance)
  StageInfo stageInfo;

  @JsonKey(name: "credits", defaultValue: 0)
  double credits;

  @JsonKey(name: "calculateGp", defaultValue: false)
  bool calculateGp;

  @JsonKey(name: "theory", defaultValue: false)
  bool theory;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;

  @JsonKey(name: "practice", defaultValue: false)
  bool practice;

  @JsonKey(name: "test", defaultValue: false)
  bool test;

  @JsonKey(name: "machine", defaultValue: false)
  bool machine;

  @JsonKey(name: "design", defaultValue: false)
  bool design;

  @JsonKey(name: "extra", defaultValue: false)
  bool extra;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "extraCredits")
  double? extraCredits;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "flags", defaultValue: [])
  List flags;

  @JsonKey(name: "flag")
  String? flag;

  @JsonKey(name: "platformLink")
  dynamic platformLink;

  @JsonKey(name: "claim")
  dynamic claim;

  @JsonKey(name: "allowMakeUp", defaultValue: false)
  bool allowMakeUp;

  @JsonKey(name: "allowDelay", defaultValue: false)
  bool allowDelay;

  factory MinorCourses.fromJson(Map<String, dynamic> json) =>
      _$MinorCoursesFromJson(json);

  Map<String, dynamic> toJson() => _$MinorCoursesToJson(this);

  factory MinorCourses.emptyInstance() => MinorCourses(
      id: 0,
      nameZh: "",
      nameEn: "",
      code: "",
      periodInfo: PeriodInfo.emptyInstance(),
      stageInfo: StageInfo.emptyInstance(),
      credits: 0,
      calculateGp: false,
      theory: false,
      experiment: false,
      practice: false,
      test: false,
      machine: false,
      design: false,
      extra: false,
      enabled: false,
      flags: [],
      allowMakeUp: false,
      allowDelay: false);
}

@JsonSerializable(explicitToJson: true)
class CourseUnitList {
  CourseUnitList(
      {required this.nameZh,
      required this.nameEn,
      required this.timeTableLayoutAssoc,
      required this.indexNo,
      required this.startTime,
      required this.endTime,
      required this.dayPart,
      required this.color,
      required this.changeStartTime,
      required this.changeEndTime,
      required this.segmentIndex,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "timeTableLayoutAssoc", defaultValue: 0)
  num timeTableLayoutAssoc;

  @JsonKey(name: "indexNo", defaultValue: 0)
  num indexNo;

  @JsonKey(name: "startTime", defaultValue: 0)
  num startTime;

  @JsonKey(name: "endTime", defaultValue: 0)
  num endTime;

  @JsonKey(name: "dayPart", defaultValue: "")
  String dayPart;

  @JsonKey(name: "color", defaultValue: "")
  String color;

  @JsonKey(name: "changeStartTime", defaultValue: 0)
  num changeStartTime;

  @JsonKey(name: "changeEndTime", defaultValue: 0)
  num changeEndTime;

  @JsonKey(name: "segmentIndex", defaultValue: 0)
  num segmentIndex;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory CourseUnitList.fromJson(Map<String, dynamic> json) =>
      _$CourseUnitListFromJson(json);

  Map<String, dynamic> toJson() => _$CourseUnitListToJson(this);

  factory CourseUnitList.emptyInstance() => CourseUnitList(
      nameZh: "",
      nameEn: "",
      timeTableLayoutAssoc: 0,
      indexNo: 0,
      startTime: 0,
      endTime: 0,
      dayPart: "",
      color: "",
      changeStartTime: 0,
      changeEndTime: 0,
      segmentIndex: 0,
      name: "");
}

@JsonSerializable(explicitToJson: true)
class CourseTablePrintConfigs {
  CourseTablePrintConfigs(
      {required this.nameZh, required this.nameEn, required this.unitGroup});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "unitGroup", defaultValue: [])
  List<List<num>> unitGroup;

  factory CourseTablePrintConfigs.fromJson(Map<String, dynamic> json) =>
      _$CourseTablePrintConfigsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseTablePrintConfigsToJson(this);

  factory CourseTablePrintConfigs.emptyInstance() =>
      CourseTablePrintConfigs(nameZh: "", nameEn: "", unitGroup: []);
}

@JsonSerializable(explicitToJson: true)
class StudentTableVms {
  StudentTableVms(
      {required this.id,
      required this.name,
      required this.code,
      required this.grade,
      required this.department,
      required this.major,
      required this.adminclass,
      required this.credits,
      required this.totalRetakeCredits,
      required this.activities,
      required this.lessonSearchVms,
      required this.arrangedLessonSearchVms,
      required this.timeTableLayout,
      required this.courseTablePrintConfigs,
      required this.lessonNamePrint,
      required this.stdCountPrint,
      required this.teacherCodePrint,
      required this.teacherTitlePrint,
      required this.timePrint,
      required this.practiceWeekScheduleTexts});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "department", defaultValue: "")
  String department;

  @JsonKey(name: "major", defaultValue: "")
  String major;

  @JsonKey(name: "adminclass", defaultValue: "")
  String adminclass;

  @JsonKey(name: "credits", defaultValue: 0.0)
  double credits;

  @JsonKey(name: "totalRetakeCredits", defaultValue: 0)
  double totalRetakeCredits;

  @JsonKey(name: "activities", defaultValue: [])
  List<Activities> activities;

  @JsonKey(name: "lessonSearchVms", defaultValue: [])
  List lessonSearchVms;

  @JsonKey(name: "arrangedLessonSearchVms", defaultValue: [])
  List<ArrangedLessonSearchVms> arrangedLessonSearchVms;

  @JsonKey(name: "timeTableLayout", defaultValue: TimeTableLayout.emptyInstance)
  TimeTableLayout timeTableLayout;

  @JsonKey(name: "courseTablePrintConfigs", defaultValue: [])
  List<CourseTablePrintConfigs> courseTablePrintConfigs;

  @JsonKey(name: "lessonNamePrint", defaultValue: false)
  bool lessonNamePrint;

  @JsonKey(name: "stdCountPrint", defaultValue: false)
  bool stdCountPrint;

  @JsonKey(name: "teacherCodePrint", defaultValue: false)
  bool teacherCodePrint;

  @JsonKey(name: "teacherTitlePrint", defaultValue: false)
  bool teacherTitlePrint;

  @JsonKey(name: "timePrint", defaultValue: false)
  bool timePrint;

  @JsonKey(name: "practiceWeekScheduleTexts", defaultValue: [])
  List practiceWeekScheduleTexts;

  factory StudentTableVms.fromJson(Map<String, dynamic> json) =>
      _$StudentTableVmsFromJson(json);

  Map<String, dynamic> toJson() => _$StudentTableVmsToJson(this);

  factory StudentTableVms.emptyInstance() => StudentTableVms(
      id: 0,
      name: "",
      code: "",
      grade: "",
      department: "",
      major: "",
      adminclass: "",
      credits: 0,
      totalRetakeCredits: 0,
      activities: [],
      lessonSearchVms: [],
      arrangedLessonSearchVms: [],
      timeTableLayout: TimeTableLayout.emptyInstance(),
      courseTablePrintConfigs: [],
      lessonNamePrint: false,
      stdCountPrint: false,
      teacherCodePrint: false,
      teacherTitlePrint: false,
      timePrint: false,
      practiceWeekScheduleTexts: []);
}
