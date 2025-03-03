import 'package:json_annotation/json_annotation.dart';

part 'program_completion_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramCompletionInfo {

  ProgramCompletionInfo(
      {required this.id,
      this.type,
      required this.requireInfo,
      required this.limitInfo,
      this.remark,
      required this.reference,
      required this.copy,
      required this.index,
      this.coursePlanId,
      this.referenceModuleAssoc,
      required this.parentCourseModules,
      required this.children,
      required this.planCourses,
      this.programAssoc,
      this.majorDirection,
      this.errors,
      this.program,
      required this.hasChildren,
      this.courseModuleRequireCredits,
      this.sumChildrenCreditsUpperLimit,
      this.sumChildrenCourseNumUpperLimit,
      this.sumPlanCourseCredits,
      required this.sumPlanCourseCreditsOrZero,
      this.sumCompulsoryPlanCourseCredits,
      this.sumPlanCourseNum,
      required this.creditByModuleType,
      required this.numByModuleType,
      required this.creditBySubModule,
      required this.numBySubModule,
      required this.periodInfoRatio,
      required this.sumChildrenNum,
      required this.sumChildrenNumOrZero,
      required this.sumChildrenRequiredCredits,
      required this.sumChildrenRequiredCreditsOrZero,
      this.sumChildrenRequiredSubModuleNum,
      this.sumChildrenRequiredCourseNum});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "type")
  dynamic type;

  @JsonKey(name: "requireInfo", defaultValue: RequireInfo.emptyInstance)
  RequireInfo requireInfo;

  @JsonKey(name: "limitInfo", defaultValue: LimitInfo.emptyInstance)
  LimitInfo limitInfo;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "reference", defaultValue: false)
  bool reference;

  @JsonKey(name: "copy", defaultValue: false)
  bool copy;

  @JsonKey(name: "index", defaultValue: 0)
  num index;

  @JsonKey(name: "coursePlanId")
  dynamic coursePlanId;

  @JsonKey(name: "referenceModuleAssoc")
  dynamic referenceModuleAssoc;

  @JsonKey(name: "parentCourseModules", defaultValue: [])
  List parentCourseModules;

  @JsonKey(name: "children", defaultValue: [])
  List<Children> children;

  @JsonKey(name: "planCourses", defaultValue: [])
  List planCourses;

  @JsonKey(name: "programAssoc")
  dynamic programAssoc;

  @JsonKey(name: "majorDirection")
  dynamic majorDirection;

  @JsonKey(name: "errors")
  dynamic errors;

  @JsonKey(name: "program")
  dynamic program;

  @JsonKey(name: "hasChildren", defaultValue: false)
  bool hasChildren;

  @JsonKey(name: "courseModuleRequireCredits")
  dynamic courseModuleRequireCredits;

  @JsonKey(name: "sumChildrenCreditsUpperLimit")
  dynamic sumChildrenCreditsUpperLimit;

  @JsonKey(name: "sumChildrenCourseNumUpperLimit")
  dynamic sumChildrenCourseNumUpperLimit;

  @JsonKey(name: "sumPlanCourseCredits")
  dynamic sumPlanCourseCredits;

  @JsonKey(name: "sumPlanCourseCreditsOrZero", defaultValue: "")
  String sumPlanCourseCreditsOrZero;

  @JsonKey(name: "sumCompulsoryPlanCourseCredits")
  dynamic sumCompulsoryPlanCourseCredits;

  @JsonKey(name: "sumPlanCourseNum")
  dynamic sumPlanCourseNum;

  @JsonKey(name: "creditByModuleType", defaultValue: CreditByModuleType.emptyInstance)
  CreditByModuleType creditByModuleType;

  @JsonKey(name: "numByModuleType", defaultValue: NumByModuleType.emptyInstance)
  NumByModuleType numByModuleType;

  @JsonKey(name: "creditBySubModule", defaultValue: CreditBySubModule.emptyInstance)
  CreditBySubModule creditBySubModule;

  @JsonKey(name: "numBySubModule", defaultValue: NumBySubModule.emptyInstance)
  NumBySubModule numBySubModule;

  @JsonKey(name: "periodInfoRatio", defaultValue: PeriodInfoRatio.emptyInstance)
  PeriodInfoRatio periodInfoRatio;

  @JsonKey(name: "sumChildrenNum", defaultValue: 0)
  num sumChildrenNum;

  @JsonKey(name: "sumChildrenNumOrZero", defaultValue: 0)
  num sumChildrenNumOrZero;

  @JsonKey(name: "sumChildrenRequiredCredits", defaultValue: 0)
  num sumChildrenRequiredCredits;

  @JsonKey(name: "sumChildrenRequiredCreditsOrZero", defaultValue: "")
  String sumChildrenRequiredCreditsOrZero;

  @JsonKey(name: "sumChildrenRequiredSubModuleNum")
  dynamic sumChildrenRequiredSubModuleNum;

  @JsonKey(name: "sumChildrenRequiredCourseNum")
  dynamic sumChildrenRequiredCourseNum;


  factory ProgramCompletionInfo.fromJson(Map<String, dynamic> json) => _$ProgramCompletionInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$ProgramCompletionInfoToJson(this);
  
  factory ProgramCompletionInfo.emptyInstance() => ProgramCompletionInfo(id: 0, requireInfo: RequireInfo.emptyInstance(), limitInfo: LimitInfo.emptyInstance(), reference: false, copy: false, index: 0, parentCourseModules: [], children: [], planCourses: [], hasChildren: false, sumPlanCourseCreditsOrZero: "", creditByModuleType: CreditByModuleType.emptyInstance(), numByModuleType: NumByModuleType.emptyInstance(), creditBySubModule: CreditBySubModule.emptyInstance(), numBySubModule: NumBySubModule.emptyInstance(), periodInfoRatio: PeriodInfoRatio.emptyInstance(), sumChildrenNum: 0, sumChildrenNumOrZero: 0, sumChildrenRequiredCredits: 0, sumChildrenRequiredCreditsOrZero: "");
}

