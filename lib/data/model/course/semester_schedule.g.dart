// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterSchedule _$SemesterScheduleFromJson(Map<String, dynamic> json) =>
    SemesterSchedule(
      id: json['id'] as String,
      username: json['username'] as String? ?? '',
      isManuallyAdd: json['is_manually_add'] as bool? ?? false,
      updateTime: DateTime.parse(json['updateTime'] as String),
      type: json['type'] as String? ?? '',
      typename: json['typename'] as String? ?? '',
      examType: json['examType'] as String? ?? '',
      collegeName: json['collegeName'] as String? ?? '',
      collegeNo: json['collegeNo'] as String? ?? '',
      majorName: json['majorName'] as String? ?? '',
      majorNo: json['majorNo'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      name: json['name'] as String? ?? '',
      courseNo: json['courseNo'] as String? ?? '',
      teacherNo: json['teacherNo'] as String? ?? '',
      teacher: json['teacher'] as String? ?? '',
      term: json['term'] as String? ?? '',
      courseId: json['courseId'] as String? ?? '',
      capacity: json['capacity'] as int? ?? 0,
      selected: json['selected'] as int? ?? 0,
      credits: (json['credits'] as num?)?.toDouble() ?? 0.0,
      isLab: json['isLab'] as bool? ?? false,
      labLessonId: json['labLessonId'] as String? ?? '',
      batch: json['batch'] as int? ?? 0,
      assistantNo: json['assistantNo'] as String? ?? '',
      startWeek: json['startWeek'] as int? ?? 0,
      endWeek: json['endWeek'] as int? ?? 0,
      oddWeek: json['oddWeek'] as bool? ?? false,
      weekday: json['weekday'] as int? ?? 0,
      section: json['section'] as int? ?? 0,
      experiment: json['experiment'] as String? ?? '',
      classroom: json['classroom'] as String? ?? '',
      classroomAlias: json['classroomAlias'] as String? ?? '',
      classroomId: json['classroomId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
    )..createTime = DateTime.parse(json['createTime'] as String);

Map<String, dynamic> _$SemesterScheduleToJson(SemesterSchedule instance) =>
    <String, dynamic>{
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'id': instance.id,
      'username': instance.username,
      'is_manually_add': instance.isManuallyAdd,
      'type': instance.type,
      'typename': instance.typename,
      'examType': instance.examType,
      'collegeName': instance.collegeName,
      'collegeNo': instance.collegeNo,
      'majorName': instance.majorName,
      'majorNo': instance.majorNo,
      'grade': instance.grade,
      'name': instance.name,
      'courseNo': instance.courseNo,
      'teacherNo': instance.teacherNo,
      'teacher': instance.teacher,
      'term': instance.term,
      'courseId': instance.courseId,
      'capacity': instance.capacity,
      'selected': instance.selected,
      'credits': instance.credits,
      'isLab': instance.isLab,
      'labLessonId': instance.labLessonId,
      'batch': instance.batch,
      'assistantNo': instance.assistantNo,
      'comment': instance.comment,
      'experiment': instance.experiment,
      'classroom': instance.classroom,
      'classroomAlias': instance.classroomAlias,
      'classroomId': instance.classroomId,
      'startWeek': instance.startWeek,
      'endWeek': instance.endWeek,
      'oddWeek': instance.oddWeek,
      'weekday': instance.weekday,
      'section': instance.section,
    };

Classroom _$ClassroomFromJson(Map<String, dynamic> json) => Classroom(
      json['startWeek'] as int? ?? 0,
      json['endWeek'] as int? ?? 0,
      json['room'] as String? ?? '',
    );

Map<String, dynamic> _$ClassroomToJson(Classroom instance) => <String, dynamic>{
      'startWeek': instance.startWeek,
      'endWeek': instance.endWeek,
      'room': instance.room,
    };
