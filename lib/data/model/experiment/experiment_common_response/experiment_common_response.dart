import 'package:json_annotation/json_annotation.dart';

part 'experiment_common_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperimentCommonResponse {

  ExperimentCommonResponse(
      {required this.success,
      required this.message,
      required this.code,
      this.result,
      required this.timestamp});

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "message", defaultValue: "")
  String message;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "result")
  dynamic result;

  @JsonKey(name: "timestamp", defaultValue: 0)
  int timestamp;


  factory ExperimentCommonResponse.fromJson(Map<String, dynamic> json) => _$ExperimentCommonResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$ExperimentCommonResponseToJson(this);
  
  factory ExperimentCommonResponse.emptyInstance() => ExperimentCommonResponse(success: false, message: "", code: 0, timestamp: 0);
}


