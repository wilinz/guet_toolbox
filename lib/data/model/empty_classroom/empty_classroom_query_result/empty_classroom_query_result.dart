import 'package:json_annotation/json_annotation.dart';

part 'empty_classroom_query_result.g.dart';

@JsonSerializable(explicitToJson: true)
class EmptyClassroomQueryResult {

  EmptyClassroomQueryResult(
      {required this.roomList});

  @JsonKey(name: "roomList", defaultValue: [])
  List<Room> roomList;


  factory EmptyClassroomQueryResult.fromJson(Map<String, dynamic> json) => _$EmptyClassroomQueryResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$EmptyClassroomQueryResultToJson(this);
  
  factory EmptyClassroomQueryResult.emptyInstance() => EmptyClassroomQueryResult(roomList: []);
}

@JsonSerializable(explicitToJson: true)
class ResultCampus {

  ResultCampus(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;


  factory ResultCampus.fromJson(Map<String, dynamic> json) => _$ResultCampusFromJson(json);
  
  Map<String, dynamic> toJson() => _$ResultCampusToJson(this);
  
  factory ResultCampus.emptyInstance() => ResultCampus(id: 0, nameZh: "", nameEn: "", code: "");
}

@JsonSerializable(explicitToJson: true)
class Building {

  Building(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.campus});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "campus", defaultValue: ResultCampus.emptyInstance)
  ResultCampus campus;


  factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);
  
  Map<String, dynamic> toJson() => _$BuildingToJson(this);
  
  factory Building.emptyInstance() => Building(id: 0, nameZh: "", code: "", campus: ResultCampus.emptyInstance());
}

@JsonSerializable(explicitToJson: true)
class ResultRoomType {

  ResultRoomType(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;


  factory ResultRoomType.fromJson(Map<String, dynamic> json) => _$ResultRoomTypeFromJson(json);
  
  Map<String, dynamic> toJson() => _$ResultRoomTypeToJson(this);
  
  factory ResultRoomType.emptyInstance() => ResultRoomType(id: 0, nameZh: "", code: "");
}

@JsonSerializable(explicitToJson: true)
class Room {

  Room(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.building,
      required this.roomType,
      required this.floor,
      required this.virtual,
      required this.seatsForLesson,
      required this.remark,
      required this.seats,
      this.week,
      this.weekday,
      this.date,
      this.units,
      this.weekNum,
      required this.mngtDepartAssoc});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "building", defaultValue: Building.emptyInstance)
  Building building;

  @JsonKey(name: "roomType", defaultValue: ResultRoomType.emptyInstance)
  ResultRoomType roomType;

  @JsonKey(name: "floor", defaultValue: 0)
  int floor;

  @JsonKey(name: "virtual", defaultValue: false)
  bool virtual;

  @JsonKey(name: "seatsForLesson", defaultValue: 0)
  int seatsForLesson;

  @JsonKey(name: "remark", defaultValue: "")
  String remark;

  @JsonKey(name: "seats", defaultValue: 0)
  int seats;

  @JsonKey(name: "week")
  dynamic week;

  @JsonKey(name: "weekday")
  dynamic weekday;

  @JsonKey(name: "date")
  dynamic date;

  @JsonKey(name: "units")
  dynamic units;

  @JsonKey(name: "weekNum")
  dynamic weekNum;

  @JsonKey(name: "mngtDepartAssoc", defaultValue: 0)
  int mngtDepartAssoc;


  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  
  Map<String, dynamic> toJson() => _$RoomToJson(this);
  
  factory Room.emptyInstance() => Room(id: 0, nameZh: "", code: "", building: Building.emptyInstance(), roomType: ResultRoomType.emptyInstance(), floor: 0, virtual: false, seatsForLesson: 0, remark: "", seats: 0, mngtDepartAssoc: 0);
}


