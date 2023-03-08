import 'package:json_annotation/json_annotation.dart';

part 'campus_network_auth_response_common.g.dart';

@JsonSerializable(explicitToJson: true)
class CampusNetworkAuthResponseCommon {
  CampusNetworkAuthResponseCommon(
      {required this.result,
      required this.msg});

  @JsonKey(name: "result", defaultValue: 0)
  int result;
  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  factory CampusNetworkAuthResponseCommon.fromJson(Map<String, dynamic> json) => _$CampusNetworkAuthResponseCommonFromJson(json);

  Map<String, dynamic> toJson() => _$CampusNetworkAuthResponseCommonToJson(this);
}


