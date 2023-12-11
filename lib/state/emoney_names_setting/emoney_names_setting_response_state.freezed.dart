// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emoney_names_setting_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmoneyNamesSettingResponseState {
  AsyncValue<List<EmoneyName>> get emoneyNameList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmoneyNamesSettingResponseStateCopyWith<EmoneyNamesSettingResponseState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmoneyNamesSettingResponseStateCopyWith<$Res> {
  factory $EmoneyNamesSettingResponseStateCopyWith(
          EmoneyNamesSettingResponseState value,
          $Res Function(EmoneyNamesSettingResponseState) then) =
      _$EmoneyNamesSettingResponseStateCopyWithImpl<$Res,
          EmoneyNamesSettingResponseState>;
  @useResult
  $Res call({AsyncValue<List<EmoneyName>> emoneyNameList});
}

/// @nodoc
class _$EmoneyNamesSettingResponseStateCopyWithImpl<$Res,
        $Val extends EmoneyNamesSettingResponseState>
    implements $EmoneyNamesSettingResponseStateCopyWith<$Res> {
  _$EmoneyNamesSettingResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emoneyNameList = null,
  }) {
    return _then(_value.copyWith(
      emoneyNameList: null == emoneyNameList
          ? _value.emoneyNameList
          : emoneyNameList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<EmoneyName>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmoneyNamesSettingResponseStateImplCopyWith<$Res>
    implements $EmoneyNamesSettingResponseStateCopyWith<$Res> {
  factory _$$EmoneyNamesSettingResponseStateImplCopyWith(
          _$EmoneyNamesSettingResponseStateImpl value,
          $Res Function(_$EmoneyNamesSettingResponseStateImpl) then) =
      __$$EmoneyNamesSettingResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<EmoneyName>> emoneyNameList});
}

/// @nodoc
class __$$EmoneyNamesSettingResponseStateImplCopyWithImpl<$Res>
    extends _$EmoneyNamesSettingResponseStateCopyWithImpl<$Res,
        _$EmoneyNamesSettingResponseStateImpl>
    implements _$$EmoneyNamesSettingResponseStateImplCopyWith<$Res> {
  __$$EmoneyNamesSettingResponseStateImplCopyWithImpl(
      _$EmoneyNamesSettingResponseStateImpl _value,
      $Res Function(_$EmoneyNamesSettingResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emoneyNameList = null,
  }) {
    return _then(_$EmoneyNamesSettingResponseStateImpl(
      emoneyNameList: null == emoneyNameList
          ? _value.emoneyNameList
          : emoneyNameList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<EmoneyName>>,
    ));
  }
}

/// @nodoc

class _$EmoneyNamesSettingResponseStateImpl
    implements _EmoneyNamesSettingResponseState {
  const _$EmoneyNamesSettingResponseStateImpl(
      {this.emoneyNameList = const AsyncValue<List<EmoneyName>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<EmoneyName>> emoneyNameList;

  @override
  String toString() {
    return 'EmoneyNamesSettingResponseState(emoneyNameList: $emoneyNameList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmoneyNamesSettingResponseStateImpl &&
            (identical(other.emoneyNameList, emoneyNameList) ||
                other.emoneyNameList == emoneyNameList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emoneyNameList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmoneyNamesSettingResponseStateImplCopyWith<
          _$EmoneyNamesSettingResponseStateImpl>
      get copyWith => __$$EmoneyNamesSettingResponseStateImplCopyWithImpl<
          _$EmoneyNamesSettingResponseStateImpl>(this, _$identity);
}

abstract class _EmoneyNamesSettingResponseState
    implements EmoneyNamesSettingResponseState {
  const factory _EmoneyNamesSettingResponseState(
          {final AsyncValue<List<EmoneyName>> emoneyNameList}) =
      _$EmoneyNamesSettingResponseStateImpl;

  @override
  AsyncValue<List<EmoneyName>> get emoneyNameList;
  @override
  @JsonKey(ignore: true)
  _$$EmoneyNamesSettingResponseStateImplCopyWith<
          _$EmoneyNamesSettingResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
