// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_completion_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramCompletionInfo _$ProgramCompletionInfoFromJson(
        Map<String, dynamic> json) =>
    ProgramCompletionInfo(
      id: json['id'] as num? ?? 0,
      type: json['type'],
      requireInfo: json['requireInfo'] == null
          ? RequireInfo.emptyInstance()
          : RequireInfo.fromJson(json['requireInfo'] as Map<String, dynamic>),
      limitInfo: json['limitInfo'] == null
          ? LimitInfo.emptyInstance()
          : LimitInfo.fromJson(json['limitInfo'] as Map<String, dynamic>),
      remark: json['remark'],
      reference: json['reference'] as bool? ?? false,
      copy: json['copy'] as bool? ?? false,
      index: json['index'] as num? ?? 0,
      coursePlanId: json['coursePlanId'],
      referenceModuleAssoc: json['referenceModuleAssoc'],
      parentCourseModules: json['parentCourseModules'] as List<dynamic>? ?? [],
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => Children.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      planCourses: json['planCourses'] as List<dynamic>? ?? [],
      programAssoc: json['programAssoc'],
      majorDirection: json['majorDirection'],
      errors: json['errors'],
      program: json['program'],
      hasChildren: json['hasChildren'] as bool? ?? false,
      courseModuleRequireCredits: json['courseModuleRequireCredits'],
      sumChildrenCreditsUpperLimit: json['sumChildrenCreditsUpperLimit'],
      sumChildrenCourseNumUpperLimit: json['sumChildrenCourseNumUpperLimit'],
      sumPlanCourseCredits: json['sumPlanCourseCredits'],
      sumPlanCourseCreditsOrZero:
          json['sumPlanCourseCreditsOrZero'] as String? ?? '',
      sumCompulsoryPlanCourseCredits: json['sumCompulsoryPlanCourseCredits'],
      sumPlanCourseNum: json['sumPlanCourseNum'],
      creditByModuleType: json['creditByModuleType'] == null
          ? CreditByModuleType.emptyInstance()
          : CreditByModuleType.fromJson(
              json['creditByModuleType'] as Map<String, dynamic>),
      numByModuleType: json['numByModuleType'] == null
          ? NumByModuleType.emptyInstance()
          : NumByModuleType.fromJson(
              json['numByModuleType'] as Map<String, dynamic>),
      creditBySubModule: json['creditBySubModule'] == null
          ? CreditBySubModule.emptyInstance()
          : CreditBySubModule.fromJson(
              json['creditBySubModule'] as Map<String, dynamic>),
      numBySubModule: json['numBySubModule'] == null
          ? NumBySubModule.emptyInstance()
          : NumBySubModule.fromJson(
              json['numBySubModule'] as Map<String, dynamic>),
      periodInfoRatio: json['periodInfoRatio'] == null
          ? PeriodInfoRatio.emptyInstance()
          : PeriodInfoRatio.fromJson(
              json['periodInfoRatio'] as Map<String, dynamic>),
      sumChildrenNum: json['sumChildrenNum'] as num? ?? 0,
      sumChildrenNumOrZero: json['sumChildrenNumOrZero'] as num? ?? 0,
      sumChildrenRequiredCredits:
          json['sumChildrenRequiredCredits'] as num? ?? 0,
      sumChildrenRequiredCreditsOrZero:
          json['sumChildrenRequiredCreditsOrZero'] as String? ?? '',
      sumChildrenRequiredSubModuleNum: json['sumChildrenRequiredSubModuleNum'],
      sumChildrenRequiredCourseNum: json['sumChildrenRequiredCourseNum'],
    );

