import 'package:json_annotation/json_annotation.dart';

part 'credits_course_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CreditsCourseInfo {

  CreditsCourseInfo(
      {required this.courseName,
      required this.courseNameEn,
      required this.courseCode,
      required this.creditsCourse});

  @JsonKey(name: "courseName", defaultValue: "")
  String courseName;

  @JsonKey(name: "courseNameEn", defaultValue: "")
  String courseNameEn;

  @JsonKey(name: "courseCode", defaultValue: "")
  String courseCode;

  @JsonKey(name: "creditsCourse", defaultValue: false)
  bool creditsCourse;


  factory CreditsCourseInfo.fromJson(Map<String, dynamic> json) => _$CreditsCourseInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$CreditsCourseInfoToJson(this);
  
  factory CreditsCourseInfo.emptyInstance() => CreditsCourseInfo(courseName: "", courseNameEn: "", courseCode: "", creditsCourse: false);
}


