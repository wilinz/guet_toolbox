import 'package:json_annotation/json_annotation.dart';

part 'reauth.g.dart';

@JsonSerializable(explicitToJson: true)
class ReAuth {
  ReAuth(
      {required this.msg,
      required this.code});

  @JsonKey(name: "msg", defaultValue: "")
  String msg;
  @JsonKey(name: "code", defaultValue: "")
  String code;

  factory ReAuth.fromJson(Map<String, dynamic> json) => _$ReAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ReAuthToJson(this);
}


