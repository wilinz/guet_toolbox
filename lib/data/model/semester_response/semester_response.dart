import 'package:json_annotation/json_annotation.dart';

part 'semester_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SemesterNewResponse {

  SemesterNewResponse(
      {required this.code,
      required this.msg,
      required this.data,
      required this.ok});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<SemesterNew> data;

  @JsonKey(name: "ok", defaultValue: false)
  bool ok;


  factory SemesterNewResponse.fromJson(Map<String, dynamic> json) => _$SemesterNewResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$SemesterNewResponseToJson(this);
  
  factory SemesterNewResponse.emptyInstance() => SemesterNewResponse(code: 0, msg: "", data: [], ok: false);
}

@JsonSerializable(explicitToJson: true)
class SemesterNew {

  SemesterNew(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code,
      required this.schoolYear});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "schoolYear", defaultValue: "")
  String schoolYear;


  factory SemesterNew.fromJson(Map<String, dynamic> json) => _$SemesterNewFromJson(json);
  
  Map<String, dynamic> toJson() => _$SemesterNewToJson(this);
  
  factory SemesterNew.emptyInstance() => SemesterNew(id: "", nameZh: "", nameEn: "", code: "", schoolYear: "");
}


