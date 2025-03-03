import 'package:json_annotation/json_annotation.dart';

part 'experiment_batch_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperimentBatchResponse {

  ExperimentBatchResponse(
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

  @JsonKey(name: "result", defaultValue: [])
  List<ExperimentBatch> result;

  @JsonKey(name: "timestamp", defaultValue: 0)
  int timestamp;


  factory ExperimentBatchResponse.fromJson(Map<String, dynamic> json) => _$ExperimentBatchResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExperimentBatchResponseToJson(this);
  
  factory ExperimentBatchResponse.emptyInstance() => ExperimentBatchResponse(success: false, message: "", code: 0, result: [], timestamp: 0);
}

@JsonSerializable(explicitToJson: true)
class ExperimentBatchItem {

  ExperimentBatchItem(
      {required this.id,
      required this.schoolTime,
      required this.weekNum,
      required this.weekDay,
      required this.lessonBegin,
      required this.lessonEnd,
      required this.publishFlag,
      required this.subjectId,
      required this.subjectName,
      required this.relation,
      required this.departId,
      required this.campusId,
      required this.minCount,
      required this.conflictFlag,
      required this.maxCount,
      required this.selectCount,
      required this.selectRule,
      required this.selectEndTime,
      required this.selectBeginTime,
      required this.flag,
      required this.calendarId,
      required this.courseId,
      required this.createBy,
      required this.createTime,
      required this.updateBy,
      required this.updateTime,
      required this.labId,
      required this.labName,
      required this.labCount,
      required this.tecId,
      required this.tecName,
      required this.sectionString,
      required this.weekAndDate});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "schoolTime", defaultValue: "")
  String schoolTime;

  @JsonKey(name: "weekNum", defaultValue: 0)
  int weekNum;

  @JsonKey(name: "weekDay", defaultValue: 0)
  int weekDay;

  @JsonKey(name: "lessonBegin", defaultValue: 0)
  int lessonBegin;

  @JsonKey(name: "lessonEnd", defaultValue: 0)
  int lessonEnd;

  @JsonKey(name: "publishFlag", defaultValue: 0)
  int publishFlag;

  @JsonKey(name: "subjectId", defaultValue: "")
  String subjectId;

  @JsonKey(name: "subjectName", defaultValue: "")
  String subjectName;

  @JsonKey(name: "relation", defaultValue: "")
  String relation;

  @JsonKey(name: "departId", defaultValue: "")
  String departId;

  @JsonKey(name: "campusId", defaultValue: "")
  String campusId;

  @JsonKey(name: "minCount", defaultValue: 0)
  int minCount;

  @JsonKey(name: "conflictFlag", defaultValue: 0)
  int conflictFlag;

  @JsonKey(name: "maxCount", defaultValue: 0)
  int maxCount;

  @JsonKey(name: "selectCount", defaultValue: 0)
  int selectCount;

  @JsonKey(name: "selectRule", defaultValue: 0)
  int selectRule;

  @JsonKey(name: "selectEndTime", defaultValue: "")
  String selectEndTime;

  @JsonKey(name: "selectBeginTime", defaultValue: "")
  String selectBeginTime;

  @JsonKey(name: "flag", defaultValue: 0)
  int flag;

  @JsonKey(name: "calendarId", defaultValue: "")
  String calendarId;

  @JsonKey(name: "courseId", defaultValue: "")
  String courseId;

  @JsonKey(name: "createBy", defaultValue: "")
  String createBy;

  @JsonKey(name: "createTime", defaultValue: "")
  String createTime;

  @JsonKey(name: "updateBy", defaultValue: "")
  String updateBy;

  @JsonKey(name: "updateTime", defaultValue: "")
  String updateTime;

  @JsonKey(name: "labId", defaultValue: "")
  String labId;

  @JsonKey(name: "labName", defaultValue: "")
  String labName;

  @JsonKey(name: "labCount", defaultValue: 0)
  int labCount;

  @JsonKey(name: "tecId", defaultValue: "")
  String tecId;

  @JsonKey(name: "tecName", defaultValue: "")
  String tecName;

  @JsonKey(name: "sectionString", defaultValue: "")
  String sectionString;

  @JsonKey(name: "weekAndDate", defaultValue: "")
  String weekAndDate;


  factory ExperimentBatchItem.fromJson(Map<String, dynamic> json) => _$ExperimentBatchItemFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExperimentBatchItemToJson(this);
  
  factory ExperimentBatchItem.emptyInstance() => ExperimentBatchItem(id: "", schoolTime: "", weekNum: 0, weekDay: 0, lessonBegin: 0, lessonEnd: 0, publishFlag: 0, subjectId: "", subjectName: "", relation: "", departId: "", campusId: "", minCount: 0, conflictFlag: 0, maxCount: 0, selectCount: 0, selectRule: 0, selectEndTime: "", selectBeginTime: "", flag: 0, calendarId: "", courseId: "", createBy: "", createTime: "", updateBy: "", updateTime: "", labId: "", labName: "", labCount: 0, tecId: "", tecName: "", sectionString: "", weekAndDate: "");
}

@JsonSerializable(explicitToJson: true)
class ExperimentBatch {

  ExperimentBatch(
      {required this.isEnding,
      required this.week,
      required this.isTheoryConflict,
      required this.isConflict,
      required this.selectCount,
      required this.isFull,
      required this.list,
      required this.hasCount,
      required this.notBegin});

  @JsonKey(name: "isEnding", defaultValue: false)
  bool isEnding;

  @JsonKey(name: "week", defaultValue: 0)
  int week;

  @JsonKey(name: "isTheoryConflict", defaultValue: false)
  bool isTheoryConflict;

  @JsonKey(name: "isConflict", defaultValue: false)
  bool isConflict;

  @JsonKey(name: "selectCount", defaultValue: 0)
  int selectCount;

  @JsonKey(name: "isFull", defaultValue: false)
  bool isFull;

  @JsonKey(name: "list", defaultValue: [])
  List<ExperimentBatchItem> list;

  @JsonKey(name: "hasCount", defaultValue: 0)
  int hasCount;

  @JsonKey(name: "notBegin", defaultValue: false)
  bool notBegin;


  factory ExperimentBatch.fromJson(Map<String, dynamic> json) => _$ExperimentBatchFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExperimentBatchToJson(this);
  
  factory ExperimentBatch.emptyInstance() => ExperimentBatch(isEnding: false, week: 0, isTheoryConflict: false, isConflict: false, selectCount: 0, isFull: false, list: [], hasCount: 0, notBegin: false);
}