@JsonSerializable(explicitToJson: true)
class RequireInfo {

  RequireInfo(
      {required this.requiredSubModuleNum,
      required this.requiredCredits,
      required this.requiredCourseNum,
      required this.requiredCreditsOrZero});

  @JsonKey(name: "requiredSubModuleNum", defaultValue: 0)
  num requiredSubModuleNum;

  @JsonKey(name: "requiredCredits", defaultValue: 0)
  num requiredCredits;

  @JsonKey(name: "requiredCourseNum", defaultValue: 0)
  num requiredCourseNum;

  @JsonKey(name: "requiredCreditsOrZero", defaultValue: "")
  String requiredCreditsOrZero;


  factory RequireInfo.fromJson(Map<String, dynamic> json) => _$RequireInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$RequireInfoToJson(this);
  
  factory RequireInfo.emptyInstance() => RequireInfo(requiredSubModuleNum: 0, requiredCredits: 0, requiredCourseNum: 0, requiredCreditsOrZero: "");
}

@JsonSerializable(explicitToJson: true)
class LimitInfo {

  LimitInfo(
      {this.creditsUpperLimit,
      this.courseNumUpperLimit});

  @JsonKey(name: "creditsUpperLimit")
  dynamic creditsUpperLimit;

  @JsonKey(name: "courseNumUpperLimit")
  dynamic courseNumUpperLimit;


  factory LimitInfo.fromJson(Map<String, dynamic> json) => _$LimitInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$LimitInfoToJson(this);
  
  factory LimitInfo.emptyInstance() => LimitInfo();
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
  List<int> bizTypeAssocs;

