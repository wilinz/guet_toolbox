import 'package:json_annotation/json_annotation.dart';

part 'upload_pictures.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadPictures {

  UploadPictures(
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


  factory UploadPictures.fromJson(Map<String, dynamic> json) => _$UploadPicturesFromJson(json);
  
  Map<String, dynamic> toJson() => _$UploadPicturesToJson(this);
  
  factory UploadPictures.emptyInstance() => UploadPictures(code: 0, success: false, msg: "", data: []);
}


