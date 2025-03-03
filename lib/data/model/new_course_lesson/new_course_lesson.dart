import 'package:json_annotation/json_annotation.dart';

part 'new_course_lesson.g.dart';

@JsonSerializable(explicitToJson: true)
class NewCourseLesson {

  NewCourseLesson(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      this.remark,
      required this.requiredPeriodInfo,
      required this.actualPeriods,
      required this.scheduleText,
      required this.stdCount,
      required this.limitCount,
      required this.retakeCount,
      required this.reserveCount,
      required this.suggestScheduleWeeks,
      required this.calcRelatedAdminclasses,
      required this.adminclassSetup,
      required this.allowMakeup,
      this.allowDelay,
      required this.expActualPeriods,
      required this.needAssign,
      required this.auto,
      this.scheduleRemark,
      required this.enforce,
      required this.arrangeExamType,
      required this.arrangeExamTypeZh,
      required this.lessonKind,
      this.selectionRemark,
      required this.generateSeatNumber,
      required this.midtermRetake,
      required this.actualTheoryPeriod,
      required this.actualPracticePeriod,
      required this.actualTestPeriod,
      required this.actualExperimentPeriod,
      required this.actualMachinePeriod,
      required this.actualDesignPeriod,
      required this.actualExtraPeriod,
      required this.auditState,
      this.currentNode,
      this.passed,
      this.submitDate,
      required this.noAttendCount,
      this.practiceWeekScheduleText,
      required this.timeTableLayout,
      required this.bizType,
      required this.semester,
      required this.course,
      required this.preCourses,
      required this.courseType,
      required this.openDepartment,
      required this.scheduleAssignDepartment,
      required this.scheduleState,
      required this.examMode,
      required this.courseProperty,
      required this.campus,
      this.teachLang,
      this.roomType,
      required this.suggestScheduleWeeksInfo,
      required this.scheduleWeeksInfo,
      required this.teacherAssignmentList,
      required this.scheduleStartWeek,
      required this.scheduleEndWeek,
      required this.scheduleCurrentWeek,
      required this.scheduleChangeWeeks,
      this.planExamWeek,
      required this.adminclassIds,
      required this.adminClasses,
      required this.adminclassVms,
      this.minorCourse,
      this.tags,
      required this.crossBizTypes,
      required this.courseLevelRequireList,
      required this.hasSchedule,
      required this.compulsorys,
      required this.courseStdCount,
      required this.teacherScheduleTextVms,
      required this.lessonKindText,
      required this.compulsorysStr,
      this.auditLogVms,
      this.examMethod,
      this.examDuration,
      required this.teacherAssignmentString,
      required this.teacherAssignmentStr,
      required this.lessonKindZh,
      required this.lessonKindEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "requiredPeriodInfo", defaultValue: RequiredPeriodInfo.emptyInstance)
  RequiredPeriodInfo requiredPeriodInfo;

  @JsonKey(name: "actualPeriods", defaultValue: 0)
  int actualPeriods;

  @JsonKey(name: "scheduleText", defaultValue: ScheduleText.emptyInstance)
  ScheduleText scheduleText;

  @JsonKey(name: "stdCount", defaultValue: 0)
  int stdCount;

  @JsonKey(name: "limitCount", defaultValue: 0)
  int limitCount;

  @JsonKey(name: "retakeCount", defaultValue: 0)
  int retakeCount;

  @JsonKey(name: "reserveCount", defaultValue: 0)
  int reserveCount;

  @JsonKey(name: "suggestScheduleWeeks", defaultValue: [])
  List suggestScheduleWeeks;

  @JsonKey(name: "calcRelatedAdminclasses", defaultValue: false)
  bool calcRelatedAdminclasses;

  @JsonKey(name: "adminclassSetup", defaultValue: false)
  bool adminclassSetup;

  @JsonKey(name: "allowMakeup", defaultValue: false)
  bool allowMakeup;

  @JsonKey(name: "allowDelay")
  dynamic allowDelay;

  @JsonKey(name: "expActualPeriods", defaultValue: 0)
  int expActualPeriods;

  @JsonKey(name: "needAssign", defaultValue: false)
  bool needAssign;

  @JsonKey(name: "auto", defaultValue: false)
  bool auto;

  @JsonKey(name: "scheduleRemark")
  dynamic scheduleRemark;

