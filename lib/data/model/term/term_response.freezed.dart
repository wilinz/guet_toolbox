// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'term_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TermResponse _$TermResponseFromJson(Map<String, dynamic> json) {
  return _TermResponse.fromJson(json);
}

/// @nodoc
mixin _$TermResponse {
  @JsonKey(name: "success", defaultValue: false)
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: "total", defaultValue: 0)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: "data", defaultValue: [])
  List<Term> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermResponseCopyWith<TermResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermResponseCopyWith<$Res> {
  factory $TermResponseCopyWith(
          TermResponse value, $Res Function(TermResponse) then) =
      _$TermResponseCopyWithImpl<$Res, TermResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "success", defaultValue: false) bool success,
      @JsonKey(name: "total", defaultValue: 0) int total,
      @JsonKey(name: "data", defaultValue: []) List<Term> data});
}

/// @nodoc
class _$TermResponseCopyWithImpl<$Res, $Val extends TermResponse>
    implements $TermResponseCopyWith<$Res> {
  _$TermResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Term>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermResponseCopyWith<$Res>
    implements $TermResponseCopyWith<$Res> {
  factory _$$_TermResponseCopyWith(
          _$_TermResponse value, $Res Function(_$_TermResponse) then) =
      __$$_TermResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "success", defaultValue: false) bool success,
      @JsonKey(name: "total", defaultValue: 0) int total,
      @JsonKey(name: "data", defaultValue: []) List<Term> data});
}

