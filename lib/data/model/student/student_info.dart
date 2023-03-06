import 'package:json_annotation/json_annotation.dart';

part 'student_info.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentInfo {
  StudentInfo(
      {required this.term,
      required this.grade,
      required this.dptno,
      required this.dptname,
      required this.spno,
      required this.spname,
      required this.stid,
      required this.name});

  @JsonKey(name: "term", defaultValue: "")
  String term;
  @JsonKey(name: "grade", defaultValue: "")
  String grade;
  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "dptname", defaultValue: "")
  String dptname;
  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "stid", defaultValue: "")
  String stid;
  @JsonKey(name: "name", defaultValue: "")
  String name;

  factory StudentInfo.fromJson(Map<String, dynamic> json) => _$StudentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StudentInfoToJson(this);
}


