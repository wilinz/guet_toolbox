import 'package:floor/floor.dart';
import 'package:guethub/util/datetime.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_schedule.g.dart';

List<ExamSchedule> examScheduleListFormJson(List json) =>
    json.map((e) => ExamSchedule.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> examScheduleListToJson(
        List<ExamSchedule> instance) =>
    instance.map((e) => e.toJson()).toList();

@Entity(tableName: "exam_schedule", primaryKeys: ['id', 'username'])
@JsonSerializable(explicitToJson: true)
class ExamSchedule {
  ExamSchedule(
      {required this.id,
      required this.username,
      required this.time,
      required this.startTime,
      required this.endTime,
      required this.campus,
      required this.building,
      required this.room,
      required this.course,
      required this.tag,
      required this.status,
      required this.section,
      required this.weekday,
      this.week});

  @ColumnInfo(name: "id")
  String id;

  @JsonKey(name: "username", defaultValue: "")
  String username;

  /// Exam: 2024-06-30 14:00~16:00
  @JsonKey(name: "time", defaultValue: "")
  String time;

  @ColumnInfo(name: "start_time")
  @JsonKey(
      name: "start_time",
      fromJson: DateTimeUtils.fromRfc3339,
      toJson: DateTimeUtils.toRfc3339)
  DateTime? startTime;

  @ColumnInfo(name: "end_time")
  @JsonKey(
      name: "end_time",
      fromJson: DateTimeUtils.fromRfc3339,
      toJson: DateTimeUtils.toRfc3339)
  DateTime? endTime;

  @JsonKey(name: "section", defaultValue: 1)
  int section;

  @JsonKey(name: "weekday", defaultValue: 1)
  int weekday;

  @JsonKey(name: "week", defaultValue: null)
  int? week;

  /// Exam: 花江校区
  @JsonKey(name: "campus", defaultValue: "")
  String campus;

  /// Exam: 尧山第二教学楼
  @JsonKey(name: "building", defaultValue: "")
  String building;

  /// Exam: 02207Y
  @JsonKey(name: "room", defaultValue: "")
  String room;

  /// Exam: 信号与系统
  @JsonKey(name: "course", defaultValue: "")
  String course;

  /// 备注，Exam: 期末，补考，缓考
  @JsonKey(name: "tag", defaultValue: "")
  String tag;

  /// 状态，Exam: 已结束
  @JsonKey(name: "status", defaultValue: "")
  String status;

  factory ExamSchedule.fromJson(Map<String, dynamic> json) =>
      _$ExamScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ExamScheduleToJson(this);

  factory ExamSchedule.emptyInstance() => ExamSchedule(
      id: "",
      username: "",
      time: "",
      campus: "",
      building: "",
      room: "",
      course: "",
      tag: "",
      status: "",
      startTime: null,
      endTime: null,
      section: 1,
      weekday: 1,
      week: null);
}
