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
  Money? get beforeDateMoneyForSum => throw _privateConstructorUsedError; //
  AsyncValue<List<Money>> get moneyList =>
      throw _privateConstructorUsedError; //
  AsyncValue<Map<String, Money>> get moneyMap =>
      throw _privateConstructorUsedError;

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
      Money? beforeDateMoneyForSum,
      AsyncValue<List<Money>> moneyList,
      AsyncValue<Map<String, Money>> moneyMap});
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
    Object? moneyList = null,
    Object? moneyMap = null,
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
      moneyList: null == moneyList
          ? _value.moneyList
          : moneyList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Money>>,
      moneyMap: null == moneyMap
          ? _value.moneyMap
          : moneyMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, Money>>,
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
      Money? beforeDateMoneyForSum,
      AsyncValue<List<Money>> moneyList,
      AsyncValue<Map<String, Money>> moneyMap});
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
    Object? moneyList = null,
    Object? moneyMap = null,
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
      moneyList: null == moneyList
          ? _value.moneyList
          : moneyList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Money>>,
      moneyMap: null == moneyMap
          ? _value.moneyMap
          : moneyMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, Money>>,
    ));
  }
}

/// @nodoc

class _$MoneiesResponseStateImpl implements _MoneiesResponseState {
  const _$MoneiesResponseStateImpl(
      {this.singleMoney,
      this.beforeDateMoney,
      this.beforeDateMoneyForSum,
      this.moneyList = const AsyncValue<List<Money>>.loading(),
      this.moneyMap = const AsyncValue<Map<String, Money>>.loading()});

  @override
  final Money? singleMoney;
  @override
  final Money? beforeDateMoney;
  @override
  final Money? beforeDateMoneyForSum;
//
  @override
  @JsonKey()
  final AsyncValue<List<Money>> moneyList;
//
  @override
  @JsonKey()
  final AsyncValue<Map<String, Money>> moneyMap;

  @override
  String toString() {
    return 'MoneiesResponseState(singleMoney: $singleMoney, beforeDateMoney: $beforeDateMoney, beforeDateMoneyForSum: $beforeDateMoneyForSum, moneyList: $moneyList, moneyMap: $moneyMap)';
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
                other.beforeDateMoneyForSum == beforeDateMoneyForSum) &&
            (identical(other.moneyList, moneyList) ||
                other.moneyList == moneyList) &&
            (identical(other.moneyMap, moneyMap) ||
                other.moneyMap == moneyMap));
  }

  @override
  int get hashCode => Object.hash(runtimeType, singleMoney, beforeDateMoney,
      beforeDateMoneyForSum, moneyList, moneyMap);

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
          final Money? beforeDateMoneyForSum,
          final AsyncValue<List<Money>> moneyList,
          final AsyncValue<Map<String, Money>> moneyMap}) =
      _$MoneiesResponseStateImpl;

  @override
  Money? get singleMoney;
  @override
  Money? get beforeDateMoney;
  @override
  Money? get beforeDateMoneyForSum;
  @override //
  AsyncValue<List<Money>> get moneyList;
  @override //
  AsyncValue<Map<String, Money>> get moneyMap;
  @override
  @JsonKey(ignore: true)
  _$$MoneiesResponseStateImplCopyWith<_$MoneiesResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
