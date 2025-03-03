// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperimentBatchResponse _$ExperimentBatchResponseFromJson(
        Map<String, dynamic> json) =>
    ExperimentBatchResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => ExperimentBatch.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExperimentBatchResponseToJson(
        ExperimentBatchResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'timestamp': instance.timestamp,
    };

ExperimentBatchItem _$ExperimentBatchItemFromJson(Map<String, dynamic> json) =>
    ExperimentBatchItem(
      id: json['id'] as String? ?? '',
      schoolTime: json['schoolTime'] as String? ?? '',
      weekNum: (json['weekNum'] as num?)?.toInt() ?? 0,
      weekDay: (json['weekDay'] as num?)?.toInt() ?? 0,
      lessonBegin: (json['lessonBegin'] as num?)?.toInt() ?? 0,
      lessonEnd: (json['lessonEnd'] as num?)?.toInt() ?? 0,
      publishFlag: (json['publishFlag'] as num?)?.toInt() ?? 0,
      subjectId: json['subjectId'] as String? ?? '',
      subjectName: json['subjectName'] as String? ?? '',
      relation: json['relation'] as String? ?? '',
      departId: json['departId'] as String? ?? '',
      campusId: json['campusId'] as String? ?? '',
      minCount: (json['minCount'] as num?)?.toInt() ?? 0,
      conflictFlag: (json['conflictFlag'] as num?)?.toInt() ?? 0,
      maxCount: (json['maxCount'] as num?)?.toInt() ?? 0,
      selectCount: (json['selectCount'] as num?)?.toInt() ?? 0,
      selectRule: (json['selectRule'] as num?)?.toInt() ?? 0,
      selectEndTime: json['selectEndTime'] as String? ?? '',
      selectBeginTime: json['selectBeginTime'] as String? ?? '',
      flag: (json['flag'] as num?)?.toInt() ?? 0,
      calendarId: json['calendarId'] as String? ?? '',
      courseId: json['courseId'] as String? ?? '',
      createBy: json['createBy'] as String? ?? '',
      createTime: json['createTime'] as String? ?? '',
      updateBy: json['updateBy'] as String? ?? '',
      updateTime: json['updateTime'] as String? ?? '',
      labId: json['labId'] as String? ?? '',
      labName: json['labName'] as String? ?? '',
      labCount: (json['labCount'] as num?)?.toInt() ?? 0,
      tecId: json['tecId'] as String? ?? '',
      tecName: json['tecName'] as String? ?? '',
      sectionString: json['sectionString'] as String? ?? '',
      weekAndDate: json['weekAndDate'] as String? ?? '',
    );

Map<String, dynamic> _$ExperimentBatchItemToJson(
        ExperimentBatchItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolTime': instance.schoolTime,
      'weekNum': instance.weekNum,
      'weekDay': instance.weekDay,
      'lessonBegin': instance.lessonBegin,
      'lessonEnd': instance.lessonEnd,
      'publishFlag': instance.publishFlag,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'relation': instance.relation,
      'departId': instance.departId,
      'campusId': instance.campusId,
      'minCount': instance.minCount,
      'conflictFlag': instance.conflictFlag,
      'maxCount': instance.maxCount,
      'selectCount': instance.selectCount,
      'selectRule': instance.selectRule,
      'selectEndTime': instance.selectEndTime,
      'selectBeginTime': instance.selectBeginTime,
      'flag': instance.flag,
      'calendarId': instance.calendarId,
      'courseId': instance.courseId,
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
      'labId': instance.labId,
      'labName': instance.labName,
      'labCount': instance.labCount,
      'tecId': instance.tecId,
      'tecName': instance.tecName,
      'sectionString': instance.sectionString,
      'weekAndDate': instance.weekAndDate,
    };

ExperimentBatch _$ExperimentBatchFromJson(Map<String, dynamic> json) =>
    ExperimentBatch(
      isEnding: json['isEnding'] as bool? ?? false,
      week: (json['week'] as num?)?.toInt() ?? 0,
      isTheoryConflict: json['isTheoryConflict'] as bool? ?? false,
      isConflict: json['isConflict'] as bool? ?? false,
      selectCount: (json['selectCount'] as num?)?.toInt() ?? 0,
      isFull: json['isFull'] as bool? ?? false,
      list: (json['list'] as List<dynamic>?)
              ?.map((e) =>
                  ExperimentBatchItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hasCount: (json['hasCount'] as num?)?.toInt() ?? 0,
      notBegin: json['notBegin'] as bool? ?? false,
    );

Map<String, dynamic> _$ExperimentBatchToJson(ExperimentBatch instance) =>
    <String, dynamic>{
      'isEnding': instance.isEnding,
      'week': instance.week,
      'isTheoryConflict': instance.isTheoryConflict,
      'isConflict': instance.isConflict,
      'selectCount': instance.selectCount,
      'isFull': instance.isFull,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'hasCount': instance.hasCount,
      'notBegin': instance.notBegin,
    };
