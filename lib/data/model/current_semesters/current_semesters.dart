import 'package:json_annotation/json_annotation.dart';

part 'current_semesters.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentSemesters {
  CurrentSemesters(
      {required this.approvedYear,
      required this.calendarAssoc,
      required this.code,
      required this.countInTerm,
      required this.enabled,
      required this.endDate,
      this.fileInfoAssoc,
      required this.id,
      required this.includeMonths,
      required this.lessonGenCode,
      required this.name,
      required this.nameEn,
      required this.nameZh,
      required this.schoolYear,
      required this.season,
      required this.startDate,
      required this.transient,
      required this.weekStartOnSunday});

  @JsonKey(name: "approvedYear", defaultValue: "")
  String approvedYear;

  @JsonKey(name: "calendarAssoc")
  CalendarAssoc calendarAssoc;

  @JsonKey(name: "code", defaultValue: "")
  String code;

  @JsonKey(name: "countInTerm", defaultValue: false)
  bool countInTerm;

  @JsonKey(name: "enabled", defaultValue: false)
  bool enabled;

  @JsonKey(name: "endDate")
  EndDate endDate;

  @JsonKey(name: "fileInfoAssoc")
  dynamic fileInfoAssoc;

  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "includeMonths", defaultValue: [])
  List<int> includeMonths;

  @JsonKey(name: "lessonGenCode", defaultValue: "")
  String lessonGenCode;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "nameEn", defaultValue: "")
  String nameEn;

  @JsonKey(name: "nameZh", defaultValue: "")
  String nameZh;

  @JsonKey(name: "schoolYear", defaultValue: "")
  String schoolYear;

  @JsonKey(name: "season")
  Season season;

  @JsonKey(name: "startDate")
  StartDate startDate;

  @JsonKey(name: "transient", defaultValue: false)
  bool transient;

  @JsonKey(name: "weekStartOnSunday", defaultValue: false)
  bool weekStartOnSunday;


  factory CurrentSemesters.fromJson(Map<String, dynamic> json) => _$CurrentSemestersFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentSemestersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CalendarAssoc {
  CalendarAssoc(
      {required this.id});

  @JsonKey(name: "id", defaultValue: 0)
  int id;


  factory CalendarAssoc.fromJson(Map<String, dynamic> json) => _$CalendarAssocFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarAssocToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Zone {
  Zone(
      {required this.iD,
      required this.fixed});

  @JsonKey(name: "ID", defaultValue: "")
  String iD;

  @JsonKey(name: "fixed", defaultValue: false)
  bool fixed;


  factory Zone.fromJson(Map<String, dynamic> json) => _$ZoneFromJson(json);

  Map<String, dynamic> toJson() => _$ZoneToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Chronology {
  Chronology(
      {required this.zone});

  @JsonKey(name: "zone")
  Zone zone;


  factory Chronology.fromJson(Map<String, dynamic> json) => _$ChronologyFromJson(json);

  Map<String, dynamic> toJson() => _$ChronologyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DurationType {
  DurationType(
      {required this.name});

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory DurationType.fromJson(Map<String, dynamic> json) => _$DurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$DurationTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FieldTypes {
  FieldTypes(
      {required this.durationType,
      required this.name,
      this.rangeDurationType});

  @JsonKey(name: "durationType")
  DurationType durationType;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "rangeDurationType")
  RangeDurationType? rangeDurationType;


  factory FieldTypes.fromJson(Map<String, dynamic> json) => _$FieldTypesFromJson(json);

  Map<String, dynamic> toJson() => _$FieldTypesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RangeDurationType {
  RangeDurationType(
      {required this.name});

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory RangeDurationType.fromJson(Map<String, dynamic> json) => _$RangeDurationTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RangeDurationTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Type {
  Type(
      {required this.name});

  @JsonKey(name: "name", defaultValue: "")
  String name;


  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DurationField {
  DurationField(
      {required this.name,
      required this.precise,
      required this.supported,
      required this.type,
      required this.unitMillis});

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "precise", defaultValue: false)
  bool precise;

  @JsonKey(name: "supported", defaultValue: false)
  bool supported;

  @JsonKey(name: "type")
  Type type;

  @JsonKey(name: "unitMillis", defaultValue: 0)
  int unitMillis;


  factory DurationField.fromJson(Map<String, dynamic> json) => _$DurationFieldFromJson(json);

  Map<String, dynamic> toJson() => _$DurationFieldToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LeapDurationField {
  LeapDurationField(
      {required this.name,
      required this.precise,
      required this.supported,
      required this.type,
      required this.unitMillis});

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "precise", defaultValue: false)
  bool precise;

  @JsonKey(name: "supported", defaultValue: false)
  bool supported;

  @JsonKey(name: "type")
  Type type;

  @JsonKey(name: "unitMillis", defaultValue: 0)
  int unitMillis;


  factory LeapDurationField.fromJson(Map<String, dynamic> json) => _$LeapDurationFieldFromJson(json);

  Map<String, dynamic> toJson() => _$LeapDurationFieldToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Fields {
  Fields(
      {required this.durationField,
      this.leapDurationField,
      required this.lenient,
      required this.maximumValue,
      required this.minimumValue,
      required this.name,
      this.rangeDurationField,
      required this.supported,
      required this.type});

  @JsonKey(name: "durationField")
  DurationField durationField;

  @JsonKey(name: "leapDurationField")
  LeapDurationField? leapDurationField;

  @JsonKey(name: "lenient", defaultValue: false)
  bool lenient;

  @JsonKey(name: "maximumValue", defaultValue: 0)
  int maximumValue;

  @JsonKey(name: "minimumValue", defaultValue: 0)
  int minimumValue;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "rangeDurationField")
  RangeDurationField? rangeDurationField;

  @JsonKey(name: "supported", defaultValue: false)
  bool supported;

  @JsonKey(name: "type")
  Type type;


  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RangeDurationField {
  RangeDurationField(
      {required this.name,
      required this.precise,
      required this.supported,
      required this.type,
      required this.unitMillis});

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "precise", defaultValue: false)
  bool precise;

  @JsonKey(name: "supported", defaultValue: false)
  bool supported;

  @JsonKey(name: "type")
  Type type;

  @JsonKey(name: "unitMillis", defaultValue: 0)
  int unitMillis;


  factory RangeDurationField.fromJson(Map<String, dynamic> json) => _$RangeDurationFieldFromJson(json);

  Map<String, dynamic> toJson() => _$RangeDurationFieldToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EndDate {
  EndDate(
      {required this.centuryOfEra,
      required this.chronology,
      required this.dayOfMonth,
      required this.dayOfWeek,
      required this.dayOfYear,
      required this.era,
      required this.fieldTypes,
      required this.fields,
      required this.monthOfYear,
      required this.values,
      required this.weekOfWeekyear,
      required this.weekyear,
      required this.year,
      required this.yearOfCentury,
      required this.yearOfEra});

  @JsonKey(name: "centuryOfEra", defaultValue: 0)
  int centuryOfEra;

  @JsonKey(name: "chronology")
  Chronology chronology;

  @JsonKey(name: "dayOfMonth", defaultValue: 0)
  int dayOfMonth;

  @JsonKey(name: "dayOfWeek", defaultValue: 0)
  int dayOfWeek;

  @JsonKey(name: "dayOfYear", defaultValue: 0)
  int dayOfYear;

  @JsonKey(name: "era", defaultValue: 0)
  int era;

  @JsonKey(name: "fieldTypes", defaultValue: [])
  List<FieldTypes> fieldTypes;

  @JsonKey(name: "fields", defaultValue: [])
  List<Fields> fields;

  @JsonKey(name: "monthOfYear", defaultValue: 0)
  int monthOfYear;

  @JsonKey(name: "values", defaultValue: [])
  List<int> values;

  @JsonKey(name: "weekOfWeekyear", defaultValue: 0)
  int weekOfWeekyear;

  @JsonKey(name: "weekyear", defaultValue: 0)
  int weekyear;

  @JsonKey(name: "year", defaultValue: 0)
  int year;

  @JsonKey(name: "yearOfCentury", defaultValue: 0)
  int yearOfCentury;

  @JsonKey(name: "yearOfEra", defaultValue: 0)
  int yearOfEra;


  factory EndDate.fromJson(Map<String, dynamic> json) => _$EndDateFromJson(json);

  Map<String, dynamic> toJson() => _$EndDateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Season {
  Season(
      {required this.$type,
      required this.$name});

  @JsonKey(name: "\$type", defaultValue: "")
  String $type;

  @JsonKey(name: "\$name", defaultValue: "")
  String $name;


  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StartDate {
  StartDate(
      {required this.centuryOfEra,
      required this.chronology,
      required this.dayOfMonth,
      required this.dayOfWeek,
      required this.dayOfYear,
      required this.era,
      required this.fieldTypes,
      required this.fields,
      required this.monthOfYear,
      required this.values,
      required this.weekOfWeekyear,
      required this.weekyear,
      required this.year,
      required this.yearOfCentury,
      required this.yearOfEra});

  @JsonKey(name: "centuryOfEra", defaultValue: 0)
  int centuryOfEra;

  @JsonKey(name: "chronology")
  Chronology chronology;

  @JsonKey(name: "dayOfMonth", defaultValue: 0)
  int dayOfMonth;

  @JsonKey(name: "dayOfWeek", defaultValue: 0)
  int dayOfWeek;

  @JsonKey(name: "dayOfYear", defaultValue: 0)
  int dayOfYear;

  @JsonKey(name: "era", defaultValue: 0)
  int era;

  @JsonKey(name: "fieldTypes", defaultValue: [])
  List<FieldTypes> fieldTypes;

  @JsonKey(name: "fields", defaultValue: [])
  List<Fields> fields;

  @JsonKey(name: "monthOfYear", defaultValue: 0)
  int monthOfYear;

  @JsonKey(name: "values", defaultValue: [])
  List<int> values;

  @JsonKey(name: "weekOfWeekyear", defaultValue: 0)
  int weekOfWeekyear;

  @JsonKey(name: "weekyear", defaultValue: 0)
  int weekyear;

  @JsonKey(name: "year", defaultValue: 0)
  int year;

  @JsonKey(name: "yearOfCentury", defaultValue: 0)
  int yearOfCentury;

  @JsonKey(name: "yearOfEra", defaultValue: 0)
  int yearOfEra;


  factory StartDate.fromJson(Map<String, dynamic> json) => _$StartDateFromJson(json);

  Map<String, dynamic> toJson() => _$StartDateToJson(this);
}