  @JsonKey(name: "bizTypeIds", defaultValue: [])
  List<int> bizTypeIds;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$TypeToJson(this);
  
  factory Type.emptyInstance() => Type(nameZh: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], bizTypeIds: [], transient: false, name: "");
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
      required this.requirePractice,
      required this.focusPractice,
      required this.focusPracticeUnit,
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

  @JsonKey(name: "experiment", defaultValue: 0)
  num experiment;

  @JsonKey(name: "experimentUnit", defaultValue: "")
  String experimentUnit;

  @JsonKey(name: "requireExperiment", defaultValue: 0)
  num requireExperiment;

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


  factory PeriodInfo.fromJson(Map<String, dynamic> json) => _$PeriodInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$PeriodInfoToJson(this);
  
  factory PeriodInfo.emptyInstance() => PeriodInfo(total: 0, weeks: 0, theory: 0, theoryUnit: "", requireTheory: 0, requirePractice: 0, focusPractice: 0, focusPracticeUnit: "", experiment: 0, experimentUnit: "", requireExperiment: 0, periodsPerWeek: 0);
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
  num id;

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
      required this.coursePropertyAssoc,
      required this.creditsCourse,
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
  List<int> bizTypeAssocs;

  @JsonKey(name: "coursePropertyAssoc", defaultValue: 0)
  num coursePropertyAssoc;

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
  
  factory CourseType.emptyInstance() => CourseType(nameZh: "", id: 0, code: "", enabled: false, bizTypeAssocs: [], coursePropertyAssoc: 0, creditsCourse: false, bizTypeIds: [], transient: false, name: "");
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


  factory DefaultOpenDepart.fromJson(Map<String, dynamic> json) => _$DefaultOpenDepartFromJson(json);
  
  Map<String, dynamic> toJson() => _$DefaultOpenDepartToJson(this);
  
  factory DefaultOpenDepart.emptyInstance() => DefaultOpenDepart(id: 0, nameZh: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
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
  num id;

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
  num id;

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


  factory MngtDepartment.fromJson(Map<String, dynamic> json) => _$MngtDepartmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$MngtDepartmentToJson(this);
  
  factory MngtDepartment.emptyInstance() => MngtDepartment(id: 0, nameZh: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
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
  num id;

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
  num credits;

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
  
  factory Course.emptyInstance() => Course(id: 0, nameZh: "", nameEn: "", code: "", periodInfo: PeriodInfo.emptyInstance(), stageInfo: StageInfo.emptyInstance(), credits: 0, calculateGp: false, theory: false, experiment: false, practice: false, test: false, machine: false, design: false, extra: false, enabled: false, flags: [], allowMakeUp: false, allowDelay: false, education: Education.emptyInstance(), courseType: CourseType.emptyInstance(), defaultOpenDepart: DefaultOpenDepart.emptyInstance(), defaultExamMode: DefaultExamMode.emptyInstance(), defaultPreCourses: [], belongBizType: BelongBizType.emptyInstance(), suitableBizTypes: [], mngtDepartment: MngtDepartment.emptyInstance(), teachLang: TeachLang.emptyInstance(), minorCourses: [], lessonType: "", seasons: [], suitMajors: [], courseProperty: CourseProperty.emptyInstance(), textbooks: [], courseLevelRequireList: [], defaultPreCourseList: []);
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


  factory OpenDepartment.fromJson(Map<String, dynamic> json) => _$OpenDepartmentFromJson(json);
  
  Map<String, dynamic> toJson() => _$OpenDepartmentToJson(this);
  
  factory OpenDepartment.emptyInstance() => OpenDepartment(id: 0, nameZh: "", code: "", abbrZh: "", college: false, research: false, openCourse: false, experiment: false, indexNo: 0, recruitTypeSet: [], recruitTypes: "");
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
class PlanCourses {

  PlanCourses(
      {required this.id,
      required this.compulsory,
      required this.terms,
      required this.suggestTerms,
      this.termsText,
      required this.index,
      this.suggestTermsText,
      required this.readableTerms,
      required this.readableSuggestTerms,
      this.remark,
      required this.periodInfo,
      required this.course,
      required this.openDepartment,
      required this.preCourses,
      required this.planCourseMarks,
      required this.examMode,
      required this.courseProperty,
      required this.courseType,
      required this.suggestScheduleWeeksInfo,
      required this.suggestScheduleWeeks,
      required this.parentCourseModuleIds,
      this.teachLang,
      required this.campusPlanTerms,
      required this.defaultPreCourseList,
      required this.creditsCourse});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "compulsory", defaultValue: false)
  bool compulsory;

  @JsonKey(name: "terms", defaultValue: [])
  List<String> terms;

  @JsonKey(name: "suggestTerms", defaultValue: [])
  List suggestTerms;

  @JsonKey(name: "termsText")
  dynamic termsText;

  @JsonKey(name: "index", defaultValue: 0)
  num index;

  @JsonKey(name: "suggestTermsText")
  dynamic suggestTermsText;

  @JsonKey(name: "readableTerms", defaultValue: [])
  List<String> readableTerms;

  @JsonKey(name: "readableSuggestTerms", defaultValue: [])
  List readableSuggestTerms;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "periodInfo", defaultValue: PeriodInfo.emptyInstance)
  PeriodInfo periodInfo;

  @JsonKey(name: "course", defaultValue: Course.emptyInstance)
  Course course;

  @JsonKey(name: "openDepartment", defaultValue: OpenDepartment.emptyInstance)
  OpenDepartment openDepartment;

  @JsonKey(name: "preCourses", defaultValue: [])
  List preCourses;

  @JsonKey(name: "planCourseMarks", defaultValue: [])
  List planCourseMarks;

  @JsonKey(name: "examMode", defaultValue: ExamMode.emptyInstance)
  ExamMode examMode;

  @JsonKey(name: "courseProperty", defaultValue: CourseProperty.emptyInstance)
  CourseProperty courseProperty;

  @JsonKey(name: "courseType", defaultValue: CourseType.emptyInstance)
  CourseType courseType;

  @JsonKey(name: "suggestScheduleWeeksInfo", defaultValue: "")
  String suggestScheduleWeeksInfo;

  @JsonKey(name: "suggestScheduleWeeks", defaultValue: [])
  List suggestScheduleWeeks;

  @JsonKey(name: "parentCourseModuleIds", defaultValue: [])
  List<int> parentCourseModuleIds;

  @JsonKey(name: "teachLang")
  TeachLang? teachLang;

  @JsonKey(name: "campusPlanTerms", defaultValue: [])
  List<String> campusPlanTerms;

  @JsonKey(name: "defaultPreCourseList", defaultValue: [])
  List defaultPreCourseList;

  @JsonKey(name: "creditsCourse", defaultValue: false)
  bool creditsCourse;


  factory PlanCourses.fromJson(Map<String, dynamic> json) => _$PlanCoursesFromJson(json);
  
  Map<String, dynamic> toJson() => _$PlanCoursesToJson(this);
  
  factory PlanCourses.emptyInstance() => PlanCourses(id: 0, compulsory: false, terms: [], suggestTerms: [], index: 0, readableTerms: [], readableSuggestTerms: [], periodInfo: PeriodInfo.emptyInstance(), course: Course.emptyInstance(), openDepartment: OpenDepartment.emptyInstance(), preCourses: [], planCourseMarks: [], examMode: ExamMode.emptyInstance(), courseProperty: CourseProperty.emptyInstance(), courseType: CourseType.emptyInstance(), suggestScheduleWeeksInfo: "", suggestScheduleWeeks: [], parentCourseModuleIds: [], campusPlanTerms: [], defaultPreCourseList: [], creditsCourse: false);
}

