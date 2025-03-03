import 'package:json_annotation/json_annotation.dart';

part 'upload_pictures_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadPicturesResponse {

  UploadPicturesResponse(
      {required this.code,
      required this.success,
      required this.msg,
      required this.data});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "success", defaultValue: false)
  bool success;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<String> data;


  factory UploadPicturesResponse.fromJson(Map<String, dynamic> json) => _$UploadPicturesResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$UploadPicturesResponseToJson(this);
  
  factory UploadPicturesResponse.emptyInstance() => UploadPicturesResponse(code: 0, success: false, msg: "", data: []);
}


