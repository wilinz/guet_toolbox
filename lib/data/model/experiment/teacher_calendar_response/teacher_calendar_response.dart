import 'package:json_annotation/json_annotation.dart';

part 'teacher_calendar_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TeacherCalendarResponse {

  TeacherCalendarResponse(
      {required this.success,
      required this.message,
      required this.code,
      required this.result,
      required this.timestamp});

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "message", defaultValue: "")
  String message;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "result", defaultValue: [])
  List<TeacherCalendarOption> result;

  @JsonKey(name: "timestamp", defaultValue: 0)
  int timestamp;


  factory TeacherCalendarResponse.fromJson(Map<String, dynamic> json) => _$TeacherCalendarResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeacherCalendarResponseToJson(this);
  
  factory TeacherCalendarResponse.emptyInstance() => TeacherCalendarResponse(success: false, message: "", code: 0, result: [], timestamp: 0);
}

@JsonSerializable(explicitToJson: true)
class TeacherCalendarOption {

  TeacherCalendarOption(
      {required this.text,
      required this.value,
      required this.syncId});

  @JsonKey(name: "text", defaultValue: "")
  String text;

  @JsonKey(name: "value", defaultValue: "")
  String value;

  @JsonKey(name: "syncId", defaultValue: "")
  String syncId;


  factory TeacherCalendarOption.fromJson(Map<String, dynamic> json) => _$TeacherCalendarOptionFromJson(json);
  
  Map<String, dynamic> toJson() => _$TeacherCalendarOptionToJson(this);
  
  factory TeacherCalendarOption.emptyInstance() => TeacherCalendarOption(text: "", value: "", syncId: "");
}


