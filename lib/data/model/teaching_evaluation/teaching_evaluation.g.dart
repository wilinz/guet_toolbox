// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teaching_evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeachingEvaluationResponse _$TeachingEvaluationResponseFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationResponse(
      code: (json['code'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
      data: json['data'] == null
          ? TeachingEvaluationData.emptyInstance()
          : TeachingEvaluationData.fromJson(
              json['data'] as Map<String, dynamic>),
      ok: json['ok'] as bool? ?? false,
    );

Map<String, dynamic> _$TeachingEvaluationResponseToJson(
        TeachingEvaluationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data.toJson(),
      'ok': instance.ok,
    };

CultivateType _$CultivateTypeFromJson(Map<String, dynamic> json) =>
    CultivateType(
      id: json['id'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      code: json['code'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      bizTypes: json['bizTypes'] as List<dynamic>? ?? [],
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CultivateTypeToJson(CultivateType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'code': instance.code,
      'enabled': instance.enabled,
      'bizTypes': instance.bizTypes,
      'name': instance.name,
    };

Teachers _$TeachersFromJson(Map<String, dynamic> json) => Teachers(
      stdSumTaskId: json['stdSumTaskId'] as String? ?? '',
      teacherId: json['teacherId'] as String? ?? '',
      personId: json['personId'] as String? ?? '',
      portraitId: json['portraitId'],
      role: json['role'] as String? ?? '',
      num: (json['num'] as num?)?.toInt() ?? 0,
      teacherName: json['teacherName'] as String? ?? '',
      status: json['status'] as String? ?? '',
      code: json['code'] as String? ?? '',
      previewFile: json['previewFile'],
    );

Map<String, dynamic> _$TeachersToJson(Teachers instance) => <String, dynamic>{
      'stdSumTaskId': instance.stdSumTaskId,
      'teacherId': instance.teacherId,
      'personId': instance.personId,
      'portraitId': instance.portraitId,
      'role': instance.role,
      'num': instance.num,
      'teacherName': instance.teacherName,
      'status': instance.status,
      'code': instance.code,
      'previewFile': instance.previewFile,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      stdSumEvaBatchId: json['stdSumEvaBatchId'] as String? ?? '',
      showTotalScore: json['showTotalScore'] as bool? ?? false,
      showQuestionScore: json['showQuestionScore'] as bool? ?? false,
      evaluationQuestionnaireId:
          json['evaluationQuestionnaireId'] as String? ?? '',
      evaluationQuestionnaireName:
          json['evaluationQuestionnaireName'] as String? ?? '',
      teachers: (json['teachers'] as List<dynamic>?)
              ?.map((e) => Teachers.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      timeStatus: json['timeStatus'] as bool? ?? false,
      hours: json['hours'],
      minutes: json['minutes'],
      days: json['days'] as String? ?? '',
      autoPublishDeadline: json['autoPublishDeadline'],
      stdSumTaskId: json['stdSumTaskId'] as String? ?? '',
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'stdSumEvaBatchId': instance.stdSumEvaBatchId,
      'showTotalScore': instance.showTotalScore,
      'showQuestionScore': instance.showQuestionScore,
      'evaluationQuestionnaireId': instance.evaluationQuestionnaireId,
      'evaluationQuestionnaireName': instance.evaluationQuestionnaireName,
      'teachers': instance.teachers.map((e) => e.toJson()).toList(),
      'timeStatus': instance.timeStatus,
      'hours': instance.hours,
      'minutes': instance.minutes,
      'days': instance.days,
      'autoPublishDeadline': instance.autoPublishDeadline,
      'stdSumTaskId': instance.stdSumTaskId,
    };

TeachingEvaluationItem _$TeachingEvaluationItemFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationItem(
      lessonId: json['lessonId'] as String? ?? '',
      studentId: json['studentId'] as String? ?? '',
      cultivateType: json['cultivateType'] == null
          ? CultivateType.emptyInstance()
          : CultivateType.fromJson(
              json['cultivateType'] as Map<String, dynamic>),
      courseName: json['courseName'] as String? ?? '',
      lessonCode: json['lessonCode'] as String? ?? '',
      lessonNameZh: json['lessonNameZh'] as String? ?? '',
      majorStatus: json['majorStatus'] as bool? ?? false,
      minorStatus: json['minorStatus'] as bool? ?? false,
      assistantStatus: json['assistantStatus'] as bool? ?? false,
      taskList: (json['taskList'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$TeachingEvaluationItemToJson(
        TeachingEvaluationItem instance) =>
    <String, dynamic>{
      'lessonId': instance.lessonId,
      'studentId': instance.studentId,
      'cultivateType': instance.cultivateType.toJson(),
      'courseName': instance.courseName,
      'lessonCode': instance.lessonCode,
      'lessonNameZh': instance.lessonNameZh,
      'majorStatus': instance.majorStatus,
      'minorStatus': instance.minorStatus,
      'assistantStatus': instance.assistantStatus,
      'taskList': instance.taskList.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };

Param _$ParamFromJson(Map<String, dynamic> json) => Param(
      no: json['no'] as String? ?? '',
    );

Map<String, dynamic> _$ParamToJson(Param instance) => <String, dynamic>{
      'no': instance.no,
    };

TeachingEvaluationData _$TeachingEvaluationDataFromJson(
        Map<String, dynamic> json) =>
    TeachingEvaluationData(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  TeachingEvaluationItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      param: json['param'] == null
          ? Param.emptyInstance()
          : Param.fromJson(json['param'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeachingEvaluationDataToJson(
        TeachingEvaluationData instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'param': instance.param.toJson(),
    };
