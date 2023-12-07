// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HolidayResponseState {
  AsyncValue<Map<String, String>> get holidayMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolidayResponseStateCopyWith<HolidayResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayResponseStateCopyWith<$Res> {
  factory $HolidayResponseStateCopyWith(HolidayResponseState value,
          $Res Function(HolidayResponseState) then) =
      _$HolidayResponseStateCopyWithImpl<$Res, HolidayResponseState>;
  @useResult
  $Res call({AsyncValue<Map<String, String>> holidayMap});
}

/// @nodoc
class _$HolidayResponseStateCopyWithImpl<$Res,
        $Val extends HolidayResponseState>
    implements $HolidayResponseStateCopyWith<$Res> {
  _$HolidayResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holidayMap = null,
  }) {
    return _then(_value.copyWith(
      holidayMap: null == holidayMap
          ? _value.holidayMap
          : holidayMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayResponseStateImplCopyWith<$Res>
    implements $HolidayResponseStateCopyWith<$Res> {
  factory _$$HolidayResponseStateImplCopyWith(_$HolidayResponseStateImpl value,
          $Res Function(_$HolidayResponseStateImpl) then) =
      __$$HolidayResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<Map<String, String>> holidayMap});
}

/// @nodoc
class __$$HolidayResponseStateImplCopyWithImpl<$Res>
    extends _$HolidayResponseStateCopyWithImpl<$Res, _$HolidayResponseStateImpl>
    implements _$$HolidayResponseStateImplCopyWith<$Res> {
  __$$HolidayResponseStateImplCopyWithImpl(_$HolidayResponseStateImpl _value,
      $Res Function(_$HolidayResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? holidayMap = null,
  }) {
    return _then(_$HolidayResponseStateImpl(
      holidayMap: null == holidayMap
          ? _value.holidayMap
          : holidayMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, String>>,
    ));
  }
}

/// @nodoc

class _$HolidayResponseStateImpl implements _HolidayResponseState {
  const _$HolidayResponseStateImpl(
      {this.holidayMap = const AsyncValue<Map<String, String>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<Map<String, String>> holidayMap;

  @override
  String toString() {
    return 'HolidayResponseState(holidayMap: $holidayMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayResponseStateImpl &&
            (identical(other.holidayMap, holidayMap) ||
                other.holidayMap == holidayMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, holidayMap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayResponseStateImplCopyWith<_$HolidayResponseStateImpl>
      get copyWith =>
          __$$HolidayResponseStateImplCopyWithImpl<_$HolidayResponseStateImpl>(
              this, _$identity);
}

abstract class _HolidayResponseState implements HolidayResponseState {
  const factory _HolidayResponseState(
          {final AsyncValue<Map<String, String>> holidayMap}) =
      _$HolidayResponseStateImpl;

  @override
  AsyncValue<Map<String, String>> get holidayMap;
  @override
  @JsonKey(ignore: true)
  _$$HolidayResponseStateImplCopyWith<_$HolidayResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
