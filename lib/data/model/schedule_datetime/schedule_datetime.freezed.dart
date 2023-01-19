// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_datetime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScheduleDatetime {
  Term get term => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  int get week => throw _privateConstructorUsedError;
  int get weekDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleDatetimeCopyWith<ScheduleDatetime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleDatetimeCopyWith<$Res> {
  factory $ScheduleDatetimeCopyWith(
          ScheduleDatetime value, $Res Function(ScheduleDatetime) then) =
      _$ScheduleDatetimeCopyWithImpl<$Res, ScheduleDatetime>;
  @useResult
  $Res call({Term term, DateTime dateTime, int week, int weekDay});

  $TermCopyWith<$Res> get term;
}

/// @nodoc
class _$ScheduleDatetimeCopyWithImpl<$Res, $Val extends ScheduleDatetime>
    implements $ScheduleDatetimeCopyWith<$Res> {
  _$ScheduleDatetimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? dateTime = null,
    Object? week = null,
    Object? weekDay = null,
  }) {
    return _then(_value.copyWith(
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as Term,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      weekDay: null == weekDay
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TermCopyWith<$Res> get term {
    return $TermCopyWith<$Res>(_value.term, (value) {
      return _then(_value.copyWith(term: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ScheduleDatetimeCopyWith<$Res>
    implements $ScheduleDatetimeCopyWith<$Res> {
  factory _$$_ScheduleDatetimeCopyWith(
          _$_ScheduleDatetime value, $Res Function(_$_ScheduleDatetime) then) =
      __$$_ScheduleDatetimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Term term, DateTime dateTime, int week, int weekDay});

  @override
  $TermCopyWith<$Res> get term;
}

/// @nodoc
class __$$_ScheduleDatetimeCopyWithImpl<$Res>
    extends _$ScheduleDatetimeCopyWithImpl<$Res, _$_ScheduleDatetime>
    implements _$$_ScheduleDatetimeCopyWith<$Res> {
  __$$_ScheduleDatetimeCopyWithImpl(
      _$_ScheduleDatetime _value, $Res Function(_$_ScheduleDatetime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? dateTime = null,
    Object? week = null,
    Object? weekDay = null,
  }) {
    return _then(_$_ScheduleDatetime(
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as Term,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      week: null == week
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as int,
      weekDay: null == weekDay
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ScheduleDatetime extends _ScheduleDatetime {
  const _$_ScheduleDatetime(
      {required this.term,
      required this.dateTime,
      required this.week,
      required this.weekDay})
      : super._();

  @override
  final Term term;
  @override
  final DateTime dateTime;
  @override
  final int week;
  @override
  final int weekDay;

  @override
  String toString() {
    return 'ScheduleDatetime(term: $term, dateTime: $dateTime, week: $week, weekDay: $weekDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScheduleDatetime &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.week, week) || other.week == week) &&
            (identical(other.weekDay, weekDay) || other.weekDay == weekDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, term, dateTime, week, weekDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleDatetimeCopyWith<_$_ScheduleDatetime> get copyWith =>
      __$$_ScheduleDatetimeCopyWithImpl<_$_ScheduleDatetime>(this, _$identity);
}

abstract class _ScheduleDatetime extends ScheduleDatetime {
  const factory _ScheduleDatetime(
      {required final Term term,
      required final DateTime dateTime,
      required final int week,
      required final int weekDay}) = _$_ScheduleDatetime;
  const _ScheduleDatetime._() : super._();

  @override
  Term get term;
  @override
  DateTime get dateTime;
  @override
  int get week;
  @override
  int get weekDay;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleDatetimeCopyWith<_$_ScheduleDatetime> get copyWith =>
      throw _privateConstructorUsedError;
}
