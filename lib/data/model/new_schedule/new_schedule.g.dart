// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewSchedule _$NewScheduleFromJson(Map<String, dynamic> json) => NewSchedule(
      studentTableVms: (json['studentTableVms'] as List<dynamic>?)
              ?.map((e) => StudentTableVms.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$NewScheduleToJson(NewSchedule instance) =>
    <String, dynamic>{
      'studentTableVms':
          instance.studentTableVms.map((e) => e.toJson()).toList(),
    };

CourseType _$CourseTypeFromJson(Map<String, dynamic> json) => CourseType(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      creditsCourse: json['creditsCourse'] as bool? ?? false,
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
      'bizTypeIds': instance.bizTypeIds,
      'transient': instance.transient,
      'creditsCourse': instance.creditsCourse,
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
      requirePractice: json['requirePractice'],
      focusPractice: json['focusPractice'],
      focusPracticeUnit: json['focusPracticeUnit'],
      dispersedPractice: json['dispersedPractice'],
      test: json['test'],
      testUnit: json['testUnit'],
      requireTest: json['requireTest'],
      experiment: json['experiment'],
      experimentUnit: json['experimentUnit'],
      requireExperiment: json['requireExperiment'],
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

Activities _$ActivitiesFromJson(Map<String, dynamic> json) => Activities(
      lessonId: json['lessonId'] as num? ?? 0,
      lessonCode: json['lessonCode'] as String? ?? '',
      lessonName: json['lessonName'] as String? ?? '',
      courseCode: json['courseCode'] as String?,
      courseName: json['courseName'] as String? ?? '',
      weeksStr: json['weeksStr'] as String? ?? '',
      weekIndexes: (json['weekIndexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      room: json['room'] as String?,
      building: json['building'] as String?,
      campus: json['campus'] as String?,
      weekday: json['weekday'] as num? ?? 0,
      startUnit: json['startUnit'] as num? ?? 0,
      endUnit: json['endUnit'] as num? ?? 0,
      startUnitName: json['startUnitName'] as num? ?? 0,
      endUnitName: json['endUnitName'] as num? ?? 0,
      lessonRemark: json['lessonRemark'] as String?,
      teachers: (json['teachers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      courseType: json['courseType'] == null
          ? null
          : CourseType.fromJson(json['courseType'] as Map<String, dynamic>),
      credits: (json['credits'] as num?)?.toDouble(),
      periodInfo: json['periodInfo'] == null
          ? null
          : PeriodInfo.fromJson(json['periodInfo'] as Map<String, dynamic>),
      stdCount: json['stdCount'] as num? ?? 0,
      limitCount: json['limitCount'] as num? ?? 0,
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      groupNum: json['groupNum'],
      semesterId: json['semesterId'] as num?,
      taskPeopleNum: json['taskPeopleNum'],
      roomDescribe: json['roomDescribe'] as String? ?? '',
      projectName: json['projectName'] as String? ?? '',
      projectCode: json['projectCode'] as String? ?? '',
    )..lesson = json['lesson'] == null
        ? null
        : NewCourseLesson.fromJson(json['lesson'] as Map<String, dynamic>);

Map<String, dynamic> _$ActivitiesToJson(Activities instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'lessonCode': instance.lessonCode,
      'lessonName': instance.lessonName,
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'weeksStr': instance.weeksStr,
      'weekIndexes': instance.weekIndexes,
      'room': instance.room,
      'building': instance.building,
      'campus': instance.campus,
      'weekday': instance.weekday,
      'startUnit': instance.startUnit,
      'endUnit': instance.endUnit,
      'startUnitName': instance.startUnitName,
      'endUnitName': instance.endUnitName,
      'lessonRemark': instance.lessonRemark,
      'teachers': instance.teachers,
      'courseType': instance.courseType?.toJson(),
      'credits': instance.credits,
      'periodInfo': instance.periodInfo?.toJson(),
      'stdCount': instance.stdCount,
      'limitCount': instance.limitCount,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'groupNum': instance.groupNum,
      'semesterId': instance.semesterId,
      'taskPeopleNum': instance.taskPeopleNum,
      'roomDescribe': instance.roomDescribe,
      'projectName': instance.projectName,
      'projectCode': instance.projectCode,
      'lesson': instance.lesson?.toJson(),
    };

RequiredPeriodInfo _$RequiredPeriodInfoFromJson(Map<String, dynamic> json) =>
    RequiredPeriodInfo(
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
      experiment: json['experiment'],
      experimentUnit: json['experimentUnit'],
      requireExperiment: json['requireExperiment'],
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

Map<String, dynamic> _$RequiredPeriodInfoToJson(RequiredPeriodInfo instance) =>
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

DateTimeText _$DateTimeTextFromJson(Map<String, dynamic> json) => DateTimeText(
      textZh: json['textZh'] as String? ?? '',
      textEn: json['textEn'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$DateTimeTextToJson(DateTimeText instance) =>
    <String, dynamic>{
      'textZh': instance.textZh,
      'textEn': instance.textEn,
      'text': instance.text,
    };

DateTimePlaceText _$DateTimePlaceTextFromJson(Map<String, dynamic> json) =>
    DateTimePlaceText(
      textZh: json['textZh'] as String? ?? '',
      textEn: json['textEn'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$DateTimePlaceTextToJson(DateTimePlaceText instance) =>
    <String, dynamic>{
      'textZh': instance.textZh,
      'textEn': instance.textEn,
      'text': instance.text,
    };

DateTimePlacePersonText _$DateTimePlacePersonTextFromJson(
        Map<String, dynamic> json) =>
    DateTimePlacePersonText(
      textZh: json['textZh'] as String? ?? '',
      textEn: json['textEn'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$DateTimePlacePersonTextToJson(
        DateTimePlacePersonText instance) =>
    <String, dynamic>{
      'textZh': instance.textZh,
      'textEn': instance.textEn,
      'text': instance.text,
    };

RoomSeatText _$RoomSeatTextFromJson(Map<String, dynamic> json) => RoomSeatText(
      textZh: json['textZh'] as String? ?? '',
      textEn: json['textEn'] as String? ?? '',
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$RoomSeatTextToJson(RoomSeatText instance) =>
    <String, dynamic>{
      'textZh': instance.textZh,
      'textEn': instance.textEn,
      'text': instance.text,
    };

ScheduleText _$ScheduleTextFromJson(Map<String, dynamic> json) => ScheduleText(
      dateTimeText: json['dateTimeText'] == null
          ? DateTimeText.emptyInstance()
          : DateTimeText.fromJson(json['dateTimeText'] as Map<String, dynamic>),
      dateTimePlaceText: json['dateTimePlaceText'] == null
          ? DateTimePlaceText.emptyInstance()
          : DateTimePlaceText.fromJson(
              json['dateTimePlaceText'] as Map<String, dynamic>),
      dateTimePlacePersonText: json['dateTimePlacePersonText'] == null
          ? DateTimePlacePersonText.emptyInstance()
          : DateTimePlacePersonText.fromJson(
              json['dateTimePlacePersonText'] as Map<String, dynamic>),
      roomSeatText: json['roomSeatText'] == null
          ? RoomSeatText.emptyInstance()
          : RoomSeatText.fromJson(json['roomSeatText'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleTextToJson(ScheduleText instance) =>
    <String, dynamic>{
      'dateTimeText': instance.dateTimeText.toJson(),
      'dateTimePlaceText': instance.dateTimePlaceText.toJson(),
      'dateTimePlacePersonText': instance.dateTimePlacePersonText.toJson(),
      'roomSeatText': instance.roomSeatText.toJson(),
    };

TimeTableLayout _$TimeTableLayoutFromJson(Map<String, dynamic> json) =>
    TimeTableLayout(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      changeMonth: json['changeMonth'],
      changeDayOfMonth: json['changeDayOfMonth'],
    );

Map<String, dynamic> _$TimeTableLayoutToJson(TimeTableLayout instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'enabled': instance.enabled,
      'changeMonth': instance.changeMonth,
      'changeDayOfMonth': instance.changeDayOfMonth,
    };

BizType _$BizTypeFromJson(Map<String, dynamic> json) => BizType(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
    );

Map<String, dynamic> _$BizTypeToJson(BizType instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

Calendar _$CalendarFromJson(Map<String, dynamic> json) => Calendar(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
    );

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      calendar: json['calendar'] == null
          ? Calendar.emptyInstance()
          : Calendar.fromJson(json['calendar'] as Map<String, dynamic>),
      schoolYear: json['schoolYear'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      weekStartOnSunday: json['weekStartOnSunday'] as bool? ?? false,
      countInTerm: json['countInTerm'] as bool? ?? false,
      season: json['season'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      fileInfo: json['fileInfo'],
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'calendar': instance.calendar.toJson(),
      'schoolYear': instance.schoolYear,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'weekStartOnSunday': instance.weekStartOnSunday,
      'countInTerm': instance.countInTerm,
      'season': instance.season,
      'enabled': instance.enabled,
      'fileInfo': instance.fileInfo,
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
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
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
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
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
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
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
      credits: (json['credits'] as num?)?.toDouble() ?? 0,
      calculateGp: json['calculateGp'] as bool? ?? false,
      theory: json['theory'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      practice: json['practice'] as bool? ?? false,
      test: json['test'] as bool? ?? false,
      machine: json['machine'] as bool? ?? false,
      design: json['design'] as bool? ?? false,
      extra: json['extra'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      extraCredits: (json['extraCredits'] as num?)?.toDouble(),
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
      courseProperty: json['courseProperty'],
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
      'courseProperty': instance.courseProperty,
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

ScheduleAssignDepartment _$ScheduleAssignDepartmentFromJson(
        Map<String, dynamic> json) =>
    ScheduleAssignDepartment(
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

Map<String, dynamic> _$ScheduleAssignDepartmentToJson(
        ScheduleAssignDepartment instance) =>
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
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
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

CourseProperty _$CoursePropertyFromJson(Map<String, dynamic> json) =>
    CourseProperty(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      delayedExam: json['delayedExam'] as bool? ?? false,
      makeUpExam: json['makeUpExam'] as bool? ?? false,
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
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

Campus _$CampusFromJson(Map<String, dynamic> json) => Campus(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$CampusToJson(Campus instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'enabled': instance.enabled,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
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

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
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

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
    };

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      teaching: json['teaching'] as bool? ?? false,
      zaiZhi: json['zaiZhi'] as bool? ?? false,
      hireType: json['hireType'] as String? ?? '',
      researchDirection: json['researchDirection'],
      belongSeries: json['belongSeries'],
      nameZh: json['nameZh'],
      department: json['department'] == null
          ? Department.emptyInstance()
          : Department.fromJson(json['department'] as Map<String, dynamic>),
      researchDepartment: json['researchDepartment'],
      person: json['person'] == null
          ? Person.emptyInstance()
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      title: json['title'],
      type: json['type'],
      major: json['major'],
      preEducation: json['preEducation'],
      degreeType: json['degreeType'],
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'teaching': instance.teaching,
      'zaiZhi': instance.zaiZhi,
      'hireType': instance.hireType,
      'researchDirection': instance.researchDirection,
      'belongSeries': instance.belongSeries,
      'nameZh': instance.nameZh,
      'department': instance.department.toJson(),
      'researchDepartment': instance.researchDepartment,
      'person': instance.person.toJson(),
      'title': instance.title,
      'type': instance.type,
      'major': instance.major,
      'preEducation': instance.preEducation,
      'degreeType': instance.degreeType,
    };

TeacherAssignmentList _$TeacherAssignmentListFromJson(
        Map<String, dynamic> json) =>
    TeacherAssignmentList(
      teacher: json['teacher'] == null
          ? Teacher.emptyInstance()
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      person: json['person'] == null
          ? Person.emptyInstance()
          : Person.fromJson(json['person'] as Map<String, dynamic>),
      role: json['role'] as String? ?? '',
      indexNo: json['indexNo'] as num? ?? 0,
      age: json['age'],
    );

Map<String, dynamic> _$TeacherAssignmentListToJson(
        TeacherAssignmentList instance) =>
    <String, dynamic>{
      'teacher': instance.teacher.toJson(),
      'person': instance.person.toJson(),
      'role': instance.role,
      'indexNo': instance.indexNo,
      'age': instance.age,
    };

AdminclassVms _$AdminclassVmsFromJson(Map<String, dynamic> json) =>
    AdminclassVms(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      stdCount: json['stdCount'] as num? ?? 0,
      planCount: json['planCount'] as num? ?? 0,
      enabled: json['enabled'] as bool? ?? false,
      abbrZh: json['abbrZh'],
      abbrEn: json['abbrEn'],
      remark: json['remark'],
    );

Map<String, dynamic> _$AdminclassVmsToJson(AdminclassVms instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'grade': instance.grade,
      'stdCount': instance.stdCount,
      'planCount': instance.planCount,
      'enabled': instance.enabled,
      'abbrZh': instance.abbrZh,
      'abbrEn': instance.abbrEn,
      'remark': instance.remark,
    };

TeacherScheduleTextVms _$TeacherScheduleTextVmsFromJson(
        Map<String, dynamic> json) =>
    TeacherScheduleTextVms(
      personId: json['personId'] as num? ?? 0,
      teacherId: json['teacherId'],
      scheduleText: json['scheduleText'] as String? ?? '',
    );

Map<String, dynamic> _$TeacherScheduleTextVmsToJson(
        TeacherScheduleTextVms instance) =>
    <String, dynamic>{
      'personId': instance.personId,
      'teacherId': instance.teacherId,
      'scheduleText': instance.scheduleText,
    };

ArrangedLessonSearchVms _$ArrangedLessonSearchVmsFromJson(
        Map<String, dynamic> json) =>
    ArrangedLessonSearchVms(
      id: json['id'] as num? ?? 0,
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      code: json['code'] as String? ?? '',
      remark: json['remark'] as String?,
      requiredPeriodInfo: json['requiredPeriodInfo'] == null
          ? RequiredPeriodInfo.emptyInstance()
          : RequiredPeriodInfo.fromJson(
              json['requiredPeriodInfo'] as Map<String, dynamic>),
      actualPeriods: json['actualPeriods'] as num?,
      scheduleText: json['scheduleText'] == null
          ? ScheduleText.emptyInstance()
          : ScheduleText.fromJson(json['scheduleText'] as Map<String, dynamic>),
      stdCount: json['stdCount'] as num? ?? 0,
      limitCount: json['limitCount'] as num? ?? 0,
      retakeCount: json['retakeCount'] as num?,
      reserveCount: json['reserveCount'] as num? ?? 0,
      suggestScheduleWeeks:
          json['suggestScheduleWeeks'] as List<dynamic>? ?? [],
      calcRelatedAdminclasses:
          json['calcRelatedAdminclasses'] as bool? ?? false,
      adminclassSetup: json['adminclassSetup'] as bool?,
      allowMakeup: json['allowMakeup'] as bool? ?? false,
      allowDelay: json['allowDelay'] as bool?,
      expActualPeriods: json['expActualPeriods'] as num?,
      needAssign: json['needAssign'] as bool? ?? false,
      auto: json['auto'] as bool? ?? false,
      scheduleRemark: json['scheduleRemark'],
      enforce: json['enforce'] as bool? ?? false,
      arrangeExamType: json['arrangeExamType'] as String?,
      arrangeExamTypeZh: json['arrangeExamTypeZh'] as String?,
      lessonKind: json['lessonKind'] as String?,
      selectionRemark: json['selectionRemark'],
      generateSeatNumber: json['generateSeatNumber'] as bool? ?? false,
      midtermRetake: json['midtermRetake'] as bool?,
      actualTheoryPeriod: json['actualTheoryPeriod'] as num? ?? 0,
      actualPracticePeriod: json['actualPracticePeriod'] as num? ?? 0,
      actualTestPeriod: json['actualTestPeriod'] as num? ?? 0,
      actualExperimentPeriod: json['actualExperimentPeriod'] as num? ?? 0,
      actualMachinePeriod: json['actualMachinePeriod'] as num? ?? 0,
      actualDesignPeriod: json['actualDesignPeriod'] as num? ?? 0,
      actualExtraPeriod: json['actualExtraPeriod'] as num? ?? 0,
      auditState: json['auditState'] as String?,
      currentNode: json['currentNode'],
      passed: json['passed'],
      submitDate: json['submitDate'],
      noAttendCount: json['noAttendCount'] as num? ?? 0,
      practiceWeekScheduleText: json['practiceWeekScheduleText'],
      timeTableLayout: json['timeTableLayout'] == null
          ? null
          : TimeTableLayout.fromJson(
              json['timeTableLayout'] as Map<String, dynamic>),
      bizType: json['bizType'] == null
          ? null
          : BizType.fromJson(json['bizType'] as Map<String, dynamic>),
      semester: json['semester'] == null
          ? null
          : Semester.fromJson(json['semester'] as Map<String, dynamic>),
      course: json['course'] == null
          ? Course.emptyInstance()
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      preCourses: json['preCourses'] as List<dynamic>? ?? [],
      courseType: json['courseType'] == null
          ? null
          : CourseType.fromJson(json['courseType'] as Map<String, dynamic>),
      openDepartment: json['openDepartment'] == null
          ? null
          : OpenDepartment.fromJson(
              json['openDepartment'] as Map<String, dynamic>),
      scheduleAssignDepartment: json['scheduleAssignDepartment'] == null
          ? null
          : ScheduleAssignDepartment.fromJson(
              json['scheduleAssignDepartment'] as Map<String, dynamic>),
      scheduleState: json['scheduleState'] as String?,
      examMode: json['examMode'] == null
          ? null
          : ExamMode.fromJson(json['examMode'] as Map<String, dynamic>),
      courseProperty: json['courseProperty'] == null
          ? null
          : CourseProperty.fromJson(
              json['courseProperty'] as Map<String, dynamic>),
      campus: json['campus'] == null
          ? null
          : Campus.fromJson(json['campus'] as Map<String, dynamic>),
      teachLang: json['teachLang'] == null
          ? null
          : TeachLang.fromJson(json['teachLang'] as Map<String, dynamic>),
      roomType: json['roomType'],
      suggestScheduleWeeksInfo: json['suggestScheduleWeeksInfo'] as String?,
      scheduleWeeksInfo: json['scheduleWeeksInfo'] as String?,
      teacherAssignmentList: (json['teacherAssignmentList'] as List<dynamic>?)
              ?.map((e) =>
                  TeacherAssignmentList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      scheduleStartWeek: json['scheduleStartWeek'] as num?,
      scheduleEndWeek: json['scheduleEndWeek'] as num?,
      scheduleCurrentWeek: json['scheduleCurrentWeek'] as num?,
      scheduleChangeWeeks: (json['scheduleChangeWeeks'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      planExamWeek: json['planExamWeek'],
      adminclassIds: (json['adminclassIds'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      adminClasses: json['adminClasses'] as String?,
      adminclassVms: (json['adminclassVms'] as List<dynamic>?)
              ?.map((e) => AdminclassVms.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      minorCourse: json['minorCourse'],
      tags: json['tags'],
      crossBizTypes: json['crossBizTypes'] as List<dynamic>? ?? [],
      courseLevelRequireList:
          json['courseLevelRequireList'] as List<dynamic>? ?? [],
      hasSchedule: json['hasSchedule'] as bool?,
      compulsorys: (json['compulsorys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      courseStdCount: json['courseStdCount'] as num?,
      teacherScheduleTextVms: (json['teacherScheduleTextVms'] as List<dynamic>?)
              ?.map((e) =>
                  TeacherScheduleTextVms.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lessonKindText: json['lessonKindText'] as String?,
      compulsorysStr: json['compulsorysStr'] as String?,
      auditLogVms: json['auditLogVms'],
      examMethod: json['examMethod'],
      examDuration: json['examDuration'],
      teacherAssignmentString: json['teacherAssignmentString'] as String? ?? '',
      teacherAssignmentStr: json['teacherAssignmentStr'] as String? ?? '',
      lessonKindZh: json['lessonKindZh'] as String? ?? '',
      lessonKindEn: json['lessonKindEn'] as String? ?? '',
    );

Map<String, dynamic> _$ArrangedLessonSearchVmsToJson(
        ArrangedLessonSearchVms instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'remark': instance.remark,
      'requiredPeriodInfo': instance.requiredPeriodInfo.toJson(),
      'actualPeriods': instance.actualPeriods,
      'scheduleText': instance.scheduleText.toJson(),
      'stdCount': instance.stdCount,
      'limitCount': instance.limitCount,
      'retakeCount': instance.retakeCount,
      'reserveCount': instance.reserveCount,
      'suggestScheduleWeeks': instance.suggestScheduleWeeks,
      'calcRelatedAdminclasses': instance.calcRelatedAdminclasses,
      'adminclassSetup': instance.adminclassSetup,
      'allowMakeup': instance.allowMakeup,
      'allowDelay': instance.allowDelay,
      'expActualPeriods': instance.expActualPeriods,
      'needAssign': instance.needAssign,
      'auto': instance.auto,
      'scheduleRemark': instance.scheduleRemark,
      'enforce': instance.enforce,
      'arrangeExamType': instance.arrangeExamType,
      'arrangeExamTypeZh': instance.arrangeExamTypeZh,
      'lessonKind': instance.lessonKind,
      'selectionRemark': instance.selectionRemark,
      'generateSeatNumber': instance.generateSeatNumber,
      'midtermRetake': instance.midtermRetake,
      'actualTheoryPeriod': instance.actualTheoryPeriod,
      'actualPracticePeriod': instance.actualPracticePeriod,
      'actualTestPeriod': instance.actualTestPeriod,
      'actualExperimentPeriod': instance.actualExperimentPeriod,
      'actualMachinePeriod': instance.actualMachinePeriod,
      'actualDesignPeriod': instance.actualDesignPeriod,
      'actualExtraPeriod': instance.actualExtraPeriod,
      'auditState': instance.auditState,
      'currentNode': instance.currentNode,
      'passed': instance.passed,
      'submitDate': instance.submitDate,
      'noAttendCount': instance.noAttendCount,
      'practiceWeekScheduleText': instance.practiceWeekScheduleText,
      'timeTableLayout': instance.timeTableLayout?.toJson(),
      'bizType': instance.bizType?.toJson(),
      'semester': instance.semester?.toJson(),
      'course': instance.course.toJson(),
      'preCourses': instance.preCourses,
      'courseType': instance.courseType?.toJson(),
      'openDepartment': instance.openDepartment?.toJson(),
      'scheduleAssignDepartment': instance.scheduleAssignDepartment?.toJson(),
      'scheduleState': instance.scheduleState,
      'examMode': instance.examMode?.toJson(),
      'courseProperty': instance.courseProperty?.toJson(),
      'campus': instance.campus?.toJson(),
      'teachLang': instance.teachLang?.toJson(),
      'roomType': instance.roomType,
      'suggestScheduleWeeksInfo': instance.suggestScheduleWeeksInfo,
      'scheduleWeeksInfo': instance.scheduleWeeksInfo,
      'teacherAssignmentList':
          instance.teacherAssignmentList.map((e) => e.toJson()).toList(),
      'scheduleStartWeek': instance.scheduleStartWeek,
      'scheduleEndWeek': instance.scheduleEndWeek,
      'scheduleCurrentWeek': instance.scheduleCurrentWeek,
      'scheduleChangeWeeks': instance.scheduleChangeWeeks,
      'planExamWeek': instance.planExamWeek,
      'adminclassIds': instance.adminclassIds,
      'adminClasses': instance.adminClasses,
      'adminclassVms': instance.adminclassVms.map((e) => e.toJson()).toList(),
      'minorCourse': instance.minorCourse,
      'tags': instance.tags,
      'crossBizTypes': instance.crossBizTypes,
      'courseLevelRequireList': instance.courseLevelRequireList,
      'hasSchedule': instance.hasSchedule,
      'compulsorys': instance.compulsorys,
      'courseStdCount': instance.courseStdCount,
      'teacherScheduleTextVms':
          instance.teacherScheduleTextVms.map((e) => e.toJson()).toList(),
      'lessonKindText': instance.lessonKindText,
      'compulsorysStr': instance.compulsorysStr,
      'auditLogVms': instance.auditLogVms,
      'examMethod': instance.examMethod,
      'examDuration': instance.examDuration,
      'teacherAssignmentString': instance.teacherAssignmentString,
      'teacherAssignmentStr': instance.teacherAssignmentStr,
      'lessonKindZh': instance.lessonKindZh,
      'lessonKindEn': instance.lessonKindEn,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
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

DegreeType _$DegreeTypeFromJson(Map<String, dynamic> json) => DegreeType(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'],
      id: json['id'] as num? ?? 0,
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypeAssocs: (json['bizTypeAssocs'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      bizTypeIds: (json['bizTypeIds'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DegreeTypeToJson(DegreeType instance) =>
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

MinorCourses _$MinorCoursesFromJson(Map<String, dynamic> json) => MinorCourses(
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
      credits: (json['credits'] as num?)?.toDouble() ?? 0,
      calculateGp: json['calculateGp'] as bool? ?? false,
      theory: json['theory'] as bool? ?? false,
      experiment: json['experiment'] as bool? ?? false,
      practice: json['practice'] as bool? ?? false,
      test: json['test'] as bool? ?? false,
      machine: json['machine'] as bool? ?? false,
      design: json['design'] as bool? ?? false,
      extra: json['extra'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      extraCredits: (json['extraCredits'] as num?)?.toDouble(),
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

CourseUnitList _$CourseUnitListFromJson(Map<String, dynamic> json) =>
    CourseUnitList(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      timeTableLayoutAssoc: json['timeTableLayoutAssoc'] as num? ?? 0,
      indexNo: json['indexNo'] as num? ?? 0,
      startTime: json['startTime'] as num? ?? 0,
      endTime: json['endTime'] as num? ?? 0,
      dayPart: json['dayPart'] as String? ?? '',
      color: json['color'] as String? ?? '',
      changeStartTime: json['changeStartTime'] as num? ?? 0,
      changeEndTime: json['changeEndTime'] as num? ?? 0,
      segmentIndex: json['segmentIndex'] as num? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CourseUnitListToJson(CourseUnitList instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'timeTableLayoutAssoc': instance.timeTableLayoutAssoc,
      'indexNo': instance.indexNo,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'dayPart': instance.dayPart,
      'color': instance.color,
      'changeStartTime': instance.changeStartTime,
      'changeEndTime': instance.changeEndTime,
      'segmentIndex': instance.segmentIndex,
      'name': instance.name,
    };

CourseTablePrintConfigs _$CourseTablePrintConfigsFromJson(
        Map<String, dynamic> json) =>
    CourseTablePrintConfigs(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      unitGroup: (json['unitGroup'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
              .toList() ??
          [],
    );

Map<String, dynamic> _$CourseTablePrintConfigsToJson(
        CourseTablePrintConfigs instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'unitGroup': instance.unitGroup,
    };

StudentTableVms _$StudentTableVmsFromJson(Map<String, dynamic> json) =>
    StudentTableVms(
      id: json['id'] as num? ?? 0,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      department: json['department'] as String? ?? '',
      major: json['major'] as String? ?? '',
      adminclass: json['adminclass'] as String? ?? '',
      credits: (json['credits'] as num?)?.toDouble() ?? 0.0,
      totalRetakeCredits: (json['totalRetakeCredits'] as num?)?.toDouble() ?? 0,
      activities: (json['activities'] as List<dynamic>?)
              ?.map((e) => Activities.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lessonSearchVms: json['lessonSearchVms'] as List<dynamic>? ?? [],
      arrangedLessonSearchVms: (json['arrangedLessonSearchVms']
                  as List<dynamic>?)
              ?.map((e) =>
                  ArrangedLessonSearchVms.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      timeTableLayout: json['timeTableLayout'] == null
          ? TimeTableLayout.emptyInstance()
          : TimeTableLayout.fromJson(
              json['timeTableLayout'] as Map<String, dynamic>),
      courseTablePrintConfigs: (json['courseTablePrintConfigs']
                  as List<dynamic>?)
              ?.map((e) =>
                  CourseTablePrintConfigs.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lessonNamePrint: json['lessonNamePrint'] as bool? ?? false,
      stdCountPrint: json['stdCountPrint'] as bool? ?? false,
      teacherCodePrint: json['teacherCodePrint'] as bool? ?? false,
      teacherTitlePrint: json['teacherTitlePrint'] as bool? ?? false,
      timePrint: json['timePrint'] as bool? ?? false,
      practiceWeekScheduleTexts:
          json['practiceWeekScheduleTexts'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$StudentTableVmsToJson(StudentTableVms instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'grade': instance.grade,
      'department': instance.department,
      'major': instance.major,
      'adminclass': instance.adminclass,
      'credits': instance.credits,
      'totalRetakeCredits': instance.totalRetakeCredits,
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'lessonSearchVms': instance.lessonSearchVms,
      'arrangedLessonSearchVms':
          instance.arrangedLessonSearchVms.map((e) => e.toJson()).toList(),
      'timeTableLayout': instance.timeTableLayout.toJson(),
      'courseTablePrintConfigs':
          instance.courseTablePrintConfigs.map((e) => e.toJson()).toList(),
      'lessonNamePrint': instance.lessonNamePrint,
      'stdCountPrint': instance.stdCountPrint,
      'teacherCodePrint': instance.teacherCodePrint,
      'teacherTitlePrint': instance.teacherTitlePrint,
      'timePrint': instance.timePrint,
      'practiceWeekScheduleTexts': instance.practiceWeekScheduleTexts,
    };