  @JsonKey(name: "enforce", defaultValue: false)
  bool enforce;

  @JsonKey(name: "arrangeExamType", defaultValue: "")
  String arrangeExamType;

  @JsonKey(name: "arrangeExamTypeZh", defaultValue: "")
  String arrangeExamTypeZh;

  @JsonKey(name: "lessonKind", defaultValue: "")
  String lessonKind;

  @JsonKey(name: "selectionRemark")
  dynamic selectionRemark;

  @JsonKey(name: "generateSeatNumber", defaultValue: false)
  bool generateSeatNumber;

  @JsonKey(name: "midtermRetake", defaultValue: false)
  bool midtermRetake;

  @JsonKey(name: "actualTheoryPeriod", defaultValue: 0)
  int actualTheoryPeriod;

  @JsonKey(name: "actualPracticePeriod", defaultValue: 0)
  int actualPracticePeriod;

  @JsonKey(name: "actualTestPeriod", defaultValue: 0)
  int actualTestPeriod;

  @JsonKey(name: "actualExperimentPeriod", defaultValue: 0)
  int actualExperimentPeriod;

  @JsonKey(name: "actualMachinePeriod", defaultValue: 0)
  int actualMachinePeriod;

  @JsonKey(name: "actualDesignPeriod", defaultValue: 0)
  int actualDesignPeriod;

  @JsonKey(name: "actualExtraPeriod", defaultValue: 0)
  int actualExtraPeriod;

  @JsonKey(name: "auditState", defaultValue: "")
  String auditState;

  @JsonKey(name: "currentNode")
  dynamic currentNode;

  @JsonKey(name: "passed")
  dynamic passed;

  @JsonKey(name: "submitDate")
  dynamic submitDate;

  @JsonKey(name: "noAttendCount", defaultValue: 0)
  int noAttendCount;

  @JsonKey(name: "practiceWeekScheduleText")
  dynamic practiceWeekScheduleText;

  @JsonKey(name: "timeTableLayout", defaultValue: TimeTableLayout.emptyInstance)
  TimeTableLayout timeTableLayout;

  @JsonKey(name: "bizType", defaultValue: BizType.emptyInstance)
  BizType bizType;

  @JsonKey(name: "semester", defaultValue: Semester.emptyInstance)
  Semester semester;

  @JsonKey(name: "course", defaultValue: Course.emptyInstance)
  Course course;

  @JsonKey(name: "preCourses", defaultValue: [])
  List preCourses;

  @JsonKey(name: "courseType", defaultValue: CourseType.emptyInstance)
  CourseType courseType;

  @JsonKey(name: "openDepartment", defaultValue: OpenDepartment.emptyInstance)
  OpenDepartment openDepartment;

  @JsonKey(name: "scheduleAssignDepartment", defaultValue: ScheduleAssignDepartment.emptyInstance)
  ScheduleAssignDepartment scheduleAssignDepartment;

  @JsonKey(name: "scheduleState", defaultValue: "")
  String scheduleState;

  @JsonKey(name: "examMode", defaultValue: ExamMode.emptyInstance)
  ExamMode examMode;

  @JsonKey(name: "courseProperty", defaultValue: CourseProperty.emptyInstance)
  CourseProperty courseProperty;

  @JsonKey(name: "campus", defaultValue: Campus.emptyInstance)
  Campus campus;

  @JsonKey(name: "teachLang")
  dynamic teachLang;

  @JsonKey(name: "roomType")
  dynamic roomType;

  @JsonKey(name: "suggestScheduleWeeksInfo", defaultValue: "")
  String suggestScheduleWeeksInfo;

  @JsonKey(name: "scheduleWeeksInfo", defaultValue: "")
  String scheduleWeeksInfo;

  @JsonKey(name: "teacherAssignmentList", defaultValue: [])
  List<TeacherAssignmentList> teacherAssignmentList;

  @JsonKey(name: "scheduleStartWeek", defaultValue: 0)
  int scheduleStartWeek;

  @JsonKey(name: "scheduleEndWeek", defaultValue: 0)
  int scheduleEndWeek;

  @JsonKey(name: "scheduleCurrentWeek", defaultValue: 0)
  int scheduleCurrentWeek;

  @JsonKey(name: "scheduleChangeWeeks", defaultValue: [])
  List<int> scheduleChangeWeeks;

