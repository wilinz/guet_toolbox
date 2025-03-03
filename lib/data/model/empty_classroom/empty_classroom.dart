import 'package:json_annotation/json_annotation.dart';

part 'empty_classroom.g.dart';

@Deprecated("Old System")
List<EmptyClassroomData> emptyClassroomListFromJson(List json) =>
    json.map((e) => EmptyClassroomData.fromJson(e as Map<String, dynamic>)).toList();

@Deprecated("Old System")
@JsonSerializable(explicitToJson: true)
class EmptyClassroomData {
  EmptyClassroomData({
    required this.campus,
    required this.teachingBuilding,
    required this.classroom,
    required this.seatCount,
    required this.type,
  });

  @JsonKey(name: '校区', defaultValue: '')
  String campus;

  @JsonKey(name: '教学楼', defaultValue: '')
  String teachingBuilding;

  @JsonKey(name: '教室', defaultValue: '')
  String classroom;

  @JsonKey(name: '座位数', defaultValue: '')
  String seatCount;

  @JsonKey(name: '类型', defaultValue: '')
  String type;

  factory EmptyClassroomData.fromJson(Map<String, dynamic> json) => _$EmptyClassroomDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyClassroomDataToJson(this);
}
