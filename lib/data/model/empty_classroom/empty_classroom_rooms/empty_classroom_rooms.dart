import 'package:json_annotation/json_annotation.dart';

part 'empty_classroom_rooms.g.dart';

List<EmptyClassroomRoom> emptyClassroomRoomsListFormJson(List json) =>
    json.map((e) => EmptyClassroomRoom.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> emptyClassroomRoomsListToJson(List<EmptyClassroomRoom> instance) =>
    instance.map((e) => e.toJson()).toList();

@JsonSerializable(explicitToJson: true)
class EmptyClassroomRoom {

  EmptyClassroomRoom(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.floor,
      required this.virtual,
      required this.seatsForLesson,
      required this.enabled,
      required this.experiment});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "floor", defaultValue: 0)
  int floor;

  @JsonKey(name: "virtual", defaultValue: false)
  bool virtual;

  @JsonKey(name: "seatsForLesson", defaultValue: 0)
  int seatsForLesson;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "experiment", defaultValue: false)
  bool experiment;


  factory EmptyClassroomRoom.fromJson(Map<String, dynamic> json) => _$EmptyClassroomRoomFromJson(json);
  
  Map<String, dynamic> toJson() => _$EmptyClassroomRoomToJson(this);
  
  factory EmptyClassroomRoom.emptyInstance() => EmptyClassroomRoom(id: 0, nameZh: "", code: "", floor: 0, virtual: false, seatsForLesson: 0, enabled: false, experiment: false);
}