  @JsonKey(name: "planExamWeek")
  dynamic planExamWeek;

  @JsonKey(name: "adminclassIds", defaultValue: [])
  List<int> adminclassIds;

  @JsonKey(name: "adminClasses", defaultValue: "")
  String adminClasses;

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

  @JsonKey(name: "hasSchedule", defaultValue: false)
  bool hasSchedule;

  @JsonKey(name: "compulsorys", defaultValue: [])
  List<String> compulsorys;

  @JsonKey(name: "courseStdCount", defaultValue: 0)
  int courseStdCount;

  @JsonKey(name: "teacherScheduleTextVms", defaultValue: [])
  List<TeacherScheduleTextVms> teacherScheduleTextVms;

  @JsonKey(name: "lessonKindText", defaultValue: "")
  String lessonKindText;

  @JsonKey(name: "compulsorysStr", defaultValue: "")
  String compulsorysStr;

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


  factory NewCourseLesson.fromJson(Map<String, dynamic> json) => _$NewCourseLessonFromJson(json);
  
  Map<String, dynamic> toJson() => _$NewCourseLessonToJson(this);
  
  factory NewCourseLesson.emptyInstance() => NewCourseLesson(id: 0, nameZh: "", code: "", requiredPeriodInfo: RequiredPeriodInfo.emptyInstance(), actualPeriods: 0, scheduleText: ScheduleText.emptyInstance(), stdCount: 0, limitCount: 0, retakeCount: 0, reserveCount: 0, suggestScheduleWeeks: [], calcRelatedAdminclasses: false, adminclassSetup: false, allowMakeup: false, expActualPeriods: 0, needAssign: false, auto: false, enforce: false, arrangeExamType: "", arrangeExamTypeZh: "", lessonKind: "", generateSeatNumber: false, midtermRetake: false, actualTheoryPeriod: 0, actualPracticePeriod: 0, actualTestPeriod: 0, actualExperimentPeriod: 0, actualMachinePeriod: 0, actualDesignPeriod: 0, actualExtraPeriod: 0, auditState: "", noAttendCount: 0, timeTableLayout: TimeTableLayout.emptyInstance(), bizType: BizType.emptyInstance(), semester: Semester.emptyInstance(), course: Course.emptyInstance(), preCourses: [], courseType: CourseType.emptyInstance(), openDepartment: OpenDepartment.emptyInstance(), scheduleAssignDepartment: ScheduleAssignDepartment.emptyInstance(), scheduleState: "", examMode: ExamMode.emptyInstance(), courseProperty: CourseProperty.emptyInstance(), campus: Campus.emptyInstance(), suggestScheduleWeeksInfo: "", scheduleWeeksInfo: "", teacherAssignmentList: [], scheduleStartWeek: 0, scheduleEndWeek: 0, scheduleCurrentWeek: 0, scheduleChangeWeeks: [], adminclassIds: [], adminClasses: "", adminclassVms: [], crossBizTypes: [], courseLevelRequireList: [], hasSchedule: false, compulsorys: [], courseStdCount: 0, teacherScheduleTextVms: [], lessonKindText: "", compulsorysStr: "", teacherAssignmentString: "", teacherAssignmentStr: "", lessonKindZh: "", lessonKindEn: "");
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
      this.requirePractice,
      this.focusPractice,
      this.focusPracticeUnit,
      this.dispersedPractice,
      this.test,
      this.testUnit,
      this.requireTest,
      required this.experiment,
      required this.experimentUnit,
      required this.requireExperiment,
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
  int total;

  @JsonKey(name: "weeks", defaultValue: 0.0)
  double weeks;

  @JsonKey(name: "theory", defaultValue: 0)
  int theory;

  @JsonKey(name: "theoryUnit", defaultValue: "")
  String theoryUnit;

  @JsonKey(name: "requireTheory", defaultValue: 0)
  int requireTheory;

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

  @JsonKey(name: "experiment", defaultValue: 0)
  int experiment;

  @JsonKey(name: "experimentUnit", defaultValue: "")
  String experimentUnit;

  @JsonKey(name: "requireExperiment", defaultValue: 0)
  int requireExperiment;

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
  int periodsPerWeek;

  @JsonKey(name: "extra")
  dynamic extra;

