// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_names_setting_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankNamesSettingResponseState {
  AsyncValue<List<BankName>> get bankNameList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankNamesSettingResponseStateCopyWith<BankNamesSettingResponseState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankNamesSettingResponseStateCopyWith<$Res> {
  factory $BankNamesSettingResponseStateCopyWith(
          BankNamesSettingResponseState value,
          $Res Function(BankNamesSettingResponseState) then) =
      _$BankNamesSettingResponseStateCopyWithImpl<$Res,
          BankNamesSettingResponseState>;
  @useResult
  $Res call({AsyncValue<List<BankName>> bankNameList});
}

/// @nodoc
class _$BankNamesSettingResponseStateCopyWithImpl<$Res,
        $Val extends BankNamesSettingResponseState>
    implements $BankNamesSettingResponseStateCopyWith<$Res> {
  _$BankNamesSettingResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankNameList = null,
  }) {
    return _then(_value.copyWith(
      bankNameList: null == bankNameList
          ? _value.bankNameList
          : bankNameList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankName>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankNamesSettingResponseStateImplCopyWith<$Res>
    implements $BankNamesSettingResponseStateCopyWith<$Res> {
  factory _$$BankNamesSettingResponseStateImplCopyWith(
          _$BankNamesSettingResponseStateImpl value,
          $Res Function(_$BankNamesSettingResponseStateImpl) then) =
      __$$BankNamesSettingResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<BankName>> bankNameList});
}

/// @nodoc
class __$$BankNamesSettingResponseStateImplCopyWithImpl<$Res>
    extends _$BankNamesSettingResponseStateCopyWithImpl<$Res,
        _$BankNamesSettingResponseStateImpl>
    implements _$$BankNamesSettingResponseStateImplCopyWith<$Res> {
  __$$BankNamesSettingResponseStateImplCopyWithImpl(
      _$BankNamesSettingResponseStateImpl _value,
      $Res Function(_$BankNamesSettingResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankNameList = null,
  }) {
    return _then(_$BankNamesSettingResponseStateImpl(
      bankNameList: null == bankNameList
          ? _value.bankNameList
          : bankNameList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankName>>,
    ));
  }
}

/// @nodoc

class _$BankNamesSettingResponseStateImpl
    implements _BankNamesSettingResponseState {
  const _$BankNamesSettingResponseStateImpl(
      {this.bankNameList = const AsyncValue<List<BankName>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<BankName>> bankNameList;

  @override
  String toString() {
    return 'BankNamesSettingResponseState(bankNameList: $bankNameList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankNamesSettingResponseStateImpl &&
            (identical(other.bankNameList, bankNameList) ||
                other.bankNameList == bankNameList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bankNameList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankNamesSettingResponseStateImplCopyWith<
          _$BankNamesSettingResponseStateImpl>
      get copyWith => __$$BankNamesSettingResponseStateImplCopyWithImpl<
          _$BankNamesSettingResponseStateImpl>(this, _$identity);
}

abstract class _BankNamesSettingResponseState
    implements BankNamesSettingResponseState {
  const factory _BankNamesSettingResponseState(
          {final AsyncValue<List<BankName>> bankNameList}) =
      _$BankNamesSettingResponseStateImpl;

  @override
  AsyncValue<List<BankName>> get bankNameList;
  @override
  @JsonKey(ignore: true)
  _$$BankNamesSettingResponseStateImplCopyWith<
          _$BankNamesSettingResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
