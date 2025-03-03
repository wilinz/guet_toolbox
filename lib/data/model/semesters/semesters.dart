import 'package:floor/floor.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'semesters.g.dart';

List<Semester> semestersListFormJson(List json) =>
    json.map((e) => Semester.fromJson(e as Map<String, dynamic>)).toList();

List<Map<String, dynamic>> semestersListToJson(List<Semester> instance) =>
    instance.map((e) => e.toJson()).toList();

final _dateFormat = DateFormat('yyyy-MM-dd');

_parseDateTime(v) => _dateFormat.parse(v);

@Entity(tableName: 'semesters')
@JsonSerializable(explicitToJson: true)
class Semester {
  Semester(
      {required this.nameZh,
      required this.nameEn,
      required this.id,
      required this.code,
      required this.calendarAssoc,
      required this.schoolYear,
      required this.startDate,
      required this.endDate,
      required this.weekStartOnSunday,
      required this.countInTerm,
      required this.season,
      required this.enabled,
      this.fileInfoAssoc,
      required this.approvedYear,
      required this.lessonGenCode,
      required this.includeMonths,
      required this.transient,
      required this.name});

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @PrimaryKey(autoGenerate: false)
  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "calendarAssoc", defaultValue: 0)
  int calendarAssoc;

  @JsonKey(name: "schoolYear", defaultValue: "")
  String schoolYear;

  @JsonKey(name: "startDate", fromJson: _parseDateTime)
  DateTime startDate;

  @JsonKey(name: "endDate", fromJson: _parseDateTime)
  DateTime endDate;

  @JsonKey(name: "weekStartOnSunday", defaultValue: false)
  bool weekStartOnSunday;

  @JsonKey(name: "countInTerm", defaultValue: false)
  bool countInTerm;

  @JsonKey(name: "season", defaultValue: "")
  String season;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "fileInfoAssoc")
  String? fileInfoAssoc;

  @JsonKey(name: "approvedYear", defaultValue: "")
  String approvedYear;

  @JsonKey(name: "lessonGenCode", defaultValue: "")
  String lessonGenCode;

  @JsonKey(name: "includeMonths", defaultValue: [])
  List<int> includeMonths;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory Semester.fromJson(Map<String, dynamic> json) => _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}


