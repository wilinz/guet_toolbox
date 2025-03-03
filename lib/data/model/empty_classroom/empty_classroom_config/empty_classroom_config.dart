import 'package:json_annotation/json_annotation.dart';

part 'empty_classroom_config.g.dart';

@JsonSerializable(explicitToJson: true)
class EmptyClassroomConfig {

  EmptyClassroomConfig(
      {required this.semesterStart,
      required this.semesterWeeks,
      required this.units,
      required this.campus,
      required this.roomTypes,
      required this.weekStartOnSunday});

  @JsonKey(name: "semesterStart", defaultValue: "")
  String semesterStart;

  @JsonKey(name: "semesterWeeks", defaultValue: 0)
  int semesterWeeks;

  @JsonKey(name: "units", defaultValue: [])
  List<Unit> units;

  @JsonKey(name: "campusList", defaultValue: [])
  List<Campus> campus;

  @JsonKey(name: "roomTypeList", defaultValue: [])
  List<RoomType> roomTypes;

  @JsonKey(name: "weekStartOnSunday", defaultValue: false)
  bool weekStartOnSunday;


  factory EmptyClassroomConfig.fromJson(Map<String, dynamic> json) => _$EmptyClassroomConfigFromJson(json);
  
  Map<String, dynamic> toJson() => _$EmptyClassroomConfigToJson(this);
  
  factory EmptyClassroomConfig.emptyInstance() => EmptyClassroomConfig(semesterStart: "", semesterWeeks: 0, units: [], campus: [], roomTypes: [], weekStartOnSunday: false);
}

@JsonSerializable(explicitToJson: true)
class DayPart {

  DayPart(
      {required this.$type,
      required this.$name});

  @JsonKey(name: r"$type", defaultValue: "")
  String $type;

  @JsonKey(name: r"$name", defaultValue: "")
  String $name;


  factory DayPart.fromJson(Map<String, dynamic> json) => _$DayPartFromJson(json);
  
  Map<String, dynamic> toJson() => _$DayPartToJson(this);
  
  factory DayPart.emptyInstance() => DayPart($type: "", $name: "");
}

@JsonSerializable(explicitToJson: true)
class Unit {

  Unit(
      {this.changeTime,
      required this.dayPart,
      required this.name,
      required this.segmentIndex,
      required this.time,
      required this.value});

  @JsonKey(name: "changeTime")
  dynamic changeTime;

  @JsonKey(name: "dayPart", defaultValue: DayPart.emptyInstance)
  DayPart dayPart;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "segmentIndex", defaultValue: 0)
  int segmentIndex;

  @JsonKey(name: "time", defaultValue: "")
  String time;

  @JsonKey(name: "value", defaultValue: "")
  String value;


  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  
  Map<String, dynamic> toJson() => _$UnitToJson(this);
  
  factory Unit.emptyInstance() => Unit(dayPart: DayPart.emptyInstance(), name: "", segmentIndex: 0, time: "", value: "");
}

@JsonSerializable(explicitToJson: true)
class Campus {

  Campus(
      {required this.text,
      required this.value});

  @JsonKey(name: "text", defaultValue: "")
  String text;

  @JsonKey(name: "value", defaultValue: 0)
  int value;


  factory Campus.fromJson(Map<String, dynamic> json) => _$CampusFromJson(json);
  
  Map<String, dynamic> toJson() => _$CampusToJson(this);
  
  factory Campus.emptyInstance() => Campus(text: "", value: 0);
}

@JsonSerializable(explicitToJson: true)
class RoomType {

  RoomType(
      {required this.text,
      required this.value});

  @JsonKey(name: "text", defaultValue: "")
  String text;

  @JsonKey(name: "value", defaultValue: 0)
  int value;


  factory RoomType.fromJson(Map<String, dynamic> json) => _$RoomTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$RoomTypeToJson(this);
  
  factory RoomType.emptyInstance() => RoomType(text: "", value: 0);
}


