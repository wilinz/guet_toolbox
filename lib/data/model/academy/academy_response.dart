import 'package:json_annotation/json_annotation.dart';

part 'academy_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AcademyResponse {
  AcademyResponse(
      {required this.success,
      required this.total,
      required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Academy> data;

  factory AcademyResponse.fromJson(Map<String, dynamic> json) => _$AcademyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AcademyResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Academy {
  Academy(
      {required this.dptno,
      required this.dptname,
      this.engname,
      this.gbno,
      this.zone,
      this.comm,
      this.bbm,
      this.code,
      required this.used});

  @JsonKey(name: "dptno", defaultValue: "")
  String dptno;
  @JsonKey(name: "dptname", defaultValue: "")
  String dptname;
  @JsonKey(name: "engname")
  String? engname;
  @JsonKey(name: "gbno")
  String? gbno;
  @JsonKey(name: "zone")
  dynamic zone;
  @JsonKey(name: "comm")
  String? comm;
  @JsonKey(name: "bbm")
  String? bbm;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "used", defaultValue: 0)
  int used;

  factory Academy.fromJson(Map<String, dynamic> json) => _$AcademyFromJson(json);

  Map<String, dynamic> toJson() => _$AcademyToJson(this);

}


