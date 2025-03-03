// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_scores_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamScoresNewResponse _$ExamScoresNewResponseFromJson(
        Map<String, dynamic> json) =>
    ExamScoresNewResponse(
      examScoresNews: (json['semesterId2studentGrades'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => ExamScoresNew.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          [],
      semesters: (json['semesters'] as List<dynamic>?)
              ?.map((e) => Semesters.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id2semesters: (json['id2semesters'] as List<dynamic>?)
              ?.map((e) => Id2semesters.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExamScoresNewResponseToJson(
        ExamScoresNewResponse instance) =>
    <String, dynamic>{
      'semesterId2studentGrades': instance.examScoresNews
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'semesters': instance.semesters.map((e) => e.toJson()).toList(),
      'id2semesters': instance.id2semesters.map((e) => e.toJson()).toList(),
    };

ExamScoresNew _$ExamScoresNewFromJson(Map<String, dynamic> json) =>
    ExamScoresNew(
      id: (json['id'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? '',
      semesterId: (json['semesterId'] as num?)?.toInt() ?? 0,
      semesterName: json['semesterName'] as String? ?? '',
      courseCode: json['courseCode'] as String? ?? '',
      courseName: json['courseName'] as String? ?? '',
      courseNameEn: json['courseNameEn'] as String? ?? '',
      lessonCode: json['lessonCode'] as String? ?? '',
      lessonName: json['lessonName'] as String? ?? '',
      minorCourseCode: json['minorCourseCode'] as String?,
      minorCourseName: json['minorCourseName'] as String?,
      minorCourseNameEn: json['minorCourseNameEn'] as String?,
      credits: (json['credits'] as num?)?.toDouble() ?? 0.0,
      courseType: json['courseType'] as String? ?? '',
      courseProperty: json['courseProperty'] as String? ?? '',
      gaGrade: json['gaGrade'] as String? ?? '',
      passed: json['passed'] as bool? ?? false,
      gradeDetail: json['gradeDetail'] as String? ?? '',
      published: json['published'] as bool? ?? false,
      compulsory: json['compulsory'] as bool? ?? false,
      unread: json['unread'] as bool? ?? false,
      scores: (json['scores'] as num?)?.toDouble() ?? 0.0,
      gradeGrades: json['gradeGrades'] as String? ?? '',
      creditsCourse: json['creditsCourse'] as bool? ?? false,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$ExamScoresNewToJson(ExamScoresNew instance) =>
    <String, dynamic>{
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'id': instance.id,
      'username': instance.username,
      'semesterId': instance.semesterId,
      'semesterName': instance.semesterName,
      'courseCode': instance.courseCode,
      'courseName': instance.courseName,
      'courseNameEn': instance.courseNameEn,
      'lessonCode': instance.lessonCode,
      'lessonName': instance.lessonName,
      'minorCourseCode': instance.minorCourseCode,
      'minorCourseName': instance.minorCourseName,
      'minorCourseNameEn': instance.minorCourseNameEn,
      'credits': instance.credits,
      'courseType': instance.courseType,
      'courseProperty': instance.courseProperty,
      'gaGrade': instance.gaGrade,
      'scores': instance.scores,
      'gradeGrades': instance.gradeGrades,
      'creditsCourse': instance.creditsCourse,
      'passed': instance.passed,
      'gradeDetail': instance.gradeDetail,
      'published': instance.published,
      'compulsory': instance.compulsory,
      'unread': instance.unread,
    };

Semesters _$SemestersFromJson(Map<String, dynamic> json) => Semesters(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      calendarAssoc: (json['calendarAssoc'] as num?)?.toInt() ?? 0,
      schoolYear: json['schoolYear'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      weekStartOnSunday: json['weekStartOnSunday'] as bool? ?? false,
      countInTerm: json['countInTerm'] as bool? ?? false,
      season: json['season'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      fileInfoAssoc: json['fileInfoAssoc'],
      approvedYear: json['approvedYear'] as String? ?? '',
      lessonGenCode: json['lessonGenCode'] as String? ?? '',
      includeMonths: (json['includeMonths'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SemestersToJson(Semesters instance) => <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'calendarAssoc': instance.calendarAssoc,
      'schoolYear': instance.schoolYear,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'weekStartOnSunday': instance.weekStartOnSunday,
      'countInTerm': instance.countInTerm,
      'season': instance.season,
      'enabled': instance.enabled,
      'fileInfoAssoc': instance.fileInfoAssoc,
      'approvedYear': instance.approvedYear,
      'lessonGenCode': instance.lessonGenCode,
      'includeMonths': instance.includeMonths,
      'transient': instance.transient,
      'name': instance.name,
    };

Id2semesters _$Id2semestersFromJson(Map<String, dynamic> json) => Id2semesters(
      nameZh: json['nameZh'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      calendarAssoc: (json['calendarAssoc'] as num?)?.toInt() ?? 0,
      schoolYear: json['schoolYear'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      weekStartOnSunday: json['weekStartOnSunday'] as bool? ?? false,
      countInTerm: json['countInTerm'] as bool? ?? false,
      season: json['season'] as String? ?? '',
      enabled: json['enabled'] as bool? ?? false,
      fileInfoAssoc: json['fileInfoAssoc'],
      approvedYear: json['approvedYear'] as String? ?? '',
      lessonGenCode: json['lessonGenCode'] as String? ?? '',
      includeMonths: (json['includeMonths'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      transient: json['transient'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$Id2semestersToJson(Id2semesters instance) =>
    <String, dynamic>{
      'nameZh': instance.nameZh,
      'nameEn': instance.nameEn,
      'id': instance.id,
      'code': instance.code,
      'calendarAssoc': instance.calendarAssoc,
      'schoolYear': instance.schoolYear,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'weekStartOnSunday': instance.weekStartOnSunday,
      'countInTerm': instance.countInTerm,
      'season': instance.season,
      'enabled': instance.enabled,
      'fileInfoAssoc': instance.fileInfoAssoc,
      'approvedYear': instance.approvedYear,
      'lessonGenCode': instance.lessonGenCode,
      'includeMonths': instance.includeMonths,
      'transient': instance.transient,
      'name': instance.name,
    };