  @JsonKey(name: "extraUnit")
  dynamic extraUnit;

  @JsonKey(name: "requireExtra")
  dynamic requireExtra;


  factory RequiredPeriodInfo.fromJson(Map<String, dynamic> json) => _$RequiredPeriodInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$RequiredPeriodInfoToJson(this);
  
  factory RequiredPeriodInfo.emptyInstance() => RequiredPeriodInfo(total: 0, weeks: 0, theory: 0, theoryUnit: "", requireTheory: 0, experiment: 0, experimentUnit: "", requireExperiment: 0, periodsPerWeek: 0);
}

@JsonSerializable(explicitToJson: true)
class DateTimeText {

  DateTimeText(
      {required this.textZh,
      required this.textEn,
      required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;


  factory DateTimeText.fromJson(Map<String, dynamic> json) => _$DateTimeTextFromJson(json);
  
  Map<String, dynamic> toJson() => _$DateTimeTextToJson(this);
  
  factory DateTimeText.emptyInstance() => DateTimeText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class DateTimePlaceText {

  DateTimePlaceText(
      {required this.textZh,
      required this.textEn,
      required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;


  factory DateTimePlaceText.fromJson(Map<String, dynamic> json) => _$DateTimePlaceTextFromJson(json);
  
  Map<String, dynamic> toJson() => _$DateTimePlaceTextToJson(this);
  
  factory DateTimePlaceText.emptyInstance() => DateTimePlaceText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class DateTimePlacePersonText {

  DateTimePlacePersonText(
      {required this.textZh,
      required this.textEn,
      required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;


  factory DateTimePlacePersonText.fromJson(Map<String, dynamic> json) => _$DateTimePlacePersonTextFromJson(json);
  
  Map<String, dynamic> toJson() => _$DateTimePlacePersonTextToJson(this);
  
  factory DateTimePlacePersonText.emptyInstance() => DateTimePlacePersonText(textZh: "", textEn: "", text: "");
}

@JsonSerializable(explicitToJson: true)
class RoomSeatText {

  RoomSeatText(
      {required this.textZh,
      required this.textEn,
      required this.text});

  @JsonKey(name: "textZh", defaultValue: "")
  String textZh;

  @JsonKey(name: "textEn", defaultValue: "")
  String textEn;

  @JsonKey(name: "text", defaultValue: "")
  String text;


  factory RoomSeatText.fromJson(Map<String, dynamic> json) => _$RoomSeatTextFromJson(json);
  
  Map<String, dynamic> toJson() => _$RoomSeatTextToJson(this);
  
  factory RoomSeatText.emptyInstance() => RoomSeatText(textZh: "", textEn: "", text: "");
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

  @JsonKey(name: "dateTimePlaceText", defaultValue: DateTimePlaceText.emptyInstance)
  DateTimePlaceText dateTimePlaceText;

  @JsonKey(name: "dateTimePlacePersonText", defaultValue: DateTimePlacePersonText.emptyInstance)
  DateTimePlacePersonText dateTimePlacePersonText;

  @JsonKey(name: "roomSeatText", defaultValue: RoomSeatText.emptyInstance)
  RoomSeatText roomSeatText;


  factory ScheduleText.fromJson(Map<String, dynamic> json) => _$ScheduleTextFromJson(json);
  
  Map<String, dynamic> toJson() => _$ScheduleTextToJson(this);
  
  factory ScheduleText.emptyInstance() => ScheduleText(dateTimeText: DateTimeText.emptyInstance(), dateTimePlaceText: DateTimePlaceText.emptyInstance(), dateTimePlacePersonText: DateTimePlacePersonText.emptyInstance(), roomSeatText: RoomSeatText.emptyInstance());
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
  int id;

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


  factory TimeTableLayout.fromJson(Map<String, dynamic> json) => _$TimeTableLayoutFromJson(json);
  
  Map<String, dynamic> toJson() => _$TimeTableLayoutToJson(this);
  
  factory TimeTableLayout.emptyInstance() => TimeTableLayout(id: 0, nameZh: "", nameEn: "", enabled: false);
}

@JsonSerializable(explicitToJson: true)
class BizType {

  BizType(
      {required this.id,
      required this.nameZh,
      required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;


  factory BizType.fromJson(Map<String, dynamic> json) => _$BizTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$BizTypeToJson(this);
  
  factory BizType.emptyInstance() => BizType(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class Calendar {

  Calendar(
      {required this.id,
      required this.nameZh,
      this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;


  factory Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);
  
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
  int id;

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


  factory Semester.fromJson(Map<String, dynamic> json) => _$SemesterFromJson(json);
  
  Map<String, dynamic> toJson() => _$SemesterToJson(this);
  
  factory Semester.emptyInstance() => Semester(id: 0, nameZh: "", nameEn: "", code: "", calendar: Calendar.emptyInstance(), schoolYear: "", startDate: "", endDate: "", weekStartOnSunday: false, countInTerm: false, season: "", enabled: false);
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
      required this.experiment,
      required this.experimentUnit,
      required this.requireExperiment,
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
  int total;

  @JsonKey(name: "weeks", defaultValue: 0.0)
  double weeks;

  @JsonKey(name: "theory", defaultValue: 0)
  int theory;

  @JsonKey(name: "theoryUnit", defaultValue: "")
  String theoryUnit;

  @JsonKey(name: "requireTheory", defaultValue: 0)
  int requireTheory;

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

  @JsonKey(name: "experiment", defaultValue: 0)
  int experiment;

  @JsonKey(name: "experimentUnit", defaultValue: "")
  String experimentUnit;

  @JsonKey(name: "requireExperiment", defaultValue: 0)
  int requireExperiment;

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
  int periodsPerWeek;

  @JsonKey(name: "extra")
  dynamic extra;

  @JsonKey(name: "extraUnit")
  dynamic extraUnit;

  @JsonKey(name: "requireExtra")
  dynamic requireExtra;


  factory PeriodInfo.fromJson(Map<String, dynamic> json) => _$PeriodInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$PeriodInfoToJson(this);
  
  factory PeriodInfo.emptyInstance() => PeriodInfo(total: 0, weeks: 0, theory: 0, theoryUnit: "", requireTheory: 0, experiment: 0, experimentUnit: "", requireExperiment: 0, periodsPerWeek: 0);
}

@JsonSerializable(explicitToJson: true)
class StageInfo {

  StageInfo(
      {required this.stage,
      this.stageNum,
      this.stageGrantNum});

  @JsonKey(name: "stage", defaultValue: false)
  bool stage;

  @JsonKey(name: "stageNum")
  dynamic stageNum;

  @JsonKey(name: "stageGrantNum")
  dynamic stageGrantNum;


  factory StageInfo.fromJson(Map<String, dynamic> json) => _$StageInfoFromJson(json);
  
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
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);
  
  Map<String, dynamic> toJson() => _$EducationToJson(this);
  
  factory Education.emptyInstance() => Education(nameZh: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], bizTypeIds: [], transient: false, name: "");
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
      this.coursePropertyAssoc,
      required this.creditsCourse,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "coursePropertyAssoc")
  dynamic coursePropertyAssoc;

  @JsonKey(name: "creditsCourse", defaultValue: false)
  bool creditsCourse;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory CourseType.fromJson(Map<String, dynamic> json) => _$CourseTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$CourseTypeToJson(this);
  
  factory CourseType.emptyInstance() => CourseType(nameZh: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], creditsCourse: false, bizTypeIds: [], transient: false, name: "");
}

@JsonSerializable(explicitToJson: true)
class DefaultOpenDepart {

  DefaultOpenDepart(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
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
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

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
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;


  factory DefaultOpenDepart.fromJson(Map<String, dynamic> json) => _$DefaultOpenDepartFromJson(json);
  
  Map<String, dynamic> toJson() => _$DefaultOpenDepartToJson(this);
  
  factory DefaultOpenDepart.emptyInstance() => DefaultOpenDepart(id: 0, nameZh: "", nameEn: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
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
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory DefaultExamMode.fromJson(Map<String, dynamic> json) => _$DefaultExamModeFromJson(json);
  
  Map<String, dynamic> toJson() => _$DefaultExamModeToJson(this);
  
  factory DefaultExamMode.emptyInstance() => DefaultExamMode(nameZh: "", nameEn: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], bizTypeIds: [], transient: false, name: "");
}

@JsonSerializable(explicitToJson: true)
class BelongBizType {

  BelongBizType(
      {required this.id,
      required this.nameZh,
      required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;


  factory BelongBizType.fromJson(Map<String, dynamic> json) => _$BelongBizTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$BelongBizTypeToJson(this);
  
  factory BelongBizType.emptyInstance() => BelongBizType(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class SuitableBizTypes {

  SuitableBizTypes(
      {required this.id,
      required this.nameZh,
      required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;


  factory SuitableBizTypes.fromJson(Map<String, dynamic> json) => _$SuitableBizTypesFromJson(json);
  
  Map<String, dynamic> toJson() => _$SuitableBizTypesToJson(this);
  
  factory SuitableBizTypes.emptyInstance() => SuitableBizTypes(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class MngtDepartment {

  MngtDepartment(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
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
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

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
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;


  factory MngtDepartment.fromJson(Map<String, dynamic> json) => _$MngtDepartmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$MngtDepartmentToJson(this);
  
  factory MngtDepartment.emptyInstance() => MngtDepartment(id: 0, nameZh: "", nameEn: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
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
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory TeachLang.fromJson(Map<String, dynamic> json) => _$TeachLangFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeachLangToJson(this);
  
  factory TeachLang.emptyInstance() => TeachLang(nameZh: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], bizTypeIds: [], transient: false, name: "");
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
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "delayedExam", defaultValue: false)
  bool delayedExam;

  @JsonKey(name: "makeUpExam", defaultValue: false)
  bool makeUpExam;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory CourseProperty.fromJson(Map<String, dynamic> json) => _$CoursePropertyFromJson(json);
  
  Map<String, dynamic> toJson() => _$CoursePropertyToJson(this);
  
  factory CourseProperty.emptyInstance() => CourseProperty(nameZh: "", nameEn: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], delayedExam: false, makeUpExam: false, bizTypeIds: [], transient: false, name: "");
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
      required this.flag,
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
      required this.courseProperty,
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
  int id;

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
  int credits;

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
  dynamic extraCredits;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "flags", defaultValue: [])
  List<String> flags;

  @JsonKey(name: "flag", defaultValue: "")
  String flag;

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

  @JsonKey(name: "defaultOpenDepart", defaultValue: DefaultOpenDepart.emptyInstance)
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

  @JsonKey(name: "courseProperty", defaultValue: CourseProperty.emptyInstance)
  CourseProperty courseProperty;

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
  
  factory Course.emptyInstance() => Course(id: 0, nameZh: "", nameEn: "", code: "", periodInfo: PeriodInfo.emptyInstance(), stageInfo: StageInfo.emptyInstance(), credits: 0, calculateGp: false, theory: false, experiment: false, practice: false, test: false, machine: false, design: false, extra: false, enabled: false, flags: [], flag: "", allowMakeUp: false, allowDelay: false, education: Education.emptyInstance(), courseType: CourseType.emptyInstance(), defaultOpenDepart: DefaultOpenDepart.emptyInstance(), defaultExamMode: DefaultExamMode.emptyInstance(), defaultPreCourses: [], belongBizType: BelongBizType.emptyInstance(), suitableBizTypes: [], mngtDepartment: MngtDepartment.emptyInstance(), teachLang: TeachLang.emptyInstance(), minorCourses: [], lessonType: "", seasons: [], suitMajors: [], courseProperty: CourseProperty.emptyInstance(), textbooks: [], courseLevelRequireList: [], defaultPreCourseList: []);
}

@JsonSerializable(explicitToJson: true)
class OpenDepartment {

  OpenDepartment(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
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
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

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
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;


  factory OpenDepartment.fromJson(Map<String, dynamic> json) => _$OpenDepartmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$OpenDepartmentToJson(this);
  
  factory OpenDepartment.emptyInstance() => OpenDepartment(id: 0, nameZh: "", nameEn: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class ScheduleAssignDepartment {

  ScheduleAssignDepartment(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
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
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

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
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;


  factory ScheduleAssignDepartment.fromJson(Map<String, dynamic> json) => _$ScheduleAssignDepartmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$ScheduleAssignDepartmentToJson(this);
  
  factory ScheduleAssignDepartment.emptyInstance() => ScheduleAssignDepartment(id: 0, nameZh: "", nameEn: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
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
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory ExamMode.fromJson(Map<String, dynamic> json) => _$ExamModeFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExamModeToJson(this);
  
  factory ExamMode.emptyInstance() => ExamMode(nameZh: "", nameEn: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], bizTypeIds: [], transient: false, name: "");
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
  int id;

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
  
  factory Campus.emptyInstance() => Campus(id: 0, nameZh: "", nameEn: "", code: "", enabled: false);
}

@JsonSerializable(explicitToJson: true)
class Department {

  Department(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
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
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

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
  int indexNo;

  @JsonKey(name: "recruitTypeSet", defaultValue: [])
  List<String> recruitTypeSet;

  @JsonKey(name: "recruitTypes", defaultValue: "")
  String recruitTypes;


  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
  
  factory Department.emptyInstance() => Department(id: 0, nameZh: "", nameEn: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
}

@JsonSerializable(explicitToJson: true)
class Person {

  Person(
      {required this.id,
      required this.nameZh,
      required this.nameEn});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;


  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  
  Map<String, dynamic> toJson() => _$PersonToJson(this);
  
  factory Person.emptyInstance() => Person(id: 0, nameZh: "", nameEn: "");
}

@JsonSerializable(explicitToJson: true)
class Title {

  Title(
      {required this.nameZh,
      this.nameEn,
      required this.id,
      required this.code,
      required this.enabled,
      required this.bizTypeAssocs,
      this.specialistPositionLevelAssoc,
      required this.bizTypeIds,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypeAssocs", defaultValue: [])
  List bizTypeAssocs;

  @JsonKey(name: "specialistPositionLevelAssoc")
  dynamic specialistPositionLevelAssoc;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);
  
  Map<String, dynamic> toJson() => _$TitleToJson(this);
  
  factory Title.emptyInstance() => Title(nameZh: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], bizTypeIds: [], transient: false, name: "");
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
      required this.title,
      this.type,
      this.major,
      this.preEducation,
      this.degreeType});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

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

  @JsonKey(name: "title", defaultValue: Title.emptyInstance)
  Title title;

  @JsonKey(name: "type")
  dynamic type;

  @JsonKey(name: "major")
  dynamic major;

  @JsonKey(name: "preEducation")
  dynamic preEducation;

  @JsonKey(name: "degreeType")
  dynamic degreeType;


  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
  
  factory Teacher.emptyInstance() => Teacher(id: 0, code: "", teaching: false, zaiZhi: false, hireType: "", department: Department.emptyInstance(), person: Person.emptyInstance(), title: Title.emptyInstance());
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
  int indexNo;

  @JsonKey(name: "age")
  dynamic age;


  factory TeacherAssignmentList.fromJson(Map<String, dynamic> json) => _$TeacherAssignmentListFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeacherAssignmentListToJson(this);
  
  factory TeacherAssignmentList.emptyInstance() => TeacherAssignmentList(teacher: Teacher.emptyInstance(), person: Person.emptyInstance(), role: "", indexNo: 0);
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
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "stdCount", defaultValue: 0)
  int stdCount;

  @JsonKey(name: "planCount", defaultValue: 0)
  int planCount;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "abbrZh")
  dynamic abbrZh;

  @JsonKey(name: "abbrEn")
  dynamic abbrEn;

  @JsonKey(name: "remark")
  dynamic remark;


  factory AdminclassVms.fromJson(Map<String, dynamic> json) => _$AdminclassVmsFromJson(json);
  
  Map<String, dynamic> toJson() => _$AdminclassVmsToJson(this);
  
  factory AdminclassVms.emptyInstance() => AdminclassVms(id: 0, nameZh: "", nameEn: "", code: "", grade: "", stdCount: 0, planCount: 0, enabled: false);
}

@JsonSerializable(explicitToJson: true)
class TeacherScheduleTextVms {

  TeacherScheduleTextVms(
      {required this.personId,
      this.teacherId,
      required this.scheduleText});

  @JsonKey(name: "personId", defaultValue: 0)
  int personId;

  @JsonKey(name: "teacherId")
  dynamic teacherId;

  @JsonKey(name: "scheduleText", defaultValue: "")
  String scheduleText;


  factory TeacherScheduleTextVms.fromJson(Map<String, dynamic> json) => _$TeacherScheduleTextVmsFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeacherScheduleTextVmsToJson(this);
  
  factory TeacherScheduleTextVms.emptyInstance() => TeacherScheduleTextVms(personId: 0, scheduleText: "");
}