Map<String, dynamic> _$ProgramCompletionInfoToJson(
        ProgramCompletionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'requireInfo': instance.requireInfo.toJson(),
      'limitInfo': instance.limitInfo.toJson(),
      'remark': instance.remark,
      'reference': instance.reference,
      'copy': instance.copy,
      'index': instance.index,
      'coursePlanId': instance.coursePlanId,
      'referenceModuleAssoc': instance.referenceModuleAssoc,
      'parentCourseModules': instance.parentCourseModules,
      'children': instance.children.map((e) => e.toJson()).toList(),
      'planCourses': instance.planCourses,
      'programAssoc': instance.programAssoc,
      'majorDirection': instance.majorDirection,
      'errors': instance.errors,
      'program': instance.program,
      'hasChildren': instance.hasChildren,
      'courseModuleRequireCredits': instance.courseModuleRequireCredits,
      'sumChildrenCreditsUpperLimit': instance.sumChildrenCreditsUpperLimit,
      'sumChildrenCourseNumUpperLimit': instance.sumChildrenCourseNumUpperLimit,
      'sumPlanCourseCredits': instance.sumPlanCourseCredits,
      'sumPlanCourseCreditsOrZero': instance.sumPlanCourseCreditsOrZero,
      'sumCompulsoryPlanCourseCredits': instance.sumCompulsoryPlanCourseCredits,
      'sumPlanCourseNum': instance.sumPlanCourseNum,
      'creditByModuleType': instance.creditByModuleType.toJson(),
      'numByModuleType': instance.numByModuleType.toJson(),
      'creditBySubModule': instance.creditBySubModule.toJson(),
      'numBySubModule': instance.numBySubModule.toJson(),
      'periodInfoRatio': instance.periodInfoRatio.toJson(),
      'sumChildrenNum': instance.sumChildrenNum,
      'sumChildrenNumOrZero': instance.sumChildrenNumOrZero,
      'sumChildrenRequiredCredits': instance.sumChildrenRequiredCredits,
      'sumChildrenRequiredCreditsOrZero':
          instance.sumChildrenRequiredCreditsOrZero,
      'sumChildrenRequiredSubModuleNum':
          instance.sumChildrenRequiredSubModuleNum,
      'sumChildrenRequiredCourseNum': instance.sumChildrenRequiredCourseNum,
    };

RequireInfo _$RequireInfoFromJson(Map<String, dynamic> json) => RequireInfo(
      requiredSubModuleNum: json['requiredSubModuleNum'] as num? ?? 0,
      requiredCredits: json['requiredCredits'] as num? ?? 0,
      requiredCourseNum: json['requiredCourseNum'] as num? ?? 0,
      requiredCreditsOrZero: json['requiredCreditsOrZero'] as String? ?? '',
    );

Map<String, dynamic> _$RequireInfoToJson(RequireInfo instance) =>
    <String, dynamic>{
      'requiredSubModuleNum': instance.requiredSubModuleNum,
      'requiredCredits': instance.requiredCredits,
      'requiredCourseNum': instance.requiredCourseNum,
      'requiredCreditsOrZero': instance.requiredCreditsOrZero,
    };

LimitInfo _$LimitInfoFromJson(Map<String, dynamic> json) => LimitInfo(
      creditsUpperLimit: json['creditsUpperLimit'],
      courseNumUpperLimit: json['courseNumUpperLimit'],
    );

