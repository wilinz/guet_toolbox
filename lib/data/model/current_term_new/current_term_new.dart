import 'package:json_annotation/json_annotation.dart';

part 'current_term_new.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentTermNewResponse {

  CurrentTermNewResponse(
      {required this.code,
      required this.msg,
      required this.data,
      required this.ok});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: CurrentTermNew.emptyInstance)
  CurrentTermNew data;

  @JsonKey(name: "ok", defaultValue: false)
  bool ok;


  factory CurrentTermNewResponse.fromJson(Map<String, dynamic> json) => _$CurrentTermNewResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$CurrentTermNewResponseToJson(this);
  
  factory CurrentTermNewResponse.emptyInstance() => CurrentTermNewResponse(code: 0, msg: "", data: CurrentTermNew.emptyInstance(), ok: false);
}

@JsonSerializable(explicitToJson: true)
class CurrentTermNew {

  CurrentTermNew(
      {required this.id,
      required this.nameZh,
      required this.nameEn,
      required this.code});

  @JsonKey(name: "id", defaultValue: "")
  String id;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "code", defaultValue: "")
  String code;


  factory CurrentTermNew.fromJson(Map<String, dynamic> json) => _$CurrentTermNewFromJson(json);
  
  Map<String, dynamic> toJson() => _$CurrentTermNewToJson(this);
  
  factory CurrentTermNew.emptyInstance() => CurrentTermNew(id: "", nameZh: "", nameEn: "", code: "");
}


