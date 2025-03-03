import 'package:json_annotation/json_annotation.dart';

part 'experiment_courses_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperimentCoursesResponse {
  ExperimentCoursesResponse(
      {required this.success,
      required this.message,
      required this.code,
      required this.result,
      required this.timestamp});

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "message", defaultValue: "")
  String message;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "result", defaultValue: Result.emptyInstance)
  Result result;

  @JsonKey(name: "timestamp", defaultValue: 0)
  int timestamp;

  factory ExperimentCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$ExperimentCoursesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExperimentCoursesResponseToJson(this);

  factory ExperimentCoursesResponse.emptyInstance() =>
      ExperimentCoursesResponse(
          success: false,
          message: "",
          code: 0,
          result: Result.emptyInstance(),
          timestamp: 0);
}

@JsonSerializable(explicitToJson: true)
class ExperimentCourseRecord {
  ExperimentCourseRecord(
      {required this.academyName,
      required this.selectionAdminclassInfo,
      required this.periodInfoPeriodsPerWeek,
      required this.importFlag,
      required this.id,
      required this.selectionAdminclassIds,
      required this.taskRelation,
      required this.courseName,
      required this.periodInfoRequireTest,
      required this.timetableName,
      required this.periodInfoFocusPractice,
      required this.departId,
      required this.gradeForm,
      required this.periodInfoDesign,
      required this.periodInfoRequireTheory,
      required this.periodInfoRequirePractice,
      required this.teacherName,
      required this.academyCode,
      required this.updateTime,
      required this.selectionGroupMajorIds,
      required this.periodInfoDispersedPractice,
      required this.createTime,
      required this.periodInfoPractice,
      required this.majorName,
      required this.periodInfoTheoryUnit,
      required this.courseType,
      required this.examType,
      required this.teacherCalendarId,
      required this.crosschannel,
      required this.periodInfoRequireExperiment,
      required this.coursePeriod,
      required this.teacherNum,
      required this.courseIdDictText,
      required this.credit,
      required this.courseId,
      required this.typeIsSelect,
      required this.periodInfoRequireDesign,
      required this.selectionDepartmentIds,
      required this.archive,
      required this.periodInfoTheory,
      required this.periodInfoRequireMachine,
      required this.periodInfoTotal,
      required this.periodInfoExperiment,
      required this.periodInfoExtra,
      required this.studentCount,
      required this.selectionGroupMajorInfo,
      required this.periodInfoWeeks,
      required this.whetherGroup,
      required this.teacherCalendarText,
      required this.siteIdDictText,
      required this.periodInfoRequireExtra,
      required this.selectionGroupGrades,
      required this.updateBy,
      required this.scheduleStatus,
      required this.scheduleStatusDictText,
      required this.courseNumber,
      required this.selectionGroupGradeInfo,
      required this.periodInfoTest,
      required this.periodInfoExperimentUnit,
      required this.periodInfoMachine,
      required this.createBy,
      required this.selectionDepartmentInfo,
      required this.targetAudience,
      required this.siteId,
      this.beginWeek,
      this.endWeek});

  @JsonKey(name: "academyName", defaultValue: "")
  String academyName;

  @JsonKey(name: "selectionAdminclassInfo", defaultValue: "")
  String selectionAdminclassInfo;

  @JsonKey(name: "periodInfoPeriodsPerWeek", defaultValue: 0)
  int periodInfoPeriodsPerWeek;

