// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperimentCoursesResponse _$ExperimentCoursesResponseFromJson(
        Map<String, dynamic> json) =>
    ExperimentCoursesResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: json['result'] == null
          ? Result.emptyInstance()
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ExperimentCoursesResponseToJson(
        ExperimentCoursesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
      'result': instance.result.toJson(),
      'timestamp': instance.timestamp,
    };

ExperimentCourseRecord _$ExperimentCourseRecordFromJson(
        Map<String, dynamic> json) =>
    ExperimentCourseRecord(
      academyName: json['academyName'] as String? ?? '',
      selectionAdminclassInfo: json['selectionAdminclassInfo'] as String? ?? '',
      periodInfoPeriodsPerWeek:
          (json['periodInfoPeriodsPerWeek'] as num?)?.toInt() ?? 0,
      importFlag: (json['importFlag'] as num?)?.toInt() ?? 0,
      id: json['id'] as String? ?? '',
      selectionAdminclassIds: json['selectionAdminclassIds'] as String? ?? '',
      taskRelation: json['taskRelation'] as String? ?? '',
      courseName: json['courseName'] as String? ?? '',
      periodInfoRequireTest:
          (json['periodInfoRequireTest'] as num?)?.toInt() ?? 0,
      timetableName: json['timetableName'] as String? ?? '',
      periodInfoFocusPractice:
          (json['periodInfoFocusPractice'] as num?)?.toInt() ?? 0,
      departId: json['departId'] as String? ?? '',
      gradeForm: (json['gradeForm'] as num?)?.toInt() ?? 0,
      periodInfoDesign: (json['periodInfoDesign'] as num?)?.toInt() ?? 0,
      periodInfoRequireTheory:
          (json['periodInfoRequireTheory'] as num?)?.toInt() ?? 0,
      periodInfoRequirePractice:
          (json['periodInfoRequirePractice'] as num?)?.toInt() ?? 0,
      teacherName: json['teacherName'] as String? ?? '',
      academyCode: json['academyCode'] as String? ?? '',
      updateTime: json['updateTime'] as String? ?? '',
      selectionGroupMajorIds: json['selectionGroupMajorIds'] as String? ?? '',
      periodInfoDispersedPractice:
          (json['periodInfoDispersedPractice'] as num?)?.toInt() ?? 0,
      createTime: json['createTime'] as String? ?? '',
      periodInfoPractice: (json['periodInfoPractice'] as num?)?.toInt() ?? 0,
      majorName: json['majorName'] as String? ?? '',
      periodInfoTheoryUnit: json['periodInfoTheoryUnit'] as String? ?? '',
      courseType: json['courseType'] as String? ?? '',
      examType: json['examType'] as String? ?? '',
      teacherCalendarId: json['teacherCalendarId'] as String? ?? '',
      crosschannel: (json['crosschannel'] as num?)?.toInt() ?? 0,
      periodInfoRequireExperiment:
          (json['periodInfoRequireExperiment'] as num?)?.toInt() ?? 0,
      coursePeriod: (json['coursePeriod'] as num?)?.toInt() ?? 0,
      teacherNum: json['teacherNum'] as String? ?? '',
      courseIdDictText: json['courseId_dictText'] as String? ?? '',
      credit: (json['credit'] as num?)?.toDouble() ?? 0.0,
      courseId: json['courseId'] as String? ?? '',
      typeIsSelect: json['typeIsSelect'] as bool? ?? false,
      periodInfoRequireDesign:
          (json['periodInfoRequireDesign'] as num?)?.toInt() ?? 0,
      selectionDepartmentIds: json['selectionDepartmentIds'] as String? ?? '',
      archive: (json['archive'] as num?)?.toInt() ?? 0,
      periodInfoTheory: (json['periodInfoTheory'] as num?)?.toInt() ?? 0,
      periodInfoRequireMachine:
          (json['periodInfoRequireMachine'] as num?)?.toInt() ?? 0,
      periodInfoTotal: (json['periodInfoTotal'] as num?)?.toInt() ?? 0,
      periodInfoExperiment:
          (json['periodInfoExperiment'] as num?)?.toInt() ?? 0,
      periodInfoExtra: (json['periodInfoExtra'] as num?)?.toInt() ?? 0,
      studentCount: (json['studentCount'] as num?)?.toInt() ?? 0,
      selectionGroupMajorInfo: json['selectionGroupMajorInfo'] as String? ?? '',
      periodInfoWeeks: (json['periodInfoWeeks'] as num?)?.toInt() ?? 0,
      whetherGroup: (json['whetherGroup'] as num?)?.toInt() ?? 0,
      teacherCalendarText: json['teacherCalendarText'] as String? ?? '',
      siteIdDictText: json['siteId_dictText'] as String? ?? '',
      periodInfoRequireExtra:
          (json['periodInfoRequireExtra'] as num?)?.toInt() ?? 0,
      selectionGroupGrades: json['selectionGroupGrades'] as String? ?? '',
      updateBy: json['updateBy'] as String? ?? '',
      scheduleStatus: (json['scheduleStatus'] as num?)?.toInt() ?? 0,
      scheduleStatusDictText: json['scheduleStatus_dictText'] as String? ?? '',
      courseNumber: json['courseNumber'] as String? ?? '',
      selectionGroupGradeInfo: json['selectionGroupGradeInfo'] as String? ?? '',
      periodInfoTest: (json['periodInfoTest'] as num?)?.toInt() ?? 0,
      periodInfoExperimentUnit:
          json['periodInfoExperimentUnit'] as String? ?? '',
      periodInfoMachine: (json['periodInfoMachine'] as num?)?.toInt() ?? 0,
      createBy: json['createBy'] as String? ?? '',
      selectionDepartmentInfo: json['selectionDepartmentInfo'] as String? ?? '',
      targetAudience: json['targetAudience'] as String? ?? '',
      siteId: json['siteId'] as String? ?? '',
      beginWeek: (json['beginWeek'] as num?)?.toInt(),
      endWeek: (json['endWeek'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExperimentCourseRecordToJson(
        ExperimentCourseRecord instance) =>
    <String, dynamic>{
      'academyName': instance.academyName,
      'selectionAdminclassInfo': instance.selectionAdminclassInfo,
      'periodInfoPeriodsPerWeek': instance.periodInfoPeriodsPerWeek,
      'importFlag': instance.importFlag,
      'id': instance.id,
      'selectionAdminclassIds': instance.selectionAdminclassIds,
      'taskRelation': instance.taskRelation,
      'courseName': instance.courseName,
      'periodInfoRequireTest': instance.periodInfoRequireTest,
      'timetableName': instance.timetableName,
      'periodInfoFocusPractice': instance.periodInfoFocusPractice,
      'departId': instance.departId,
      'gradeForm': instance.gradeForm,
      'periodInfoDesign': instance.periodInfoDesign,
      'periodInfoRequireTheory': instance.periodInfoRequireTheory,
      'periodInfoRequirePractice': instance.periodInfoRequirePractice,
      'teacherName': instance.teacherName,
      'academyCode': instance.academyCode,
      'updateTime': instance.updateTime,
      'selectionGroupMajorIds': instance.selectionGroupMajorIds,
      'periodInfoDispersedPractice': instance.periodInfoDispersedPractice,
      'createTime': instance.createTime,
      'periodInfoPractice': instance.periodInfoPractice,
      'majorName': instance.majorName,
      'periodInfoTheoryUnit': instance.periodInfoTheoryUnit,
      'courseType': instance.courseType,
      'examType': instance.examType,
      'teacherCalendarId': instance.teacherCalendarId,
      'crosschannel': instance.crosschannel,
      'periodInfoRequireExperiment': instance.periodInfoRequireExperiment,
      'coursePeriod': instance.coursePeriod,
      'teacherNum': instance.teacherNum,
      'courseId_dictText': instance.courseIdDictText,
      'credit': instance.credit,
      'courseId': instance.courseId,
      'typeIsSelect': instance.typeIsSelect,
      'periodInfoRequireDesign': instance.periodInfoRequireDesign,
      'selectionDepartmentIds': instance.selectionDepartmentIds,
      'archive': instance.archive,
      'periodInfoTheory': instance.periodInfoTheory,
      'periodInfoRequireMachine': instance.periodInfoRequireMachine,
      'periodInfoTotal': instance.periodInfoTotal,
      'periodInfoExperiment': instance.periodInfoExperiment,
      'periodInfoExtra': instance.periodInfoExtra,
      'studentCount': instance.studentCount,
      'selectionGroupMajorInfo': instance.selectionGroupMajorInfo,
      'periodInfoWeeks': instance.periodInfoWeeks,
      'whetherGroup': instance.whetherGroup,
      'teacherCalendarText': instance.teacherCalendarText,
      'siteId_dictText': instance.siteIdDictText,
      'periodInfoRequireExtra': instance.periodInfoRequireExtra,
      'selectionGroupGrades': instance.selectionGroupGrades,
      'updateBy': instance.updateBy,
      'scheduleStatus': instance.scheduleStatus,
      'scheduleStatus_dictText': instance.scheduleStatusDictText,
      'courseNumber': instance.courseNumber,
      'selectionGroupGradeInfo': instance.selectionGroupGradeInfo,
      'periodInfoTest': instance.periodInfoTest,
      'periodInfoExperimentUnit': instance.periodInfoExperimentUnit,
      'periodInfoMachine': instance.periodInfoMachine,
      'createBy': instance.createBy,
      'selectionDepartmentInfo': instance.selectionDepartmentInfo,
      'targetAudience': instance.targetAudience,
      'siteId': instance.siteId,
      'beginWeek': instance.beginWeek,
      'endWeek': instance.endWeek,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      records: (json['records'] as List<dynamic>?)
              ?.map((e) =>
                  ExperimentCourseRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      current: (json['current'] as num?)?.toInt() ?? 0,
      orders: json['orders'] as List<dynamic>? ?? [],
      optimizeCountSql: json['optimizeCountSql'] as bool? ?? false,
      hitCount: json['hitCount'] as bool? ?? false,
      searchCount: json['searchCount'] as bool? ?? false,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'records': instance.records.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'size': instance.size,
      'current': instance.current,
      'orders': instance.orders,
      'optimizeCountSql': instance.optimizeCountSql,
      'hitCount': instance.hitCount,
      'searchCount': instance.searchCount,
      'pages': instance.pages,
    };
