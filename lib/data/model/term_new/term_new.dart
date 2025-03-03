import 'package:json_annotation/json_annotation.dart';

part 'term_new.g.dart';

@JsonSerializable(explicitToJson: true)
class TermNewResponse {

  TermNewResponse(
      {required this.code,
      required this.msg,
      required this.data,
      required this.ok});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<TermNew> data;

  @JsonKey(name: "ok", defaultValue: false)
  bool ok;


  factory TermNewResponse.fromJson(Map<String, dynamic> json) => _$TermNewResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$TermNewResponseToJson(this);
  
  factory TermNewResponse.emptyInstance() => TermNewResponse(code: 0, msg: "", data: [], ok: false);
}

@JsonSerializable(explicitToJson: true)
class TermNew {

  TermNew(
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


  factory TermNew.fromJson(Map<String, dynamic> json) => _$TermNewFromJson(json);
  
  Map<String, dynamic> toJson() => _$TermNewToJson(this);
  
  factory TermNew.emptyInstance() => TermNew(id: "", nameZh: "", nameEn: "", code: "", schoolYear: "");
}


