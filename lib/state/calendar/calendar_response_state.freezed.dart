// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarResponseState {
  String get baseYearMonth => throw _privateConstructorUsedError;
  String get prevYearMonth => throw _privateConstructorUsedError;
  String get nextYearMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarResponseStateCopyWith<CalendarResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarResponseStateCopyWith<$Res> {
  factory $CalendarResponseStateCopyWith(CalendarResponseState value,
          $Res Function(CalendarResponseState) then) =
      _$CalendarResponseStateCopyWithImpl<$Res, CalendarResponseState>;
  @useResult
  $Res call({String baseYearMonth, String prevYearMonth, String nextYearMonth});
}

/// @nodoc
class _$CalendarResponseStateCopyWithImpl<$Res,
        $Val extends CalendarResponseState>
    implements $CalendarResponseStateCopyWith<$Res> {
  _$CalendarResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseYearMonth = null,
    Object? prevYearMonth = null,
    Object? nextYearMonth = null,
  }) {
    return _then(_value.copyWith(
      baseYearMonth: null == baseYearMonth
          ? _value.baseYearMonth
          : baseYearMonth // ignore: cast_nullable_to_non_nullable
              as String,
      prevYearMonth: null == prevYearMonth
          ? _value.prevYearMonth
          : prevYearMonth // ignore: cast_nullable_to_non_nullable
              as String,
      nextYearMonth: null == nextYearMonth
          ? _value.nextYearMonth
          : nextYearMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarResponseStateImplCopyWith<$Res>
    implements $CalendarResponseStateCopyWith<$Res> {
  factory _$$CalendarResponseStateImplCopyWith(
          _$CalendarResponseStateImpl value,
          $Res Function(_$CalendarResponseStateImpl) then) =
      __$$CalendarResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String baseYearMonth, String prevYearMonth, String nextYearMonth});
}

/// @nodoc
class __$$CalendarResponseStateImplCopyWithImpl<$Res>
    extends _$CalendarResponseStateCopyWithImpl<$Res,
        _$CalendarResponseStateImpl>
    implements _$$CalendarResponseStateImplCopyWith<$Res> {
  __$$CalendarResponseStateImplCopyWithImpl(_$CalendarResponseStateImpl _value,
      $Res Function(_$CalendarResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseYearMonth = null,
    Object? prevYearMonth = null,
    Object? nextYearMonth = null,
  }) {
    return _then(_$CalendarResponseStateImpl(
      baseYearMonth: null == baseYearMonth
          ? _value.baseYearMonth
          : baseYearMonth // ignore: cast_nullable_to_non_nullable
              as String,
      prevYearMonth: null == prevYearMonth
          ? _value.prevYearMonth
          : prevYearMonth // ignore: cast_nullable_to_non_nullable
              as String,
      nextYearMonth: null == nextYearMonth
          ? _value.nextYearMonth
          : nextYearMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CalendarResponseStateImpl implements _CalendarResponseState {
  const _$CalendarResponseStateImpl(
      {this.baseYearMonth = '',
      this.prevYearMonth = '',
      this.nextYearMonth = ''});

  @override
  @JsonKey()
  final String baseYearMonth;
  @override
  @JsonKey()
  final String prevYearMonth;
  @override
  @JsonKey()
  final String nextYearMonth;

  @override
  String toString() {
    return 'CalendarResponseState(baseYearMonth: $baseYearMonth, prevYearMonth: $prevYearMonth, nextYearMonth: $nextYearMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarResponseStateImpl &&
            (identical(other.baseYearMonth, baseYearMonth) ||
                other.baseYearMonth == baseYearMonth) &&
            (identical(other.prevYearMonth, prevYearMonth) ||
                other.prevYearMonth == prevYearMonth) &&
            (identical(other.nextYearMonth, nextYearMonth) ||
                other.nextYearMonth == nextYearMonth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, baseYearMonth, prevYearMonth, nextYearMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarResponseStateImplCopyWith<_$CalendarResponseStateImpl>
      get copyWith => __$$CalendarResponseStateImplCopyWithImpl<
          _$CalendarResponseStateImpl>(this, _$identity);
}

abstract class _CalendarResponseState implements CalendarResponseState {
  const factory _CalendarResponseState(
      {final String baseYearMonth,
      final String prevYearMonth,
      final String nextYearMonth}) = _$CalendarResponseStateImpl;

  @override
  String get baseYearMonth;
  @override
  String get prevYearMonth;
  @override
  String get nextYearMonth;
  @override
  @JsonKey(ignore: true)
  _$$CalendarResponseStateImplCopyWith<_$CalendarResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