  @JsonKey(name: "importFlag", defaultValue: 0)
  int importFlag;

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "selectionAdminclassIds", defaultValue: "")
  String selectionAdminclassIds;

  @JsonKey(name: "taskRelation", defaultValue: "")
  String taskRelation;

  @JsonKey(name: "courseName", defaultValue: "")
  String courseName;

  @JsonKey(name: "periodInfoRequireTest", defaultValue: 0)
  int periodInfoRequireTest;

  @JsonKey(name: "timetableName", defaultValue: "")
  String timetableName;

  @JsonKey(name: "periodInfoFocusPractice", defaultValue: 0)
  int periodInfoFocusPractice;

  @JsonKey(name: "departId", defaultValue: "")
  String departId;

  @JsonKey(name: "gradeForm", defaultValue: 0)
  int gradeForm;

  @JsonKey(name: "periodInfoDesign", defaultValue: 0)
  int periodInfoDesign;

  @JsonKey(name: "periodInfoRequireTheory", defaultValue: 0)
  int periodInfoRequireTheory;

  @JsonKey(name: "periodInfoRequirePractice", defaultValue: 0)
  int periodInfoRequirePractice;

  @JsonKey(name: "teacherName", defaultValue: "")
  String teacherName;

  @JsonKey(name: "academyCode", defaultValue: "")
  String academyCode;

  @JsonKey(name: "updateTime", defaultValue: "")
  String updateTime;

  @JsonKey(name: "selectionGroupMajorIds", defaultValue: "")
  String selectionGroupMajorIds;

  @JsonKey(name: "periodInfoDispersedPractice", defaultValue: 0)
  int periodInfoDispersedPractice;

  @JsonKey(name: "createTime", defaultValue: "")
  String createTime;

  @JsonKey(name: "periodInfoPractice", defaultValue: 0)
  int periodInfoPractice;

  @JsonKey(name: "majorName", defaultValue: "")
  String majorName;

  @JsonKey(name: "periodInfoTheoryUnit", defaultValue: "")
  String periodInfoTheoryUnit;

  @JsonKey(name: "courseType", defaultValue: "")
  String courseType;

  @JsonKey(name: "examType", defaultValue: "")
  String examType;

  @JsonKey(name: "teacherCalendarId", defaultValue: "")
  String teacherCalendarId;

  @JsonKey(name: "crosschannel", defaultValue: 0)
  int crosschannel;

  @JsonKey(name: "periodInfoRequireExperiment", defaultValue: 0)
  int periodInfoRequireExperiment;

  @JsonKey(name: "coursePeriod", defaultValue: 0)
  int coursePeriod;

  @JsonKey(name: "teacherNum", defaultValue: "")
  String teacherNum;

  @JsonKey(name: "courseId_dictText", defaultValue: "")
  String courseIdDictText;

  @JsonKey(name: "credit", defaultValue: 0.0)
  double credit;

  @JsonKey(name: "courseId", defaultValue: "")
  String courseId;

  @JsonKey(name: "typeIsSelect", defaultValue: false)
  bool typeIsSelect;

  @JsonKey(name: "periodInfoRequireDesign", defaultValue: 0)
  int periodInfoRequireDesign;

  @JsonKey(name: "selectionDepartmentIds", defaultValue: "")
  String selectionDepartmentIds;

  @JsonKey(name: "archive", defaultValue: 0)
  int archive;

  @JsonKey(name: "periodInfoTheory", defaultValue: 0)
  int periodInfoTheory;

  @JsonKey(name: "periodInfoRequireMachine", defaultValue: 0)
  int periodInfoRequireMachine;

  @JsonKey(name: "periodInfoTotal", defaultValue: 0)
  int periodInfoTotal;

  @JsonKey(name: "periodInfoExperiment", defaultValue: 0)
  int periodInfoExperiment;

  @JsonKey(name: "periodInfoExtra", defaultValue: 0)
  int periodInfoExtra;

  @JsonKey(name: "studentCount", defaultValue: 0)
  int studentCount;

  @JsonKey(name: "selectionGroupMajorInfo", defaultValue: "")
  String selectionGroupMajorInfo;

  @JsonKey(name: "periodInfoWeeks", defaultValue: 0)
  int periodInfoWeeks;

  @JsonKey(name: "whetherGroup", defaultValue: 0)
  int whetherGroup;

  @JsonKey(name: "teacherCalendarText", defaultValue: "")
  String teacherCalendarText;

  @JsonKey(name: "siteId_dictText", defaultValue: "")
  String siteIdDictText;

  @JsonKey(name: "periodInfoRequireExtra", defaultValue: 0)
  int periodInfoRequireExtra;

  @JsonKey(name: "selectionGroupGrades", defaultValue: "")
  String selectionGroupGrades;

  @JsonKey(name: "updateBy", defaultValue: "")
  String updateBy;

  @JsonKey(name: "scheduleStatus", defaultValue: 0)
  int scheduleStatus;

  @JsonKey(name: "scheduleStatus_dictText", defaultValue: "")
  String scheduleStatusDictText;

  @JsonKey(name: "courseNumber", defaultValue: "")
  String courseNumber;

  @JsonKey(name: "selectionGroupGradeInfo", defaultValue: "")
  String selectionGroupGradeInfo;

  @JsonKey(name: "periodInfoTest", defaultValue: 0)
  int periodInfoTest;

  @JsonKey(name: "periodInfoExperimentUnit", defaultValue: "")
  String periodInfoExperimentUnit;

  @JsonKey(name: "periodInfoMachine", defaultValue: 0)
  int periodInfoMachine;

  @JsonKey(name: "createBy", defaultValue: "")
  String createBy;

  @JsonKey(name: "selectionDepartmentInfo", defaultValue: "")
  String selectionDepartmentInfo;

  @JsonKey(name: "targetAudience", defaultValue: "")
  String targetAudience;

  @JsonKey(name: "siteId", defaultValue: "")
  String siteId;

  @JsonKey(name: "beginWeek", defaultValue: null)
  int? beginWeek;

  @JsonKey(name: "endWeek", defaultValue: null)
  int? endWeek;

  factory ExperimentCourseRecord.fromJson(Map<String, dynamic> json) =>
      _$ExperimentCourseRecordFromJson(json);

  Map<String, dynamic> toJson() => _$ExperimentCourseRecordToJson(this);

  factory ExperimentCourseRecord.emptyInstance() => ExperimentCourseRecord(
      academyName: "",
      selectionAdminclassInfo: "",
      periodInfoPeriodsPerWeek: 0,
      importFlag: 0,
      id: "",
      selectionAdminclassIds: "",
      taskRelation: "",
      courseName: "",
      periodInfoRequireTest: 0,
      timetableName: "",
      periodInfoFocusPractice: 0,
      departId: "",
      gradeForm: 0,
      periodInfoDesign: 0,
      periodInfoRequireTheory: 0,
      periodInfoRequirePractice: 0,
      teacherName: "",
      academyCode: "",
      updateTime: "",
      selectionGroupMajorIds: "",
      periodInfoDispersedPractice: 0,
      createTime: "",
      periodInfoPractice: 0,
      majorName: "",
      periodInfoTheoryUnit: "",
      courseType: "",
      examType: "",
      teacherCalendarId: "",
      crosschannel: 0,
      periodInfoRequireExperiment: 0,
      coursePeriod: 0,
      teacherNum: "",
      courseIdDictText: "",
      credit: 0,
      courseId: "",
      typeIsSelect: false,
      periodInfoRequireDesign: 0,
      selectionDepartmentIds: "",
      archive: 0,
      periodInfoTheory: 0,
      periodInfoRequireMachine: 0,
      periodInfoTotal: 0,
      periodInfoExperiment: 0,
      periodInfoExtra: 0,
      studentCount: 0,
      selectionGroupMajorInfo: "",
      periodInfoWeeks: 0,
      whetherGroup: 0,
      teacherCalendarText: "",
      siteIdDictText: "",
      periodInfoRequireExtra: 0,
      selectionGroupGrades: "",
      updateBy: "",
      scheduleStatus: 0,
      scheduleStatusDictText: "",
      courseNumber: "",
      selectionGroupGradeInfo: "",
      periodInfoTest: 0,
      periodInfoExperimentUnit: "",
      periodInfoMachine: 0,
      createBy: "",
      selectionDepartmentInfo: "",
      targetAudience: "",
      siteId: "",
      beginWeek: null,
      endWeek: null);
}

@JsonSerializable(explicitToJson: true)
class Result {
  Result(
      {required this.records,
      required this.total,
      required this.size,
      required this.current,
      required this.orders,
      required this.optimizeCountSql,
      required this.hitCount,
      required this.searchCount,
      required this.pages});

  @JsonKey(name: "records", defaultValue: [])
  List<ExperimentCourseRecord> records;

  @JsonKey(name: "total", defaultValue: 0)
  int total;

  @JsonKey(name: "size", defaultValue: 0)
  int size;

  @JsonKey(name: "current", defaultValue: 0)
  int current;

  @JsonKey(name: "orders", defaultValue: [])
  List orders;

  @JsonKey(name: "optimizeCountSql", defaultValue: false)
  bool optimizeCountSql;

  @JsonKey(name: "hitCount", defaultValue: false)
  bool hitCount;

  @JsonKey(name: "searchCount", defaultValue: false)
  bool searchCount;

  @JsonKey(name: "pages", defaultValue: 0)
  int pages;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  factory Result.emptyInstance() => Result(
      records: [],
      total: 0,
      size: 0,
      current: 0,
      orders: [],
      optimizeCountSql: false,
      hitCount: false,
      searchCount: false,
      pages: 0);
}
