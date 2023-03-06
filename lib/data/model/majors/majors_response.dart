import 'package:json_annotation/json_annotation.dart';
import 'package:lpinyin/lpinyin.dart';

part 'majors_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MajorsResponse {
  MajorsResponse(
      {required this.success, required this.total, required this.data});

  @JsonKey(name: "success", defaultValue: false)
  bool success;
  @JsonKey(name: "total", defaultValue: 0)
  int total;
  @JsonKey(name: "data", defaultValue: [])
  List<Major> data;

  factory MajorsResponse.fromJson(Map<String, dynamic> json) =>
      _$MajorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MajorsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Major {
  Major(
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
      this.used}) {
    shortPinyin = PinyinHelper.getShortPinyin(spname).toLowerCase();
    firstPinyin = shortPinyin[0].toUpperCase();
    final code = firstPinyin.codeUnits.first;
    if (code < 65 || code > 90) {
      firstPinyin = "#";
    }
  }

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

  @JsonKey(ignore: true)
  String shortPinyin = "";

  @JsonKey(ignore: true)
  String firstPinyin = "";

  factory Major.fromJson(Map<String, dynamic> json) => _$MajorFromJson(json);

  Map<String, dynamic> toJson() => _$MajorToJson(this);
}
