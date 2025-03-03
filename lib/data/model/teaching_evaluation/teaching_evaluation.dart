import 'package:json_annotation/json_annotation.dart';

part 'teaching_evaluation.g.dart';

@JsonSerializable(explicitToJson: true)
class TeachingEvaluationResponse {

  TeachingEvaluationResponse(
      {required this.code,
      required this.msg,
      required this.data,
      required this.ok});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: TeachingEvaluationData.emptyInstance)
  TeachingEvaluationData data;

  @JsonKey(name: "ok", defaultValue: false)
  bool ok;


  factory TeachingEvaluationResponse.fromJson(Map<String, dynamic> json) => _$TeachingEvaluationResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeachingEvaluationResponseToJson(this);
  
  factory TeachingEvaluationResponse.emptyInstance() => TeachingEvaluationResponse(code: 0, msg: "", data: TeachingEvaluationData.emptyInstance(), ok: false);
}

@JsonSerializable(explicitToJson: true)
class CultivateType {

  CultivateType(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.enabled,
      required this.bizTypes,
      required this.name});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "bizTypes", defaultValue: [])
  List bizTypes;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory CultivateType.fromJson(Map<String, dynamic> json) => _$CultivateTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$CultivateTypeToJson(this);
  
  factory CultivateType.emptyInstance() => CultivateType(id: "", nameZh: "", nameEn: "", code: "", enabled: false, bizTypes: [], name: "");
}

@JsonSerializable(explicitToJson: true)
class Teachers {

  Teachers(
      {required this.stdSumTaskId,
      required this.teacherId,
      required this.personId,
      this.portraitId,
      required this.role,
      required this.num,
      required this.teacherName,
      required this.status,
      required this.code,
      this.previewFile});

  @JsonKey(name: "stdSumTaskId", defaultValue: "")
  String stdSumTaskId;

  @JsonKey(name: "teacherId", defaultValue: "")
  String teacherId;

  @JsonKey(name: "personId", defaultValue: "")
  String personId;

  @JsonKey(name: "portraitId")
  dynamic portraitId;

  @JsonKey(name: "role", defaultValue: "")
  String role;

  @JsonKey(name: "num", defaultValue: 0)
  int num;

  @JsonKey(name: "teacherName", defaultValue: "")
  String teacherName;

  @JsonKey(name: "status", defaultValue: "")
  String status;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "previewFile")
  dynamic previewFile;


  factory Teachers.fromJson(Map<String, dynamic> json) => _$TeachersFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeachersToJson(this);
  
  factory Teachers.emptyInstance() => Teachers(stdSumTaskId: "", teacherId: "", personId: "", role: "", num: 0, teacherName: "", status: "", code: "");
}

@JsonSerializable(explicitToJson: true)
class Task {

  Task(
      {required this.stdSumEvaBatchId,
      required this.showTotalScore,
      required this.showQuestionScore,
      required this.evaluationQuestionnaireId,
      required this.evaluationQuestionnaireName,
      required this.teachers,
      required this.timeStatus,
      this.hours,
      this.minutes,
      required this.days,
      this.autoPublishDeadline,
      required this.stdSumTaskId});

  @JsonKey(name: "stdSumEvaBatchId", defaultValue: "")
  String stdSumEvaBatchId;

  @JsonKey(name: "showTotalScore", defaultValue: false)
  bool showTotalScore;

  @JsonKey(name: "showQuestionScore", defaultValue: false)
  bool showQuestionScore;

  @JsonKey(name: "evaluationQuestionnaireId", defaultValue: "")
  String evaluationQuestionnaireId;

  @JsonKey(name: "evaluationQuestionnaireName", defaultValue: "")
  String evaluationQuestionnaireName;

  @JsonKey(name: "teachers", defaultValue: [])
  List<Teachers> teachers;

  @JsonKey(name: "timeStatus", defaultValue: false)
  bool timeStatus;

  @JsonKey(name: "hours")
  dynamic hours;

  @JsonKey(name: "minutes")
  dynamic minutes;

  @JsonKey(name: "days", defaultValue: "")
  String days;

  @JsonKey(name: "autoPublishDeadline")
  dynamic autoPublishDeadline;

  @JsonKey(name: "stdSumTaskId", defaultValue: "")
  String stdSumTaskId;


  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  
  Map<String, dynamic> toJson() => _$TaskToJson(this);
  
  factory Task.emptyInstance() => Task(stdSumEvaBatchId: "", showTotalScore: false, showQuestionScore: false, evaluationQuestionnaireId: "", evaluationQuestionnaireName: "", teachers: [], timeStatus: false, days: "", stdSumTaskId: "");
}

@JsonSerializable(explicitToJson: true)
class TeachingEvaluationItem {

  TeachingEvaluationItem(
      {required this.lessonId,
      required this.studentId,
      required this.cultivateType,
      required this.courseName,
      required this.lessonCode,
      required this.lessonNameZh,
      required this.majorStatus,
      required this.minorStatus,
      required this.assistantStatus,
      required this.taskList,
      required this.status});

  @JsonKey(name: "lessonId", defaultValue: "")
  String lessonId;

  @JsonKey(name: "studentId", defaultValue: "")
  String studentId;

  @JsonKey(name: "cultivateType", defaultValue: CultivateType.emptyInstance)
  CultivateType cultivateType;

  @JsonKey(name: "courseName", defaultValue: "")
  String courseName;

  @JsonKey(name: "lessonCode", defaultValue: "")
  String lessonCode;

  @JsonKey(name: "lessonNameZh", defaultValue: "")
  String lessonNameZh;

  @JsonKey(name: "majorStatus", defaultValue: false)
  bool majorStatus;

  @JsonKey(name: "minorStatus", defaultValue: false)
  bool minorStatus;

  @JsonKey(name: "assistantStatus", defaultValue: false)
  bool assistantStatus;

  @JsonKey(name: "taskList", defaultValue: [])
  List<Task> taskList;

  @JsonKey(name: "status", defaultValue: false)
  bool status;


  factory TeachingEvaluationItem.fromJson(Map<String, dynamic> json) => _$TeachingEvaluationItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeachingEvaluationItemToJson(this);
  
  factory TeachingEvaluationItem.emptyInstance() => TeachingEvaluationItem(lessonId: "", studentId: "", cultivateType: CultivateType.emptyInstance(), courseName: "", lessonCode: "", lessonNameZh: "", majorStatus: false, minorStatus: false, assistantStatus: false, taskList: [], status: false);
}

@JsonSerializable(explicitToJson: true)
class Param {

  Param(
      {required this.no});

  @JsonKey(name: "no", defaultValue: "")
  String no;


  factory Param.fromJson(Map<String, dynamic> json) => _$ParamFromJson(json);
  
  Map<String, dynamic> toJson() => _$ParamToJson(this);
  
  factory Param.emptyInstance() => Param(no: "");
}

@JsonSerializable(explicitToJson: true)
class TeachingEvaluationData {

  TeachingEvaluationData(
      {required this.data,
      required this.param});

  @JsonKey(name: "data", defaultValue: [])
  List<TeachingEvaluationItem> data;

  @JsonKey(name: "param", defaultValue: Param.emptyInstance)
  Param param;


  factory TeachingEvaluationData.fromJson(Map<String, dynamic> json) => _$TeachingEvaluationDataFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeachingEvaluationDataToJson(this);
  
  factory TeachingEvaluationData.emptyInstance() => TeachingEvaluationData(data: [], param: Param.emptyInstance());
}