@JsonSerializable(explicitToJson: true)
class MinorCourses {

  MinorCourses(
      {required this.id,
      required this.nameZh,
      this.nameEn,
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

  @JsonKey(name: "nameEn")
  String? nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "periodInfo", defaultValue: PeriodInfo.emptyInstance)
  PeriodInfo periodInfo;

  @JsonKey(name: "stageInfo", defaultValue: StageInfo.emptyInstance)
  StageInfo stageInfo;

  @JsonKey(name: "credits", defaultValue: 0)
  num credits;

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


  factory MinorCourses.fromJson(Map<String, dynamic> json) => _$MinorCoursesFromJson(json);
  
  Map<String, dynamic> toJson() => _$MinorCoursesToJson(this);
  
  factory MinorCourses.emptyInstance() => MinorCourses(id: 0, nameZh: "", code: "", periodInfo: PeriodInfo.emptyInstance(), stageInfo: StageInfo.emptyInstance(), credits: 0, calculateGp: false, theory: false, experiment: false, practice: false, test: false, machine: false, design: false, extra: false, enabled: false, flags: [], allowMakeUp: false, allowDelay: false);
}

@JsonSerializable(explicitToJson: true)
class Tags {

  Tags(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      this.code,
      required this.entityType,
      required this.effectiveDate,
      this.expiresDate});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code")
  dynamic code;

