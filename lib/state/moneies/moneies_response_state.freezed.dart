// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moneies_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoneiesResponseState {
  Money? get singleMoney => throw _privateConstructorUsedError;
  Money? get beforeDateMoney => throw _privateConstructorUsedError;
  Money? get beforeDateMoneyForSum => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneiesResponseStateCopyWith<MoneiesResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneiesResponseStateCopyWith<$Res> {
  factory $MoneiesResponseStateCopyWith(MoneiesResponseState value,
          $Res Function(MoneiesResponseState) then) =
      _$MoneiesResponseStateCopyWithImpl<$Res, MoneiesResponseState>;
  @useResult
  $Res call(
      {Money? singleMoney,
      Money? beforeDateMoney,
      Money? beforeDateMoneyForSum});
}

/// @nodoc
class _$MoneiesResponseStateCopyWithImpl<$Res,
        $Val extends MoneiesResponseState>
    implements $MoneiesResponseStateCopyWith<$Res> {
  _$MoneiesResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleMoney = freezed,
    Object? beforeDateMoney = freezed,
    Object? beforeDateMoneyForSum = freezed,
  }) {
    return _then(_value.copyWith(
      singleMoney: freezed == singleMoney
          ? _value.singleMoney
          : singleMoney // ignore: cast_nullable_to_non_nullable
              as Money?,
      beforeDateMoney: freezed == beforeDateMoney
          ? _value.beforeDateMoney
          : beforeDateMoney // ignore: cast_nullable_to_non_nullable
              as Money?,
      beforeDateMoneyForSum: freezed == beforeDateMoneyForSum
          ? _value.beforeDateMoneyForSum
          : beforeDateMoneyForSum // ignore: cast_nullable_to_non_nullable
              as Money?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoneiesResponseStateImplCopyWith<$Res>
    implements $MoneiesResponseStateCopyWith<$Res> {
  factory _$$MoneiesResponseStateImplCopyWith(_$MoneiesResponseStateImpl value,
          $Res Function(_$MoneiesResponseStateImpl) then) =
      __$$MoneiesResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Money? singleMoney,
      Money? beforeDateMoney,
      Money? beforeDateMoneyForSum});
}

/// @nodoc
class __$$MoneiesResponseStateImplCopyWithImpl<$Res>
    extends _$MoneiesResponseStateCopyWithImpl<$Res, _$MoneiesResponseStateImpl>
    implements _$$MoneiesResponseStateImplCopyWith<$Res> {
  __$$MoneiesResponseStateImplCopyWithImpl(_$MoneiesResponseStateImpl _value,
      $Res Function(_$MoneiesResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? singleMoney = freezed,
    Object? beforeDateMoney = freezed,
    Object? beforeDateMoneyForSum = freezed,
  }) {
    return _then(_$MoneiesResponseStateImpl(
      singleMoney: freezed == singleMoney
          ? _value.singleMoney
          : singleMoney // ignore: cast_nullable_to_non_nullable
              as Money?,
      beforeDateMoney: freezed == beforeDateMoney
          ? _value.beforeDateMoney
          : beforeDateMoney // ignore: cast_nullable_to_non_nullable
              as Money?,
      beforeDateMoneyForSum: freezed == beforeDateMoneyForSum
          ? _value.beforeDateMoneyForSum
          : beforeDateMoneyForSum // ignore: cast_nullable_to_non_nullable
              as Money?,
    ));
  }
}

/// @nodoc

class _$MoneiesResponseStateImpl implements _MoneiesResponseState {
  const _$MoneiesResponseStateImpl(
      {this.singleMoney, this.beforeDateMoney, this.beforeDateMoneyForSum});

  @override
  final Money? singleMoney;
  @override
  final Money? beforeDateMoney;
  @override
  final Money? beforeDateMoneyForSum;

  @override
  String toString() {
    return 'MoneiesResponseState(singleMoney: $singleMoney, beforeDateMoney: $beforeDateMoney, beforeDateMoneyForSum: $beforeDateMoneyForSum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoneiesResponseStateImpl &&
            (identical(other.singleMoney, singleMoney) ||
                other.singleMoney == singleMoney) &&
            (identical(other.beforeDateMoney, beforeDateMoney) ||
                other.beforeDateMoney == beforeDateMoney) &&
            (identical(other.beforeDateMoneyForSum, beforeDateMoneyForSum) ||
                other.beforeDateMoneyForSum == beforeDateMoneyForSum));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, singleMoney, beforeDateMoney, beforeDateMoneyForSum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoneiesResponseStateImplCopyWith<_$MoneiesResponseStateImpl>
      get copyWith =>
          __$$MoneiesResponseStateImplCopyWithImpl<_$MoneiesResponseStateImpl>(
              this, _$identity);
}

abstract class _MoneiesResponseState implements MoneiesResponseState {
  const factory _MoneiesResponseState(
      {final Money? singleMoney,
      final Money? beforeDateMoney,
      final Money? beforeDateMoneyForSum}) = _$MoneiesResponseStateImpl;

  @override
  Money? get singleMoney;
  @override
  Money? get beforeDateMoney;
  @override
  Money? get beforeDateMoneyForSum;
  @override
  @JsonKey(ignore: true)
  _$$MoneiesResponseStateImplCopyWith<_$MoneiesResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