Map<String, dynamic> _$LimitInfoToJson(LimitInfo instance) => <String, dynamic>{
      'creditsUpperLimit': instance.creditsUpperLimit,
      'courseNumUpperLimit': instance.courseNumUpperLimit,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

PeriodInfo _$PeriodInfoFromJson(Map<String, dynamic> json) => PeriodInfo(
      total: json['total'] as num? ?? 0,
      weeks: (json['weeks'] as num?)?.toDouble() ?? 0.0,
      theory: json['theory'] as num? ?? 0,
      theoryUnit: json['theoryUnit'] as String? ?? '',
      requireTheory: json['requireTheory'] as num? ?? 0,
      practice: json['practice'],
      practiceUnit: json['practiceUnit'],
      requirePractice: json['requirePractice'] as num? ?? 0,
      focusPractice: json['focusPractice'] as num? ?? 0,
      focusPracticeUnit: json['focusPracticeUnit'] as String? ?? '',
      dispersedPractice: json['dispersedPractice'],
      test: json['test'],
      testUnit: json['testUnit'],
      requireTest: json['requireTest'],
      experiment: json['experiment'] as num? ?? 0,
      experimentUnit: json['experimentUnit'] as String? ?? '',
      requireExperiment: json['requireExperiment'] as num? ?? 0,
      machine: json['machine'],
      machineUnit: json['machineUnit'],
      requireMachine: json['requireMachine'],
      design: json['design'],
      designUnit: json['designUnit'],
      requireDesign: json['requireDesign'],
      periodsPerWeek: json['periodsPerWeek'] as num? ?? 0,
      extra: json['extra'],
      extraUnit: json['extraUnit'],
      requireExtra: json['requireExtra'],
    );

Map<String, dynamic> _$PeriodInfoToJson(PeriodInfo instance) =>
    <String, dynamic>{
      'total': instance.total,
      'weeks': instance.weeks,
      'theory': instance.theory,
      'theoryUnit': instance.theoryUnit,
      'requireTheory': instance.requireTheory,
      'practice': instance.practice,
      'practiceUnit': instance.practiceUnit,
      'requirePractice': instance.requirePractice,
      'focusPractice': instance.focusPractice,
      'focusPracticeUnit': instance.focusPracticeUnit,
      'dispersedPractice': instance.dispersedPractice,
      'test': instance.test,
      'testUnit': instance.testUnit,
      'requireTest': instance.requireTest,
      'experiment': instance.experiment,
      'experimentUnit': instance.experimentUnit,
      'requireExperiment': instance.requireExperiment,
      'machine': instance.machine,
      'machineUnit': instance.machineUnit,
      'requireMachine': instance.requireMachine,
      'design': instance.design,
      'designUnit': instance.designUnit,
      'requireDesign': instance.requireDesign,
      'periodsPerWeek': instance.periodsPerWeek,
      'extra': instance.extra,
      'extraUnit': instance.extraUnit,
      'requireExtra': instance.requireExtra,
    };

StageInfo _$StageInfoFromJson(Map<String, dynamic> json) => StageInfo(
      stage: json['stage'] as bool? ?? false,
      stageNum: json['stageNum'],
      stageGrantNum: json['stageGrantNum'],
    );

Map<String, dynamic> _$StageInfoToJson(StageInfo instance) => <String, dynamic>{
      'stage': instance.stage,
      'stageNum': instance.stageNum,
      'stageGrantNum': instance.stageGrantNum,
    };

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

CourseType _$CourseTypeFromJson(Map<String, dynamic> json) => CourseType(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      coursePropertyAssoc: json['coursePropertyAssoc'] as num? ?? 0,
      creditsCourse: json['creditsCourse'] as bool? ?? false,
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CourseTypeToJson(CourseType instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'coursePropertyAssoc': instance.coursePropertyAssoc,
      'creditsCourse': instance.creditsCourse,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

DefaultOpenDepart _$DefaultOpenDepartFromJson(Map<String, dynamic> json) =>
    DefaultOpenDepart(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      abbrZh: json['abbrZh'] as String? ?? '',
      abbrEn: json['abbrEn'],
      college: json['college'] as bool? ?? false,
      research: json['research'] as bool? ?? false,
      openCourse: json['openCourse'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      telephone: json['telephone'],
      address: json['address'],
      indexNo: json['indexNo'] as num? ?? 0,
      recruitTypeSet: (json['recruitTypeSet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      recruitTypes: json['recruitTypes'] as String? ?? '',
    );

Map<String, dynamic> _$DefaultOpenDepartToJson(DefaultOpenDepart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'college': instance.college,
      'research': instance.research,
      'openCourse': instance.openCourse,
      'experiment': instance.experiment,
      'telephone': instance.telephone,
      'address': instance.address,
      'indexNo': instance.indexNo,
      'recruitTypeSet': instance.recruitTypeSet,
      'recruitTypes': instance.recruitTypes,
    };

DefaultExamMode _$DefaultExamModeFromJson(Map<String, dynamic> json) =>
    DefaultExamMode(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DefaultExamModeToJson(DefaultExamMode instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

BelongBizType _$BelongBizTypeFromJson(Map<String, dynamic> json) =>
    BelongBizType(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
    );

Map<String, dynamic> _$BelongBizTypeToJson(BelongBizType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

SuitableBizTypes _$SuitableBizTypesFromJson(Map<String, dynamic> json) =>
    SuitableBizTypes(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
    );

Map<String, dynamic> _$SuitableBizTypesToJson(SuitableBizTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

MngtDepartment _$MngtDepartmentFromJson(Map<String, dynamic> json) =>
    MngtDepartment(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      abbrZh: json['abbrZh'] as String? ?? '',
      abbrEn: json['abbrEn'],
      college: json['college'] as bool? ?? false,
      research: json['research'] as bool? ?? false,
      openCourse: json['openCourse'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      telephone: json['telephone'],
      address: json['address'],
      indexNo: json['indexNo'] as num? ?? 0,
      recruitTypeSet: (json['recruitTypeSet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      recruitTypes: json['recruitTypes'] as String? ?? '',
    );

Map<String, dynamic> _$MngtDepartmentToJson(MngtDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'college': instance.college,
      'research': instance.research,
      'openCourse': instance.openCourse,
      'experiment': instance.experiment,
      'telephone': instance.telephone,
      'address': instance.address,
      'indexNo': instance.indexNo,
      'recruitTypeSet': instance.recruitTypeSet,
      'recruitTypes': instance.recruitTypes,
    };

TeachLang _$TeachLangFromJson(Map<String, dynamic> json) => TeachLang(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TeachLangToJson(TeachLang instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

CourseProperty _$CoursePropertyFromJson(Map<String, dynamic> json) =>
    CourseProperty(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      delayedExam: json['delayedExam'] as bool? ?? false,
      makeUpExam: json['makeUpExam'] as bool? ?? false,
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CoursePropertyToJson(CourseProperty instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'delayedExam': instance.delayedExam,
      'makeUpExam': instance.makeUpExam,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      periodInfo: json['periodInfo'] == null
          ? PeriodInfo.emptyInstance()
          : PeriodInfo.fromJson(json['periodInfo'] as Map<String, dynamic>),
      stageInfo: json['stageInfo'] == null
          ? StageInfo.emptyInstance()
          : StageInfo.fromJson(json['stageInfo'] as Map<String, dynamic>),
      credits: json['credits'] as num? ?? 0,
      calculateGp: json['calculateGp'] as bool? ?? false,
      theory: json['theory'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      practice: json['practice'] as bool? ?? false,
      test: json['test'] as bool? ?? false,
      machine: json['machine'] as bool? ?? false,
      design: json['design'] as bool? ?? false,
      extra: json['extra'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      extraCredits: json['extraCredits'],
      remark: json['remark'],
      flags: json['flags'] as List<dynamic>? ?? [],
      flag: json['flag'],
      platformLink: json['platformLink'],
      claim: json['claim'],
      allowMakeUp: json['allowMakeUp'] as bool? ?? false,
      allowDelay: json['allowDelay'] as bool? ?? false,
      education: json['education'] == null
          ? Education.emptyInstance()
          : Education.fromJson(json['education'] as Map<String, dynamic>),
      courseType: json['courseType'] == null
          ? CourseType.emptyInstance()
          : CourseType.fromJson(json['courseType'] as Map<String, dynamic>),
      defaultOpenDepart: json['defaultOpenDepart'] == null
          ? DefaultOpenDepart.emptyInstance()
          : DefaultOpenDepart.fromJson(
              json['defaultOpenDepart'] as Map<String, dynamic>),
      grantCourseLevel: json['grantCourseLevel'],
      defaultExamMode: json['defaultExamMode'] == null
          ? DefaultExamMode.emptyInstance()
          : DefaultExamMode.fromJson(
              json['defaultExamMode'] as Map<String, dynamic>),
      defaultPreCourses: json['defaultPreCourses'] as List<dynamic>? ?? [],
      belongBizType: json['belongBizType'] == null
          ? BelongBizType.emptyInstance()
          : BelongBizType.fromJson(
              json['belongBizType'] as Map<String, dynamic>),
      suitableBizTypes: (json['suitableBizTypes'] as List<dynamic>?)
              ?.map((e) => SuitableBizTypes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mngtDepartment: json['mngtDepartment'] == null
          ? MngtDepartment.emptyInstance()
          : MngtDepartment.fromJson(
              json['mngtDepartment'] as Map<String, dynamic>),
      teachLang: json['teachLang'] == null
          ? TeachLang.emptyInstance()
          : TeachLang.fromJson(json['teachLang'] as Map<String, dynamic>),
      minorCourses: json['minorCourses'] as List<dynamic>? ?? [],
      tags: json['tags'],
      lessonType: json['lessonType'] as String? ?? '',
      seasons: json['seasons'] as List<dynamic>? ?? [],
      suitMajors: json['suitMajors'] as List<dynamic>? ?? [],
      courseTaxon: json['courseTaxon'],
      courseProperty: json['courseProperty'] == null
          ? CourseProperty.emptyInstance()
          : CourseProperty.fromJson(
              json['courseProperty'] as Map<String, dynamic>),
      openResearchDepartment: json['openResearchDepartment'],
      defaultOpenMajor: json['defaultOpenMajor'],
      courseManager: json['courseManager'],
      courseSpec: json['courseSpec'],
      professor: json['professor'],
      textbooks: json['textbooks'] as List<dynamic>? ?? [],
      courseLevelRequireList:
          json['courseLevelRequireList'] as List<dynamic>? ?? [],
      defaultPreCourseList:
          json['defaultPreCourseList'] as List<dynamic>? ?? [],
      teachType: json['teachType'],
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'periodInfo': instance.periodInfo.toJson(),
      'stageInfo': instance.stageInfo.toJson(),
      'credits': instance.credits,
      'calculateGp': instance.calculateGp,
      'theory': instance.theory,
      'experiment': instance.experiment,
      'practice': instance.practice,
      'test': instance.test,
      'machine': instance.machine,
      'design': instance.design,
      'extra': instance.extra,
      'enabled': instance.enabled,
      'extraCredits': instance.extraCredits,
      'remark': instance.remark,
      'flags': instance.flags,
      'flag': instance.flag,
      'platformLink': instance.platformLink,
      'claim': instance.claim,
      'allowMakeUp': instance.allowMakeUp,
      'allowDelay': instance.allowDelay,
      'education': instance.education.toJson(),
      'courseType': instance.courseType.toJson(),
      'defaultOpenDepart': instance.defaultOpenDepart.toJson(),
      'grantCourseLevel': instance.grantCourseLevel,
      'defaultExamMode': instance.defaultExamMode.toJson(),
      'defaultPreCourses': instance.defaultPreCourses,
      'belongBizType': instance.belongBizType.toJson(),
      'suitableBizTypes':
          instance.suitableBizTypes.map((e) => e.toJson()).toList(),
      'mngtDepartment': instance.mngtDepartment.toJson(),
      'teachLang': instance.teachLang.toJson(),
      'minorCourses': instance.minorCourses,
      'tags': instance.tags,
      'lessonType': instance.lessonType,
      'seasons': instance.seasons,
      'suitMajors': instance.suitMajors,
      'courseTaxon': instance.courseTaxon,
      'courseProperty': instance.courseProperty.toJson(),
      'openResearchDepartment': instance.openResearchDepartment,
      'defaultOpenMajor': instance.defaultOpenMajor,
      'courseManager': instance.courseManager,
      'courseSpec': instance.courseSpec,
      'professor': instance.professor,
      'textbooks': instance.textbooks,
      'courseLevelRequireList': instance.courseLevelRequireList,
      'defaultPreCourseList': instance.defaultPreCourseList,
      'teachType': instance.teachType,
    };

OpenDepartment _$OpenDepartmentFromJson(Map<String, dynamic> json) =>
    OpenDepartment(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      abbrZh: json['abbrZh'] as String? ?? '',
      abbrEn: json['abbrEn'],
      college: json['college'] as bool? ?? false,
      research: json['research'] as bool? ?? false,
      openCourse: json['openCourse'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      telephone: json['telephone'],
      address: json['address'],
      indexNo: json['indexNo'] as num? ?? 0,
      recruitTypeSet: (json['recruitTypeSet'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      recruitTypes: json['recruitTypes'] as String? ?? '',
    );

Map<String, dynamic> _$OpenDepartmentToJson(OpenDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'college': instance.college,
      'research': instance.research,
      'openCourse': instance.openCourse,
      'experiment': instance.experiment,
      'telephone': instance.telephone,
      'address': instance.address,
      'indexNo': instance.indexNo,
      'recruitTypeSet': instance.recruitTypeSet,
      'recruitTypes': instance.recruitTypes,
    };

ExamMode _$ExamModeFromJson(Map<String, dynamic> json) => ExamMode(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ExamModeToJson(ExamMode instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypeAssocs': instance.bizTypeAssocs,
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'name': instance.name,
    };

PlanCourses _$PlanCoursesFromJson(Map<String, dynamic> json) => PlanCourses(
      id: json['id'] as num? ?? 0,
      compulsory: json['compulsory'] as bool? ?? false,
      terms:
          (json['terms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      suggestTerms: json['suggestTerms'] as List<dynamic>? ?? [],
      termsText: json['termsText'],
      index: json['index'] as num? ?? 0,
      suggestTermsText: json['suggestTermsText'],
      readableTerms: (json['readableTerms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      readableSuggestTerms:
          json['readableSuggestTerms'] as List<dynamic>? ?? [],
      remark: json['remark'],
      periodInfo: json['periodInfo'] == null
          ? PeriodInfo.emptyInstance()
          : PeriodInfo.fromJson(json['periodInfo'] as Map<String, dynamic>),
      course: json['course'] == null
          ? Course.emptyInstance()
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      openDepartment: json['openDepartment'] == null
          ? OpenDepartment.emptyInstance()
          : OpenDepartment.fromJson(
              json['openDepartment'] as Map<String, dynamic>),
      preCourses: json['preCourses'] as List<dynamic>? ?? [],
      planCourseMarks: json['planCourseMarks'] as List<dynamic>? ?? [],
      examMode: json['examMode'] == null
          ? ExamMode.emptyInstance()
          : ExamMode.fromJson(json['examMode'] as Map<String, dynamic>),
      courseProperty: json['courseProperty'] == null
          ? CourseProperty.emptyInstance()
          : CourseProperty.fromJson(
              json['courseProperty'] as Map<String, dynamic>),
      courseType: json['courseType'] == null
          ? CourseType.emptyInstance()
          : CourseType.fromJson(json['courseType'] as Map<String, dynamic>),
      suggestScheduleWeeksInfo:
          json['suggestScheduleWeeksInfo'] as String? ?? '',
      suggestScheduleWeeks:
          json['suggestScheduleWeeks'] as List<dynamic>? ?? [],
      parentCourseModuleIds: (json['parentCourseModuleIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      teachLang: json['teachLang'] == null
          ? null
          : TeachLang.fromJson(json['teachLang'] as Map<String, dynamic>),
      campusPlanTerms: (json['campusPlanTerms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      defaultPreCourseList:
          json['defaultPreCourseList'] as List<dynamic>? ?? [],
      creditsCourse: json['creditsCourse'] as bool? ?? false,
    );

Map<String, dynamic> _$PlanCoursesToJson(PlanCourses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'compulsory': instance.compulsory,
      'terms': instance.terms,
      'suggestTerms': instance.suggestTerms,
      'termsText': instance.termsText,
      'index': instance.index,
      'suggestTermsText': instance.suggestTermsText,
      'readableTerms': instance.readableTerms,
      'readableSuggestTerms': instance.readableSuggestTerms,
      'remark': instance.remark,
      'periodInfo': instance.periodInfo.toJson(),
      'course': instance.course.toJson(),
      'openDepartment': instance.openDepartment.toJson(),
      'preCourses': instance.preCourses,
      'planCourseMarks': instance.planCourseMarks,
      'examMode': instance.examMode.toJson(),
      'courseProperty': instance.courseProperty.toJson(),
      'courseType': instance.courseType.toJson(),
      'suggestScheduleWeeksInfo': instance.suggestScheduleWeeksInfo,
      'suggestScheduleWeeks': instance.suggestScheduleWeeks,
      'parentCourseModuleIds': instance.parentCourseModuleIds,
      'teachLang': instance.teachLang?.toJson(),
      'campusPlanTerms': instance.campusPlanTerms,
      'defaultPreCourseList': instance.defaultPreCourseList,
      'creditsCourse': instance.creditsCourse,
    };

MinorCourses _$MinorCoursesFromJson(Map<String, dynamic> json) => MinorCourses(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String?,
      code: json['code'] as String? ?? '',
      periodInfo: json['periodInfo'] == null
          ? PeriodInfo.emptyInstance()
          : PeriodInfo.fromJson(json['periodInfo'] as Map<String, dynamic>),
      stageInfo: json['stageInfo'] == null
          ? StageInfo.emptyInstance()
          : StageInfo.fromJson(json['stageInfo'] as Map<String, dynamic>),
      credits: json['credits'] as num? ?? 0,
      calculateGp: json['calculateGp'] as bool? ?? false,
      theory: json['theory'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      practice: json['practice'] as bool? ?? false,
      test: json['test'] as bool? ?? false,
      machine: json['machine'] as bool? ?? false,
      design: json['design'] as bool? ?? false,
      extra: json['extra'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      extraCredits: json['extraCredits'],
      remark: json['remark'],
      flags: json['flags'] as List<dynamic>? ?? [],
      flag: json['flag'] as String?,
      platformLink: json['platformLink'],
      claim: json['claim'],
      allowMakeUp: json['allowMakeUp'] as bool? ?? false,
      allowDelay: json['allowDelay'] as bool? ?? false,
    );

Map<String, dynamic> _$MinorCoursesToJson(MinorCourses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'periodInfo': instance.periodInfo.toJson(),
      'stageInfo': instance.stageInfo.toJson(),
      'credits': instance.credits,
      'calculateGp': instance.calculateGp,
      'theory': instance.theory,
      'experiment': instance.experiment,
      'practice': instance.practice,
      'test': instance.test,
      'machine': instance.machine,
      'design': instance.design,
      'extra': instance.extra,
      'enabled': instance.enabled,
      'extraCredits': instance.extraCredits,
      'remark': instance.remark,
      'flags': instance.flags,
      'flag': instance.flag,
      'platformLink': instance.platformLink,
      'claim': instance.claim,
      'allowMakeUp': instance.allowMakeUp,
      'allowDelay': instance.allowDelay,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'],
      entityType: json['entityType'] as String? ?? '',
      effectiveDate: json['effectiveDate'] as String? ?? '',
      expiresDate: json['expiresDate'],
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'entityType': instance.entityType,
      'effectiveDate': instance.effectiveDate,
      'expiresDate': instance.expiresDate,
    };

CreditByModuleType _$CreditByModuleTypeFromJson(Map<String, dynamic> json) =>
    CreditByModuleType(
      generalEducationRequired: json['通识必修'] as num? ?? 0,
    );

Map<String, dynamic> _$CreditByModuleTypeToJson(CreditByModuleType instance) =>
    <String, dynamic>{
      '通识必修': instance.generalEducationRequired,
    };

NumByModuleType _$NumByModuleTypeFromJson(Map<String, dynamic> json) =>
    NumByModuleType(
      generalEducationRequired: json['通识必修'] as num? ?? 0,
    );

Map<String, dynamic> _$NumByModuleTypeToJson(NumByModuleType instance) =>
    <String, dynamic>{
      '通识必修': instance.generalEducationRequired,
    };

CreditBySubModule _$CreditBySubModuleFromJson(Map<String, dynamic> json) =>
    CreditBySubModule();

Map<String, dynamic> _$CreditBySubModuleToJson(CreditBySubModule instance) =>
    <String, dynamic>{};

NumBySubModule _$NumBySubModuleFromJson(Map<String, dynamic> json) =>
    NumBySubModule();

Map<String, dynamic> _$NumBySubModuleToJson(NumBySubModule instance) =>
    <String, dynamic>{};

PeriodInfoRatio _$PeriodInfoRatioFromJson(Map<String, dynamic> json) =>
    PeriodInfoRatio(
      total: json['total'] as num? ?? 0,
      weeks: (json['weeks'] as num?)?.toDouble() ?? 0.0,
      theory: json['theory'] as num? ?? 0,
      theoryUnit: json['theoryUnit'],
      requireTheory: json['requireTheory'],
      practice: json['practice'] as num? ?? 0,
      practiceUnit: json['practiceUnit'],
      requirePractice: json['requirePractice'],
      focusPractice: json['focusPractice'],
      focusPracticeUnit: json['focusPracticeUnit'],
      dispersedPractice: json['dispersedPractice'],
      test: json['test'] as num? ?? 0,
      testUnit: json['testUnit'],
      requireTest: json['requireTest'],
      experiment: json['experiment'] as num? ?? 0,
      experimentUnit: json['experimentUnit'],
      requireExperiment: json['requireExperiment'],
      machine: json['machine'] as num? ?? 0,
      machineUnit: json['machineUnit'],
      requireMachine: json['requireMachine'],
      design: json['design'] as num? ?? 0,
      designUnit: json['designUnit'],
      requireDesign: json['requireDesign'],
      periodsPerWeek: json['periodsPerWeek'] as num? ?? 0,
      extra: json['extra'],
      extraUnit: json['extraUnit'],
      requireExtra: json['requireExtra'],
    );

Map<String, dynamic> _$PeriodInfoRatioToJson(PeriodInfoRatio instance) =>
    <String, dynamic>{
      'total': instance.total,
      'weeks': instance.weeks,
      'theory': instance.theory,
      'theoryUnit': instance.theoryUnit,
      'requireTheory': instance.requireTheory,
      'practice': instance.practice,
      'practiceUnit': instance.practiceUnit,
      'requirePractice': instance.requirePractice,
      'focusPractice': instance.focusPractice,
      'focusPracticeUnit': instance.focusPracticeUnit,
      'dispersedPractice': instance.dispersedPractice,
      'test': instance.test,
      'testUnit': instance.testUnit,
      'requireTest': instance.requireTest,
      'experiment': instance.experiment,
      'experimentUnit': instance.experimentUnit,
      'requireExperiment': instance.requireExperiment,
      'machine': instance.machine,
      'machineUnit': instance.machineUnit,
      'requireMachine': instance.requireMachine,
      'design': instance.design,
      'designUnit': instance.designUnit,
      'requireDesign': instance.requireDesign,
      'periodsPerWeek': instance.periodsPerWeek,
      'extra': instance.extra,
      'extraUnit': instance.extraUnit,
      'requireExtra': instance.requireExtra,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      id: json['id'] as num? ?? 0,
      type: json['type'] == null
          ? Type.emptyInstance()
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      requireInfo: json['requireInfo'] == null
          ? RequireInfo.emptyInstance()
          : RequireInfo.fromJson(json['requireInfo'] as Map<String, dynamic>),
      limitInfo: json['limitInfo'] == null
          ? LimitInfo.emptyInstance()
          : LimitInfo.fromJson(json['limitInfo'] as Map<String, dynamic>),
      remark: json['remark'],
      reference: json['reference'] as bool? ?? false,
      copy: json['copy'] as bool? ?? false,
      index: json['index'] as num? ?? 0,
      coursePlanId: json['coursePlanId'],
      referenceModuleAssoc: json['referenceModuleAssoc'] as num?,
      parentCourseModules: json['parentCourseModules'] as List<dynamic>? ?? [],
      children: json['children'] as List<dynamic>? ?? [],
      planCourses: (json['planCourses'] as List<dynamic>?)
              ?.map((e) => PlanCourses.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      programAssoc: json['programAssoc'],
      majorDirection: json['majorDirection'],
      errors: json['errors'],
      program: json['program'],
      hasChildren: json['hasChildren'] as bool? ?? false,
      courseModuleRequireCredits: json['courseModuleRequireCredits'],
      sumChildrenCreditsUpperLimit: json['sumChildrenCreditsUpperLimit'],
      sumChildrenCourseNumUpperLimit: json['sumChildrenCourseNumUpperLimit'],
      sumPlanCourseCredits: (json['sumPlanCourseCredits'] as num?)?.toDouble(),
      sumPlanCourseCreditsOrZero:
          json['sumPlanCourseCreditsOrZero'] as String? ?? '',
      sumCompulsoryPlanCourseCredits:
          (json['sumCompulsoryPlanCourseCredits'] as num?)?.toDouble(),
      sumPlanCourseNum: json['sumPlanCourseNum'] as num?,
      creditByModuleType: json['creditByModuleType'] == null
          ? CreditByModuleType.emptyInstance()
          : CreditByModuleType.fromJson(
              json['creditByModuleType'] as Map<String, dynamic>),
      numByModuleType: json['numByModuleType'] == null
          ? NumByModuleType.emptyInstance()
          : NumByModuleType.fromJson(
              json['numByModuleType'] as Map<String, dynamic>),
      creditBySubModule: json['creditBySubModule'] == null
          ? CreditBySubModule.emptyInstance()
          : CreditBySubModule.fromJson(
              json['creditBySubModule'] as Map<String, dynamic>),
      numBySubModule: json['numBySubModule'] == null
          ? NumBySubModule.emptyInstance()
          : NumBySubModule.fromJson(
              json['numBySubModule'] as Map<String, dynamic>),
      periodInfoRatio: json['periodInfoRatio'] == null
          ? PeriodInfoRatio.emptyInstance()
          : PeriodInfoRatio.fromJson(
              json['periodInfoRatio'] as Map<String, dynamic>),
      sumChildrenNum: json['sumChildrenNum'],
      sumChildrenNumOrZero: json['sumChildrenNumOrZero'] as num? ?? 0,
      sumChildrenRequiredCredits: json['sumChildrenRequiredCredits'],
      sumChildrenRequiredCreditsOrZero:
          json['sumChildrenRequiredCreditsOrZero'] as String? ?? '',
      sumChildrenRequiredSubModuleNum: json['sumChildrenRequiredSubModuleNum'],
      sumChildrenRequiredCourseNum: json['sumChildrenRequiredCourseNum'],
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type.toJson(),
      'requireInfo': instance.requireInfo.toJson(),
      'limitInfo': instance.limitInfo.toJson(),
      'remark': instance.remark,
      'reference': instance.reference,
      'copy': instance.copy,
      'index': instance.index,
      'coursePlanId': instance.coursePlanId,
      'referenceModuleAssoc': instance.referenceModuleAssoc,
      'parentCourseModules': instance.parentCourseModules,
      'children': instance.children,
      'planCourses': instance.planCourses.map((e) => e.toJson()).toList(),
      'programAssoc': instance.programAssoc,
      'majorDirection': instance.majorDirection,
      'errors': instance.errors,
      'program': instance.program,
      'hasChildren': instance.hasChildren,
      'courseModuleRequireCredits': instance.courseModuleRequireCredits,
      'sumChildrenCreditsUpperLimit': instance.sumChildrenCreditsUpperLimit,
      'sumChildrenCourseNumUpperLimit': instance.sumChildrenCourseNumUpperLimit,
      'sumPlanCourseCredits': instance.sumPlanCourseCredits,
      'sumPlanCourseCreditsOrZero': instance.sumPlanCourseCreditsOrZero,
      'sumCompulsoryPlanCourseCredits': instance.sumCompulsoryPlanCourseCredits,
      'sumPlanCourseNum': instance.sumPlanCourseNum,
      'creditByModuleType': instance.creditByModuleType.toJson(),
      'numByModuleType': instance.numByModuleType.toJson(),
      'creditBySubModule': instance.creditBySubModule.toJson(),
      'numBySubModule': instance.numBySubModule.toJson(),
      'periodInfoRatio': instance.periodInfoRatio.toJson(),
      'sumChildrenNum': instance.sumChildrenNum,
      'sumChildrenNumOrZero': instance.sumChildrenNumOrZero,
      'sumChildrenRequiredCredits': instance.sumChildrenRequiredCredits,
      'sumChildrenRequiredCreditsOrZero':
          instance.sumChildrenRequiredCreditsOrZero,
      'sumChildrenRequiredSubModuleNum':
          instance.sumChildrenRequiredSubModuleNum,
      'sumChildrenRequiredCourseNum': instance.sumChildrenRequiredCourseNum,
    };
