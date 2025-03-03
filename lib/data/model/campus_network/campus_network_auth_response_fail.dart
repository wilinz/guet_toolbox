import 'package:json_annotation/json_annotation.dart';

part 'campus_network_auth_response_fail.g.dart';

@JsonSerializable(explicitToJson: true)
class CampusNetworkAuthResponseFail {
  CampusNetworkAuthResponseFail(
      {required this.result,
      required this.wopt,
      required this.msg,
      required this.uid,
      required this.hidm,
      required this.hidn,
      required this.ss5,
      required this.ss6,
      required this.vid,
      required this.ss1,
      required this.ss4,
      required this.cvid,
      required this.pvid,
      required this.hotel,
      required this.aolno,
      required this.eport,
      required this.eclass,
      required this.ubind,
      required this.msga});

  @JsonKey(name: "result", defaultValue: 0)
  int result;
  @JsonKey(name: "wopt", defaultValue: 0)
  int wopt;
  @JsonKey(name: "msg", defaultValue: 0)
  int msg;
  @JsonKey(name: "uid", defaultValue: "")
  String uid;
  @JsonKey(name: "hidm", defaultValue: 0)
  int hidm;
  @JsonKey(name: "hidn", defaultValue: 0)
  int hidn;
  @JsonKey(name: "ss5", defaultValue: "")
  String ss5;
  @JsonKey(name: "ss6", defaultValue: "")
  String ss6;
  @JsonKey(name: "vid", defaultValue: 0)
  int vid;
  @JsonKey(name: "ss1", defaultValue: "")
  String ss1;
  @JsonKey(name: "ss4", defaultValue: "")
  String ss4;
  @JsonKey(name: "cvid", defaultValue: 0)
  int cvid;
  @JsonKey(name: "pvid", defaultValue: 0)
  int pvid;
  @JsonKey(name: "hotel", defaultValue: 0)
  int hotel;
  @JsonKey(name: "aolno", defaultValue: 0)
  int aolno;
  @JsonKey(name: "eport", defaultValue: 0)
  int eport;
  @JsonKey(name: "eclass", defaultValue: 0)
  int eclass;
  @JsonKey(name: "ubind", defaultValue: "")
  String ubind;
  @JsonKey(name: "msga", defaultValue: "")
  String msga;

  factory CampusNetworkAuthResponseFail.fromJson(Map<String, dynamic> json) => _$CampusNetworkAuthResponseFailFromJson(json);

  Map<String, dynamic> toJson() => _$CampusNetworkAuthResponseFailToJson(this);
}


