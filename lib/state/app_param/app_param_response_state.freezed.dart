// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_param_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppParamResponseState {
  DateTime? get calendarSelectedDate => throw _privateConstructorUsedError;
  int get menuNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppParamResponseStateCopyWith<AppParamResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppParamResponseStateCopyWith<$Res> {
  factory $AppParamResponseStateCopyWith(AppParamResponseState value,
          $Res Function(AppParamResponseState) then) =
      _$AppParamResponseStateCopyWithImpl<$Res, AppParamResponseState>;
  @useResult
  $Res call({DateTime? calendarSelectedDate, int menuNumber});
}

/// @nodoc
class _$AppParamResponseStateCopyWithImpl<$Res,
        $Val extends AppParamResponseState>
    implements $AppParamResponseStateCopyWith<$Res> {
  _$AppParamResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarSelectedDate = freezed,
    Object? menuNumber = null,
  }) {
    return _then(_value.copyWith(
      calendarSelectedDate: freezed == calendarSelectedDate
          ? _value.calendarSelectedDate
          : calendarSelectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      menuNumber: null == menuNumber
          ? _value.menuNumber
          : menuNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppParamResponseStateImplCopyWith<$Res>
    implements $AppParamResponseStateCopyWith<$Res> {
  factory _$$AppParamResponseStateImplCopyWith(
          _$AppParamResponseStateImpl value,
          $Res Function(_$AppParamResponseStateImpl) then) =
      __$$AppParamResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? calendarSelectedDate, int menuNumber});
}

/// @nodoc
class __$$AppParamResponseStateImplCopyWithImpl<$Res>
    extends _$AppParamResponseStateCopyWithImpl<$Res,
        _$AppParamResponseStateImpl>
    implements _$$AppParamResponseStateImplCopyWith<$Res> {
  __$$AppParamResponseStateImplCopyWithImpl(_$AppParamResponseStateImpl _value,
      $Res Function(_$AppParamResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendarSelectedDate = freezed,
    Object? menuNumber = null,
  }) {
    return _then(_$AppParamResponseStateImpl(
      calendarSelectedDate: freezed == calendarSelectedDate
          ? _value.calendarSelectedDate
          : calendarSelectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      menuNumber: null == menuNumber
          ? _value.menuNumber
          : menuNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppParamResponseStateImpl implements _AppParamResponseState {
  const _$AppParamResponseStateImpl(
      {this.calendarSelectedDate, this.menuNumber = 0});

  @override
  final DateTime? calendarSelectedDate;
  @override
  @JsonKey()
  final int menuNumber;

  @override
  String toString() {
    return 'AppParamResponseState(calendarSelectedDate: $calendarSelectedDate, menuNumber: $menuNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppParamResponseStateImpl &&
            (identical(other.calendarSelectedDate, calendarSelectedDate) ||
                other.calendarSelectedDate == calendarSelectedDate) &&
            (identical(other.menuNumber, menuNumber) ||
                other.menuNumber == menuNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, calendarSelectedDate, menuNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppParamResponseStateImplCopyWith<_$AppParamResponseStateImpl>
      get copyWith => __$$AppParamResponseStateImplCopyWithImpl<
          _$AppParamResponseStateImpl>(this, _$identity);
}

abstract class _AppParamResponseState implements AppParamResponseState {
  const factory _AppParamResponseState(
      {final DateTime? calendarSelectedDate,
      final int menuNumber}) = _$AppParamResponseStateImpl;

  @override
  DateTime? get calendarSelectedDate;
  @override
  int get menuNumber;
  @override
  @JsonKey(ignore: true)
  _$$AppParamResponseStateImplCopyWith<_$AppParamResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