  @JsonKey(name: "entityType", defaultValue: "")
  String entityType;

  @JsonKey(name: "effectiveDate", defaultValue: "")
  String effectiveDate;

  @JsonKey(name: "expiresDate")
  dynamic expiresDate;


  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
  
  Map<String, dynamic> toJson() => _$TagsToJson(this);
  
  factory Tags.emptyInstance() => Tags(id: 0, nameZh: "", nameEn: "", entityType: "", effectiveDate: "");
}

@JsonSerializable(explicitToJson: true)
class CreditByModuleType {

  CreditByModuleType(
      {required this.generalEducationRequired});

  @JsonKey(name: "通识必修", defaultValue: 0)
  num generalEducationRequired;


  factory CreditByModuleType.fromJson(Map<String, dynamic> json) => _$CreditByModuleTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreditByModuleTypeToJson(this);
  
  factory CreditByModuleType.emptyInstance() => CreditByModuleType(generalEducationRequired: 0);
}

@JsonSerializable(explicitToJson: true)
class NumByModuleType {

  NumByModuleType(
      {required this.generalEducationRequired});

  @JsonKey(name: "通识必修", defaultValue: 0)
  num generalEducationRequired;


  factory NumByModuleType.fromJson(Map<String, dynamic> json) => _$NumByModuleTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$NumByModuleTypeToJson(this);
  
  factory NumByModuleType.emptyInstance() => NumByModuleType(generalEducationRequired: 0);
}

@JsonSerializable(explicitToJson: true)
class CreditBySubModule {

  CreditBySubModule();

  factory CreditBySubModule.fromJson(Map<String, dynamic> json) => _$CreditBySubModuleFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreditBySubModuleToJson(this);
  
  factory CreditBySubModule.emptyInstance() => CreditBySubModule();
}

@JsonSerializable(explicitToJson: true)
class NumBySubModule {

  NumBySubModule(
     );


  factory NumBySubModule.fromJson(Map<String, dynamic> json) => _$NumBySubModuleFromJson(json);
  
  Map<String, dynamic> toJson() => _$NumBySubModuleToJson(this);
  
  factory NumBySubModule.emptyInstance() => NumBySubModule();
}

@JsonSerializable(explicitToJson: true)
class PeriodInfoRatio {

