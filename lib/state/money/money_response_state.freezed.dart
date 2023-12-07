// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoneyResponseState {
  Money? get singleMoney => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneyResponseStateCopyWith<MoneyResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyResponseStateCopyWith<$Res> {
  factory $MoneyResponseStateCopyWith(
          MoneyResponseState value, $Res Function(MoneyResponseState) then) =
      _$MoneyResponseStateCopyWithImpl<$Res, MoneyResponseState>;
  @useResult
  $Res call({Money? singleMoney});
}

/// @nodoc
class _$MoneyResponseStateCopyWithImpl<$Res, $Val extends MoneyResponseState>
    implements $MoneyResponseStateCopyWith<$Res> {
  _$MoneyResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleMoney = freezed,
  }) {
    return _then(_value.copyWith(
      singleMoney: freezed == singleMoney
          ? _value.singleMoney
          : singleMoney // ignore: cast_nullable_to_non_nullable
              as Money?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoneyResponseStateImplCopyWith<$Res>
    implements $MoneyResponseStateCopyWith<$Res> {
  factory _$$MoneyResponseStateImplCopyWith(_$MoneyResponseStateImpl value,
          $Res Function(_$MoneyResponseStateImpl) then) =
      __$$MoneyResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Money? singleMoney});
}

/// @nodoc
class __$$MoneyResponseStateImplCopyWithImpl<$Res>
    extends _$MoneyResponseStateCopyWithImpl<$Res, _$MoneyResponseStateImpl>
    implements _$$MoneyResponseStateImplCopyWith<$Res> {
  __$$MoneyResponseStateImplCopyWithImpl(_$MoneyResponseStateImpl _value,
      $Res Function(_$MoneyResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleMoney = freezed,
  }) {
    return _then(_$MoneyResponseStateImpl(
      singleMoney: freezed == singleMoney
          ? _value.singleMoney
          : singleMoney // ignore: cast_nullable_to_non_nullable
              as Money?,
    ));
  }
}

/// @nodoc

class _$MoneyResponseStateImpl implements _MoneyResponseState {
  const _$MoneyResponseStateImpl({this.singleMoney});

  @override
  final Money? singleMoney;

  @override
  String toString() {
    return 'MoneyResponseState(singleMoney: $singleMoney)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoneyResponseStateImpl &&
            (identical(other.singleMoney, singleMoney) ||
                other.singleMoney == singleMoney));
  }

  @override
  int get hashCode => Object.hash(runtimeType, singleMoney);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoneyResponseStateImplCopyWith<_$MoneyResponseStateImpl> get copyWith =>
      __$$MoneyResponseStateImplCopyWithImpl<_$MoneyResponseStateImpl>(
          this, _$identity);
}

abstract class _MoneyResponseState implements MoneyResponseState {
  const factory _MoneyResponseState({final Money? singleMoney}) =
      _$MoneyResponseStateImpl;

  @override
  Money? get singleMoney;
  @override
  @JsonKey(ignore: true)
  _$$MoneyResponseStateImplCopyWith<_$MoneyResponseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
