import 'package:json_annotation/json_annotation.dart';

part 'majors_code_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MajorsCodeResponse {
  MajorsCodeResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  factory MajorsCodeResponse.fromJson(Map<String, dynamic> json) => _$MajorsCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MajorsCodeResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {required this.spno,
      required this.spname,
      this.engname,
      required this.dptno,
      required this.sptype,
      this.gbno,
      this.years,
      this.degree,
      this.comm,
      this.major,
      this.code,
      this.used});

  @JsonKey(name: "spno", defaultValue: "")
  String spno;
  @JsonKey(name: "spname", defaultValue: "")
  String spname;
  @JsonKey(name: "engname")
  String? engname;
  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "sptype", defaultValue: "")
  String sptype;
  @JsonKey(name: "gbno")
  String? gbno;
  @JsonKey(name: "years")
  String? years;
  @JsonKey(name: "degree")
  String? degree;
  @JsonKey(name: "comm")
  String? comm;
  @JsonKey(name: "major")
  String? major;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "used")
  int? used;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


