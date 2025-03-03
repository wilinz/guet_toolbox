// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_semesters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentSemesters _$CurrentSemestersFromJson(Map<String, dynamic> json) =>
    CurrentSemesters(
      approvedYear: json['approvedYear'] as String? ?? '',
      calendarAssoc:
          CalendarAssoc.fromJson(json['calendarAssoc'] as Map<String, dynamic>),
      code: json['code'] as String? ?? '',
      countInTerm: json['countInTerm'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? false,
      endDate: EndDate.fromJson(json['endDate'] as Map<String, dynamic>),
      fileInfoAssoc: json['fileInfoAssoc'],
      id: (json['id'] as num?)?.toInt() ?? 0,
      includeMonths: (json['includeMonths'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      lessonGenCode: json['lessonGenCode'] as String? ?? '',
      name: json['name'] as String? ?? '',
      nameEn: json['nameEn'] as String? ?? '',
      nameZh: json['nameZh'] as String? ?? '',
      schoolYear: json['schoolYear'] as String? ?? '',
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
      startDate: StartDate.fromJson(json['startDate'] as Map<String, dynamic>),
      transient: json['transient'] as bool? ?? false,
      weekStartOnSunday: json['weekStartOnSunday'] as bool? ?? false,
    );

Map<String, dynamic> _$CurrentSemestersToJson(CurrentSemesters instance) =>
    <String, dynamic>{
      'approvedYear': instance.approvedYear,
      'calendarAssoc': instance.calendarAssoc.toJson(),
      'code': instance.code,
      'countInTerm': instance.countInTerm,
      'enabled': instance.enabled,
      'endDate': instance.endDate.toJson(),
      'fileInfoAssoc': instance.fileInfoAssoc,
      'id': instance.id,
      'includeMonths': instance.includeMonths,
      'lessonGenCode': instance.lessonGenCode,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'nameZh': instance.nameZh,
      'schoolYear': instance.schoolYear,
      'season': instance.season.toJson(),
      'startDate': instance.startDate.toJson(),
      'transient': instance.transient,
      'weekStartOnSunday': instance.weekStartOnSunday,
    };

CalendarAssoc _$CalendarAssocFromJson(Map<String, dynamic> json) =>
    CalendarAssoc(
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CalendarAssocToJson(CalendarAssoc instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Zone _$ZoneFromJson(Map<String, dynamic> json) => Zone(
      iD: json['ID'] as String? ?? '',
      fixed: json['fixed'] as bool? ?? false,
    );

Map<String, dynamic> _$ZoneToJson(Zone instance) => <String, dynamic>{
      'ID': instance.iD,
      'fixed': instance.fixed,
    };

Chronology _$ChronologyFromJson(Map<String, dynamic> json) => Chronology(
      zone: Zone.fromJson(json['zone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChronologyToJson(Chronology instance) =>
    <String, dynamic>{
      'zone': instance.zone.toJson(),
    };

DurationType _$DurationTypeFromJson(Map<String, dynamic> json) => DurationType(
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DurationTypeToJson(DurationType instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

FieldTypes _$FieldTypesFromJson(Map<String, dynamic> json) => FieldTypes(
      durationType:
          DurationType.fromJson(json['durationType'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      rangeDurationType: json['rangeDurationType'] == null
          ? null
          : RangeDurationType.fromJson(
              json['rangeDurationType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FieldTypesToJson(FieldTypes instance) =>
    <String, dynamic>{
      'durationType': instance.durationType.toJson(),
      'name': instance.name,
      'rangeDurationType': instance.rangeDurationType?.toJson(),
    };

RangeDurationType _$RangeDurationTypeFromJson(Map<String, dynamic> json) =>
    RangeDurationType(
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$RangeDurationTypeToJson(RangeDurationType instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };

DurationField _$DurationFieldFromJson(Map<String, dynamic> json) =>
    DurationField(
      name: json['name'] as String? ?? '',
      precise: json['precise'] as bool? ?? false,
      supported: json['supported'] as bool? ?? false,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
      unitMillis: (json['unitMillis'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DurationFieldToJson(DurationField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'precise': instance.precise,
      'supported': instance.supported,
      'type': instance.type.toJson(),
      'unitMillis': instance.unitMillis,
    };

LeapDurationField _$LeapDurationFieldFromJson(Map<String, dynamic> json) =>
    LeapDurationField(
      name: json['name'] as String? ?? '',
      precise: json['precise'] as bool? ?? false,
      supported: json['supported'] as bool? ?? false,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
      unitMillis: (json['unitMillis'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LeapDurationFieldToJson(LeapDurationField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'precise': instance.precise,
      'supported': instance.supported,
      'type': instance.type.toJson(),
      'unitMillis': instance.unitMillis,
    };

Fields _$FieldsFromJson(Map<String, dynamic> json) => Fields(
      durationField:
          DurationField.fromJson(json['durationField'] as Map<String, dynamic>),
      leapDurationField: json['leapDurationField'] == null
          ? null
          : LeapDurationField.fromJson(
              json['leapDurationField'] as Map<String, dynamic>),
      lenient: json['lenient'] as bool? ?? false,
      maximumValue: (json['maximumValue'] as num?)?.toInt() ?? 0,
      minimumValue: (json['minimumValue'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      rangeDurationField: json['rangeDurationField'] == null
          ? null
          : RangeDurationField.fromJson(
              json['rangeDurationField'] as Map<String, dynamic>),
      supported: json['supported'] as bool? ?? false,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FieldsToJson(Fields instance) => <String, dynamic>{
      'durationField': instance.durationField.toJson(),
      'leapDurationField': instance.leapDurationField?.toJson(),
      'lenient': instance.lenient,
      'maximumValue': instance.maximumValue,
      'minimumValue': instance.minimumValue,
      'name': instance.name,
      'rangeDurationField': instance.rangeDurationField?.toJson(),
      'supported': instance.supported,
      'type': instance.type.toJson(),
    };

RangeDurationField _$RangeDurationFieldFromJson(Map<String, dynamic> json) =>
    RangeDurationField(
      name: json['name'] as String? ?? '',
      precise: json['precise'] as bool? ?? false,
      supported: json['supported'] as bool? ?? false,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
      unitMillis: (json['unitMillis'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RangeDurationFieldToJson(RangeDurationField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'precise': instance.precise,
      'supported': instance.supported,
      'type': instance.type.toJson(),
      'unitMillis': instance.unitMillis,
    };

EndDate _$EndDateFromJson(Map<String, dynamic> json) => EndDate(
      centuryOfEra: (json['centuryOfEra'] as num?)?.toInt() ?? 0,
      chronology:
          Chronology.fromJson(json['chronology'] as Map<String, dynamic>),
      dayOfMonth: (json['dayOfMonth'] as num?)?.toInt() ?? 0,
      dayOfWeek: (json['dayOfWeek'] as num?)?.toInt() ?? 0,
      dayOfYear: (json['dayOfYear'] as num?)?.toInt() ?? 0,
      era: (json['era'] as num?)?.toInt() ?? 0,
      fieldTypes: (json['fieldTypes'] as List<dynamic>?)
              ?.map((e) => FieldTypes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => Fields.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      monthOfYear: (json['monthOfYear'] as num?)?.toInt() ?? 0,
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      weekOfWeekyear: (json['weekOfWeekyear'] as num?)?.toInt() ?? 0,
      weekyear: (json['weekyear'] as num?)?.toInt() ?? 0,
      year: (json['year'] as num?)?.toInt() ?? 0,
      yearOfCentury: (json['yearOfCentury'] as num?)?.toInt() ?? 0,
      yearOfEra: (json['yearOfEra'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EndDateToJson(EndDate instance) => <String, dynamic>{
      'centuryOfEra': instance.centuryOfEra,
      'chronology': instance.chronology.toJson(),
      'dayOfMonth': instance.dayOfMonth,
      'dayOfWeek': instance.dayOfWeek,
      'dayOfYear': instance.dayOfYear,
      'era': instance.era,
      'fieldTypes': instance.fieldTypes.map((e) => e.toJson()).toList(),
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'monthOfYear': instance.monthOfYear,
      'values': instance.values,
      'weekOfWeekyear': instance.weekOfWeekyear,
      'weekyear': instance.weekyear,
      'year': instance.year,
      'yearOfCentury': instance.yearOfCentury,
      'yearOfEra': instance.yearOfEra,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      $type: json[r'$type'] as String? ?? '',
      $name: json[r'$name'] as String? ?? '',
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      r'$type': instance.$type,
      r'$name': instance.$name,
    };

StartDate _$StartDateFromJson(Map<String, dynamic> json) => StartDate(
      centuryOfEra: (json['centuryOfEra'] as num?)?.toInt() ?? 0,
      chronology:
          Chronology.fromJson(json['chronology'] as Map<String, dynamic>),
      dayOfMonth: (json['dayOfMonth'] as num?)?.toInt() ?? 0,
      dayOfWeek: (json['dayOfWeek'] as num?)?.toInt() ?? 0,
      dayOfYear: (json['dayOfYear'] as num?)?.toInt() ?? 0,
      era: (json['era'] as num?)?.toInt() ?? 0,
      fieldTypes: (json['fieldTypes'] as List<dynamic>?)
              ?.map((e) => FieldTypes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => Fields.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      monthOfYear: (json['monthOfYear'] as num?)?.toInt() ?? 0,
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      weekOfWeekyear: (json['weekOfWeekyear'] as num?)?.toInt() ?? 0,
      weekyear: (json['weekyear'] as num?)?.toInt() ?? 0,
      year: (json['year'] as num?)?.toInt() ?? 0,
      yearOfCentury: (json['yearOfCentury'] as num?)?.toInt() ?? 0,
      yearOfEra: (json['yearOfEra'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$StartDateToJson(StartDate instance) => <String, dynamic>{
      'centuryOfEra': instance.centuryOfEra,
      'chronology': instance.chronology.toJson(),
      'dayOfMonth': instance.dayOfMonth,
      'dayOfWeek': instance.dayOfWeek,
      'dayOfYear': instance.dayOfYear,
      'era': instance.era,
      'fieldTypes': instance.fieldTypes.map((e) => e.toJson()).toList(),
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'monthOfYear': instance.monthOfYear,
      'values': instance.values,
      'weekOfWeekyear': instance.weekOfWeekyear,
      'weekyear': instance.weekyear,
      'year': instance.year,
      'yearOfCentury': instance.yearOfCentury,
      'yearOfEra': instance.yearOfEra,
    };
