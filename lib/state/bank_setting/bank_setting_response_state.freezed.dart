// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_setting_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankSettingResponseState {
  int get addBankNum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankSettingResponseStateCopyWith<BankSettingResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankSettingResponseStateCopyWith<$Res> {
  factory $BankSettingResponseStateCopyWith(BankSettingResponseState value,
          $Res Function(BankSettingResponseState) then) =
      _$BankSettingResponseStateCopyWithImpl<$Res, BankSettingResponseState>;
  @useResult
  $Res call({int addBankNum});
}

/// @nodoc
class _$BankSettingResponseStateCopyWithImpl<$Res,
        $Val extends BankSettingResponseState>
    implements $BankSettingResponseStateCopyWith<$Res> {
  _$BankSettingResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addBankNum = null,
  }) {
    return _then(_value.copyWith(
      addBankNum: null == addBankNum
          ? _value.addBankNum
          : addBankNum // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankSettingResponseStateImplCopyWith<$Res>
    implements $BankSettingResponseStateCopyWith<$Res> {
  factory _$$BankSettingResponseStateImplCopyWith(
          _$BankSettingResponseStateImpl value,
          $Res Function(_$BankSettingResponseStateImpl) then) =
      __$$BankSettingResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int addBankNum});
}

/// @nodoc
class __$$BankSettingResponseStateImplCopyWithImpl<$Res>
    extends _$BankSettingResponseStateCopyWithImpl<$Res,
        _$BankSettingResponseStateImpl>
    implements _$$BankSettingResponseStateImplCopyWith<$Res> {
  __$$BankSettingResponseStateImplCopyWithImpl(
      _$BankSettingResponseStateImpl _value,
      $Res Function(_$BankSettingResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addBankNum = null,
  }) {
    return _then(_$BankSettingResponseStateImpl(
      addBankNum: null == addBankNum
          ? _value.addBankNum
          : addBankNum // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BankSettingResponseStateImpl implements _BankSettingResponseState {
  const _$BankSettingResponseStateImpl({this.addBankNum = 3});

  @override
  @JsonKey()
  final int addBankNum;

  @override
  String toString() {
    return 'BankSettingResponseState(addBankNum: $addBankNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankSettingResponseStateImpl &&
            (identical(other.addBankNum, addBankNum) ||
                other.addBankNum == addBankNum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addBankNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankSettingResponseStateImplCopyWith<_$BankSettingResponseStateImpl>
      get copyWith => __$$BankSettingResponseStateImplCopyWithImpl<
          _$BankSettingResponseStateImpl>(this, _$identity);
}

abstract class _BankSettingResponseState implements BankSettingResponseState {
  const factory _BankSettingResponseState({final int addBankNum}) =
      _$BankSettingResponseStateImpl;

  @override
  int get addBankNum;
  @override
  @JsonKey(ignore: true)
  _$$BankSettingResponseStateImplCopyWith<_$BankSettingResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
