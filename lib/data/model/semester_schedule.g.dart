// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterSchedule _$SemesterScheduleFromJson(Map<String, dynamic> json) =>
    SemesterSchedule(
      id: json['id'] as int? ?? 0,
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
      maximumSelectable: json['maximumSelectable'] as int? ?? 0,
      selected: json['selected'] as int? ?? 0,
      credits: (json['credits'] as num?)?.toDouble() ?? 0.0,
      isLab: json['isLab'] as bool? ?? false,
      labId: json['labId'] as String? ?? '',
      batch: json['batch'] as int,
      assistantNo: json['assistantNo'] as String? ?? '',
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => Lessons.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SemesterScheduleToJson(SemesterSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
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
      'maximumSelectable': instance.maximumSelectable,
      'selected': instance.selected,
      'credits': instance.credits,
      'isLab': instance.isLab,
      'labId': instance.labId,
      'batch': instance.batch,
      'assistantNo': instance.assistantNo,
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
    };

Lessons _$LessonsFromJson(Map<String, dynamic> json) => Lessons(
      starWeek: json['batch'] as int? ?? 0,
      endWeek: json['endWeek'] as int? ?? 0,
      oddWeek: json['oddWeek'] as bool? ?? false,
      weekday: json['weekday'] as int? ?? 0,
      section: json['section'] as int? ?? 0,
      experiment: json['experiment'] as String? ?? '',
      classroom: json['classroom'] as String? ?? '',
      classroomAlias: json['classroomAlias'] as String? ?? '',
      classroomId: json['classroomId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$LessonsToJson(Lessons instance) => <String, dynamic>{
      'comment': instance.comment,
      'experiment': instance.experiment,
      'classroom': instance.classroom,
      'classroomAlias': instance.classroomAlias,
      'classroomId': instance.classroomId,
      'batch': instance.starWeek,
      'endWeek': instance.endWeek,
      'oddWeek': instance.oddWeek,
      'weekday': instance.weekday,
      'section': instance.section,
    };