/// @nodoc
class __$$_TermResponseCopyWithImpl<$Res>
    extends _$TermResponseCopyWithImpl<$Res, _$_TermResponse>
    implements _$$_TermResponseCopyWith<$Res> {
  __$$_TermResponseCopyWithImpl(
      _$_TermResponse _value, $Res Function(_$_TermResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? total = null,
    Object? data = null,
  }) {
    return _then(_$_TermResponse(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Term>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TermResponse implements _TermResponse {
  const _$_TermResponse(
      {@JsonKey(name: "success", defaultValue: false)
          this.success = false,
      @JsonKey(name: "total", defaultValue: 0)
          this.total = 0,
      @JsonKey(name: "data", defaultValue: [])
          final List<Term> data = const <Term>[]})
      : _data = data;

  factory _$_TermResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TermResponseFromJson(json);

  @override
  @JsonKey(name: "success", defaultValue: false)
  final bool success;
  @override
  @JsonKey(name: "total", defaultValue: 0)
  final int total;
  final List<Term> _data;
  @override
  @JsonKey(name: "data", defaultValue: [])
  List<Term> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TermResponse(success: $success, total: $total, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermResponse &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, total, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermResponseCopyWith<_$_TermResponse> get copyWith =>
      __$$_TermResponseCopyWithImpl<_$_TermResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TermResponseToJson(
      this,
    );
  }
}

abstract class _TermResponse implements TermResponse {
  const factory _TermResponse(
          {@JsonKey(name: "success", defaultValue: false) final bool success,
          @JsonKey(name: "total", defaultValue: 0) final int total,
          @JsonKey(name: "data", defaultValue: []) final List<Term> data}) =
      _$_TermResponse;

  factory _TermResponse.fromJson(Map<String, dynamic> json) =
      _$_TermResponse.fromJson;

  @override
  @JsonKey(name: "success", defaultValue: false)
  bool get success;
  @override
  @JsonKey(name: "total", defaultValue: 0)
  int get total;
  @override
  @JsonKey(name: "data", defaultValue: [])
  List<Term> get data;
  @override
  @JsonKey(ignore: true)
  _$$_TermResponseCopyWith<_$_TermResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Term _$TermFromJson(Map<String, dynamic> json) {
  return _Term.fromJson(json);
}

/// @nodoc
mixin _$Term {
  @JsonKey(name: "term", defaultValue: "")
  String get term => throw _privateConstructorUsedError;
  @JsonKey(name: "startdate", fromJson: _parseDateTime)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "enddate", fromJson: _parseDateTime)
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
  int get weekNum => throw _privateConstructorUsedError;
  @JsonKey(name: "termname", defaultValue: "")
  String get termName => throw _privateConstructorUsedError;
  @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
  int get schoolYear => throw _privateConstructorUsedError;
  @JsonKey(name: "comm")
  String get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermCopyWith<Term> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermCopyWith<$Res> {
  factory $TermCopyWith(Term value, $Res Function(Term) then) =
      _$TermCopyWithImpl<$Res, Term>;
  @useResult
  $Res call(
      {@JsonKey(name: "term", defaultValue: "")
          String term,
      @JsonKey(name: "startdate", fromJson: _parseDateTime)
          DateTime startDate,
      @JsonKey(name: "enddate", fromJson: _parseDateTime)
          DateTime endDate,
      @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
          int weekNum,
      @JsonKey(name: "termname", defaultValue: "")
          String termName,
      @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
          int schoolYear,
      @JsonKey(name: "comm")
          String comment});
}

/// @nodoc
class _$TermCopyWithImpl<$Res, $Val extends Term>
    implements $TermCopyWith<$Res> {
  _$TermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? weekNum = null,
    Object? termName = null,
    Object? schoolYear = null,
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekNum: null == weekNum
          ? _value.weekNum
          : weekNum // ignore: cast_nullable_to_non_nullable
              as int,
      termName: null == termName
          ? _value.termName
          : termName // ignore: cast_nullable_to_non_nullable
              as String,
      schoolYear: null == schoolYear
          ? _value.schoolYear
          : schoolYear // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermCopyWith<$Res> implements $TermCopyWith<$Res> {
  factory _$$_TermCopyWith(_$_Term value, $Res Function(_$_Term) then) =
      __$$_TermCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "term", defaultValue: "")
          String term,
      @JsonKey(name: "startdate", fromJson: _parseDateTime)
          DateTime startDate,
      @JsonKey(name: "enddate", fromJson: _parseDateTime)
          DateTime endDate,
      @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
          int weekNum,
      @JsonKey(name: "termname", defaultValue: "")
          String termName,
      @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
          int schoolYear,
      @JsonKey(name: "comm")
          String comment});
}

/// @nodoc
class __$$_TermCopyWithImpl<$Res> extends _$TermCopyWithImpl<$Res, _$_Term>
    implements _$$_TermCopyWith<$Res> {
  __$$_TermCopyWithImpl(_$_Term _value, $Res Function(_$_Term) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? weekNum = null,
    Object? termName = null,
    Object? schoolYear = null,
    Object? comment = null,
  }) {
    return _then(_$_Term(
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekNum: null == weekNum
          ? _value.weekNum
          : weekNum // ignore: cast_nullable_to_non_nullable
              as int,
      termName: null == termName
          ? _value.termName
          : termName // ignore: cast_nullable_to_non_nullable
              as String,
      schoolYear: null == schoolYear
          ? _value.schoolYear
          : schoolYear // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Term implements _Term {
  const _$_Term(
      {@JsonKey(name: "term", defaultValue: "")
          this.term = "",
      @JsonKey(name: "startdate", fromJson: _parseDateTime)
          required this.startDate,
      @JsonKey(name: "enddate", fromJson: _parseDateTime)
          required this.endDate,
      @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
          this.weekNum = 0,
      @JsonKey(name: "termname", defaultValue: "")
          this.termName = "",
      @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
          required this.schoolYear,
      @JsonKey(name: "comm")
          this.comment = ""});

  factory _$_Term.fromJson(Map<String, dynamic> json) => _$$_TermFromJson(json);

  @override
  @JsonKey(name: "term", defaultValue: "")
  final String term;
  @override
  @JsonKey(name: "startdate", fromJson: _parseDateTime)
  final DateTime startDate;
  @override
  @JsonKey(name: "enddate", fromJson: _parseDateTime)
  final DateTime endDate;
  @override
  @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
  final int weekNum;
  @override
  @JsonKey(name: "termname", defaultValue: "")
  final String termName;
  @override
  @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
  final int schoolYear;
  @override
  @JsonKey(name: "comm")
  final String comment;

  @override
  String toString() {
    return 'Term(term: $term, startDate: $startDate, endDate: $endDate, weekNum: $weekNum, termName: $termName, schoolYear: $schoolYear, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Term &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.weekNum, weekNum) || other.weekNum == weekNum) &&
            (identical(other.termName, termName) ||
                other.termName == termName) &&
            (identical(other.schoolYear, schoolYear) ||
                other.schoolYear == schoolYear) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, term, startDate, endDate,
      weekNum, termName, schoolYear, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermCopyWith<_$_Term> get copyWith =>
      __$$_TermCopyWithImpl<_$_Term>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TermToJson(
      this,
    );
  }
}

abstract class _Term implements Term {
  const factory _Term(
      {@JsonKey(name: "term", defaultValue: "")
          final String term,
      @JsonKey(name: "startdate", fromJson: _parseDateTime)
          required final DateTime startDate,
      @JsonKey(name: "enddate", fromJson: _parseDateTime)
          required final DateTime endDate,
      @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
          final int weekNum,
      @JsonKey(name: "termname", defaultValue: "")
          final String termName,
      @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
          required final int schoolYear,
      @JsonKey(name: "comm")
          final String comment}) = _$_Term;

  factory _Term.fromJson(Map<String, dynamic> json) = _$_Term.fromJson;

  @override
  @JsonKey(name: "term", defaultValue: "")
  String get term;
  @override
  @JsonKey(name: "startdate", fromJson: _parseDateTime)
  DateTime get startDate;
  @override
  @JsonKey(name: "enddate", fromJson: _parseDateTime)
  DateTime get endDate;
  @override
  @JsonKey(name: "weeknum", defaultValue: 0, fromJson: _parseStringToInt)
  int get weekNum;
  @override
  @JsonKey(name: "termname", defaultValue: "")
  String get termName;
  @override
  @JsonKey(name: "schoolyear", fromJson: _parseStringToInt)
  int get schoolYear;
  @override
  @JsonKey(name: "comm")
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$_TermCopyWith<_$_Term> get copyWith => throw _privateConstructorUsedError;
}
