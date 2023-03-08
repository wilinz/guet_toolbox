import 'package:json_annotation/json_annotation.dart';

part 'campus_network_auth_response_success.g.dart';

@JsonSerializable(explicitToJson: true)
class CampusNetworkAuthResponseSuccess {
  CampusNetworkAuthResponseSuccess(
      {required this.result,
      required this.aolno,
      required this.m46,
      required this.v46ip,
      required this.myv6ip,
      required this.sms,
      required this.nID,
      required this.olmac,
      required this.ollm,
      required this.olm1,
      required this.olm2,
      required this.olm3,
      required this.olmm,
      required this.olm5,
      required this.gid,
      required this.ispid,
      required this.opip,
      required this.oltime,
      required this.olflow,
      required this.lip,
      required this.stime,
      required this.etime,
      required this.uid,
      required this.sv});

  @JsonKey(name: "result", defaultValue: 0)
  int result;
  @JsonKey(name: "aolno", defaultValue: 0)
  int aolno;
  @JsonKey(name: "m46", defaultValue: 0)
  int m46;
  @JsonKey(name: "v46ip", defaultValue: "")
  String v46ip;
  @JsonKey(name: "myv6ip", defaultValue: "")
  String myv6ip;
  @JsonKey(name: "sms", defaultValue: 0)
  int sms;
  @JsonKey(name: "NID", defaultValue: "")
  String nID;
  @JsonKey(name: "olmac", defaultValue: "")
  String olmac;
  @JsonKey(name: "ollm", defaultValue: 0)
  int ollm;
  @JsonKey(name: "olm1", defaultValue: "")
  String olm1;
  @JsonKey(name: "olm2", defaultValue: "")
  String olm2;
  @JsonKey(name: "olm3", defaultValue: 0)
  int olm3;
  @JsonKey(name: "olmm", defaultValue: 0)
  int olmm;
  @JsonKey(name: "olm5", defaultValue: 0)
  int olm5;
  @JsonKey(name: "gid", defaultValue: 0)
  int gid;
  @JsonKey(name: "ispid", defaultValue: 0)
  int ispid;
  @JsonKey(name: "opip", defaultValue: "")
  String opip;
  @JsonKey(name: "oltime", defaultValue: 0)
  int oltime;
  @JsonKey(name: "olflow", defaultValue: 0)
  int olflow;
  @JsonKey(name: "lip", defaultValue: "")
  String lip;
  @JsonKey(name: "stime", defaultValue: "")
  String stime;
  @JsonKey(name: "etime", defaultValue: "")
  String etime;
  @JsonKey(name: "uid", defaultValue: "")
  String uid;
  @JsonKey(name: "sv", defaultValue: 0)
  int sv;

  factory CampusNetworkAuthResponseSuccess.fromJson(Map<String, dynamic> json) => _$CampusNetworkAuthResponseSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$CampusNetworkAuthResponseSuccessToJson(this);
}


