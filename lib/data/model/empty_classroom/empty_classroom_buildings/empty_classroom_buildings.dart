import 'package:json_annotation/json_annotation.dart';

part 'empty_classroom_buildings.g.dart';

List<EmptyClassroomBuilding> emptyClassroomBuildingsListFormJson(List json) =>
    json.map((e) => EmptyClassroomBuilding.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> emptyClassroomBuildingsListToJson(List<EmptyClassroomBuilding> instance) =>
    instance.map((e) => e.toJson()).toList();

@JsonSerializable(explicitToJson: true)
class EmptyClassroomBuilding {

  EmptyClassroomBuilding(
      {required this.id,
      required this.nameZh,
      this.nameEn,
      required this.code,
      required this.enabled});

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn")
  dynamic nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;


  factory EmptyClassroomBuilding.fromJson(Map<String, dynamic> json) => _$EmptyClassroomBuildingFromJson(json);
  
  Map<String, dynamic> toJson() => _$EmptyClassroomBuildingToJson(this);
  
  factory EmptyClassroomBuilding.emptyInstance() => EmptyClassroomBuilding(id: 0, nameZh: "", code: "", enabled: false);
}


