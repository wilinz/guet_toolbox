import 'package:json_annotation/json_annotation.dart';

part 'empty_classroom_query_body.g.dart';

@JsonSerializable(explicitToJson: true)
class EmptyClassroomQueryBody {
  EmptyClassroomQueryBody(
      {this.buildingId,
      required this.campusId,
      this.roomId,
      required this.dateTimeSegmentCmd,
      this.roomType,
       this.seatsForLessonGte,
      required this.hasDataPermission});

  @JsonKey(name: "buildingId")
  String? buildingId;

  @JsonKey(name: "campusId", defaultValue: 0)
  int campusId;

  @JsonKey(name: "roomId")
  String? roomId;

  @JsonKey(
      name: "dateTimeSegmentCmd",
      defaultValue: DateTimeSegmentCmd.emptyInstance)
  DateTimeSegmentCmd dateTimeSegmentCmd;

  @JsonKey(name: "roomType")
  int? roomType;

  @JsonKey(name: "seatsForLessonGte")
  String? seatsForLessonGte;

  @JsonKey(name: "hasDataPermission", defaultValue: false)
  bool hasDataPermission;

  factory EmptyClassroomQueryBody.fromJson(Map<String, dynamic> json) =>
      _$EmptyClassroomQueryBodyFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyClassroomQueryBodyToJson(this);

  factory EmptyClassroomQueryBody.emptyInstance() => EmptyClassroomQueryBody(
      buildingId: "",
      campusId: 0,
      roomId: "",
      dateTimeSegmentCmd: DateTimeSegmentCmd.emptyInstance(),
      roomType: 0,
      seatsForLessonGte: "",
      hasDataPermission: false);
}

@JsonSerializable(explicitToJson: true)
class DateTimeSegmentCmd {
  DateTimeSegmentCmd(
      {required this.startDateTime,
      required this.endDateTime,
      required this.startTime,
      required this.endTime,
      required this.weeks,
      required this.weekdays,
      required this.units});

  @JsonKey(name: "startDateTime")
  String? startDateTime;

  @JsonKey(name: "endDateTime")
  String? endDateTime;

  @JsonKey(name: "startTime", defaultValue: "")
  String startTime;

  @JsonKey(name: "endTime", defaultValue: "")
  String endTime;

  @JsonKey(name: "weeks", defaultValue: [])
  List<String> weeks;

  @JsonKey(name: "weekdays", defaultValue: [])
  List<String> weekdays;

  @JsonKey(name: "units", defaultValue: [])
  List<String> units;

  factory DateTimeSegmentCmd.fromJson(Map<String, dynamic> json) =>
      _$DateTimeSegmentCmdFromJson(json);

  Map<String, dynamic> toJson() => _$DateTimeSegmentCmdToJson(this);

  factory DateTimeSegmentCmd.emptyInstance() => DateTimeSegmentCmd(
      startDateTime: "",
      endDateTime: "",
      startTime: "",
      endTime: "",
      weeks: [],
      weekdays: [],
      units: []);
}