  PeriodInfoRatio(
      {required this.total,
      required this.weeks,
      required this.theory,
      this.theoryUnit,
      this.requireTheory,
      required this.practice,
      this.practiceUnit,
      this.requirePractice,
      this.focusPractice,
      this.focusPracticeUnit,
      this.dispersedPractice,
      required this.test,
      this.testUnit,
      this.requireTest,
      required this.experiment,
      this.experimentUnit,
      this.requireExperiment,
      required this.machine,
      this.machineUnit,
      this.requireMachine,
      required this.design,
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

  @JsonKey(name: "theoryUnit")
  dynamic theoryUnit;

  @JsonKey(name: "requireTheory")
  dynamic requireTheory;

  @JsonKey(name: "practice", defaultValue: 0)
  num practice;

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

  @JsonKey(name: "test", defaultValue: 0)
  num test;

  @JsonKey(name: "testUnit")
  dynamic testUnit;

  @JsonKey(name: "requireTest")
  dynamic requireTest;

  @JsonKey(name: "experiment", defaultValue: 0)
  num experiment;

  @JsonKey(name: "experimentUnit")
  dynamic experimentUnit;

  @JsonKey(name: "requireExperiment")
  dynamic requireExperiment;

  @JsonKey(name: "machine", defaultValue: 0)
  num machine;

  @JsonKey(name: "machineUnit")
  dynamic machineUnit;

  @JsonKey(name: "requireMachine")
  dynamic requireMachine;

  @JsonKey(name: "design", defaultValue: 0)
  num design;

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


  factory PeriodInfoRatio.fromJson(Map<String, dynamic> json) => _$PeriodInfoRatioFromJson(json);
  
  Map<String, dynamic> toJson() => _$PeriodInfoRatioToJson(this);
  
  factory PeriodInfoRatio.emptyInstance() => PeriodInfoRatio(total: 0, weeks: 0, theory: 0, practice: 0, test: 0, experiment: 0, machine: 0, design: 0, periodsPerWeek: 0);
}

@JsonSerializable(explicitToJson: true)
class Children {

  Children(
      {required this.id,
      required this.type,
      required this.requireInfo,
      required this.limitInfo,
      this.remark,
      required this.reference,
      required this.copy,
      required this.index,
      this.coursePlanId,
      this.referenceModuleAssoc,
      required this.parentCourseModules,
      required this.children,
      required this.planCourses,
      this.programAssoc,
      this.majorDirection,
      this.errors,
      this.program,
      required this.hasChildren,
      this.courseModuleRequireCredits,
      this.sumChildrenCreditsUpperLimit,
      this.sumChildrenCourseNumUpperLimit,
      this.sumPlanCourseCredits,
      required this.sumPlanCourseCreditsOrZero,
      this.sumCompulsoryPlanCourseCredits,
      this.sumPlanCourseNum,
      required this.creditByModuleType,
      required this.numByModuleType,
      required this.creditBySubModule,
      required this.numBySubModule,
      required this.periodInfoRatio,
      this.sumChildrenNum,
      required this.sumChildrenNumOrZero,
      this.sumChildrenRequiredCredits,
      required this.sumChildrenRequiredCreditsOrZero,
      this.sumChildrenRequiredSubModuleNum,
      this.sumChildrenRequiredCourseNum});

  @JsonKey(name: "id", defaultValue: 0)
  num id;

  @JsonKey(name: "type", defaultValue: Type.emptyInstance)
  Type type;

  @JsonKey(name: "requireInfo", defaultValue: RequireInfo.emptyInstance)
  RequireInfo requireInfo;

  @JsonKey(name: "limitInfo", defaultValue: LimitInfo.emptyInstance)
  LimitInfo limitInfo;

  @JsonKey(name: "remark")
  dynamic remark;

  @JsonKey(name: "reference", defaultValue: false)
  bool reference;

  @JsonKey(name: "copy", defaultValue: false)
  bool copy;

  @JsonKey(name: "index", defaultValue: 0)
  num index;

  @JsonKey(name: "coursePlanId")
  dynamic coursePlanId;

  @JsonKey(name: "referenceModuleAssoc")
  num? referenceModuleAssoc;

  @JsonKey(name: "parentCourseModules", defaultValue: [])
  List parentCourseModules;

  @JsonKey(name: "children", defaultValue: [])
  List children;

  @JsonKey(name: "planCourses", defaultValue: [])
  List<PlanCourses> planCourses;

  @JsonKey(name: "programAssoc")
  dynamic programAssoc;

  @JsonKey(name: "majorDirection")
  dynamic majorDirection;

  @JsonKey(name: "errors")
  dynamic errors;

  @JsonKey(name: "program")
  dynamic program;

  @JsonKey(name: "hasChildren", defaultValue: false)
  bool hasChildren;

  @JsonKey(name: "courseModuleRequireCredits")
  dynamic courseModuleRequireCredits;

  @JsonKey(name: "sumChildrenCreditsUpperLimit")
  dynamic sumChildrenCreditsUpperLimit;

  @JsonKey(name: "sumChildrenCourseNumUpperLimit")
  dynamic sumChildrenCourseNumUpperLimit;

  @JsonKey(name: "sumPlanCourseCredits")
  double? sumPlanCourseCredits;

  @JsonKey(name: "sumPlanCourseCreditsOrZero", defaultValue: "")
  String sumPlanCourseCreditsOrZero;

  @JsonKey(name: "sumCompulsoryPlanCourseCredits")
  double? sumCompulsoryPlanCourseCredits;

  @JsonKey(name: "sumPlanCourseNum")
  num? sumPlanCourseNum;

  @JsonKey(name: "creditByModuleType", defaultValue: CreditByModuleType.emptyInstance)
  CreditByModuleType creditByModuleType;

  @JsonKey(name: "numByModuleType", defaultValue: NumByModuleType.emptyInstance)
  NumByModuleType numByModuleType;

  @JsonKey(name: "creditBySubModule", defaultValue: CreditBySubModule.emptyInstance)
  CreditBySubModule creditBySubModule;

  @JsonKey(name: "numBySubModule", defaultValue: NumBySubModule.emptyInstance)
  NumBySubModule numBySubModule;

  @JsonKey(name: "periodInfoRatio", defaultValue: PeriodInfoRatio.emptyInstance)
  PeriodInfoRatio periodInfoRatio;

  @JsonKey(name: "sumChildrenNum")
  dynamic sumChildrenNum;

  @JsonKey(name: "sumChildrenNumOrZero", defaultValue: 0)
  num sumChildrenNumOrZero;

  @JsonKey(name: "sumChildrenRequiredCredits")
  dynamic sumChildrenRequiredCredits;

  @JsonKey(name: "sumChildrenRequiredCreditsOrZero", defaultValue: "")
  String sumChildrenRequiredCreditsOrZero;

  @JsonKey(name: "sumChildrenRequiredSubModuleNum")
  dynamic sumChildrenRequiredSubModuleNum;

  @JsonKey(name: "sumChildrenRequiredCourseNum")
  dynamic sumChildrenRequiredCourseNum;


  factory Children.fromJson(Map<String, dynamic> json) => _$ChildrenFromJson(json);
  
  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
  
  factory Children.emptyInstance() => Children(id: 0, type: Type.emptyInstance(), requireInfo: RequireInfo.emptyInstance(), limitInfo: LimitInfo.emptyInstance(), reference: false, copy: false, index: 0, parentCourseModules: [], children: [], planCourses: [], hasChildren: false, sumPlanCourseCreditsOrZero: "", creditByModuleType: CreditByModuleType.emptyInstance(), numByModuleType: NumByModuleType.emptyInstance(), creditBySubModule: CreditBySubModule.emptyInstance(), numBySubModule: NumBySubModule.emptyInstance(), periodInfoRatio: PeriodInfoRatio.emptyInstance(), sumChildrenNumOrZero: 0, sumChildrenRequiredCreditsOrZero: "");
}


