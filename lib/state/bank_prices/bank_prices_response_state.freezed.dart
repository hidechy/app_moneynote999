// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_prices_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankPricesResponseState {
  AsyncValue<List<BankPrice>> get bankPriceList =>
      throw _privateConstructorUsedError;

  ///
  AsyncValue<Map<String, List<BankPrice>>> get bankPriceListMap =>
      throw _privateConstructorUsedError;

  ///
  AsyncValue<Map<String, Map<String, int>>> get bankPriceDatePadMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankPricesResponseStateCopyWith<BankPricesResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankPricesResponseStateCopyWith<$Res> {
  factory $BankPricesResponseStateCopyWith(BankPricesResponseState value,
          $Res Function(BankPricesResponseState) then) =
      _$BankPricesResponseStateCopyWithImpl<$Res, BankPricesResponseState>;
  @useResult
  $Res call(
      {AsyncValue<List<BankPrice>> bankPriceList,
      AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap,
      AsyncValue<Map<String, Map<String, int>>> bankPriceDatePadMap});
}

/// @nodoc
class _$BankPricesResponseStateCopyWithImpl<$Res,
        $Val extends BankPricesResponseState>
    implements $BankPricesResponseStateCopyWith<$Res> {
  _$BankPricesResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankPriceList = null,
    Object? bankPriceListMap = null,
    Object? bankPriceDatePadMap = null,
  }) {
    return _then(_value.copyWith(
      bankPriceList: null == bankPriceList
          ? _value.bankPriceList
          : bankPriceList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankPrice>>,
      bankPriceListMap: null == bankPriceListMap
          ? _value.bankPriceListMap
          : bankPriceListMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, List<BankPrice>>>,
      bankPriceDatePadMap: null == bankPriceDatePadMap
          ? _value.bankPriceDatePadMap
          : bankPriceDatePadMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, Map<String, int>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankPricesResponseStateImplCopyWith<$Res>
    implements $BankPricesResponseStateCopyWith<$Res> {
  factory _$$BankPricesResponseStateImplCopyWith(
          _$BankPricesResponseStateImpl value,
          $Res Function(_$BankPricesResponseStateImpl) then) =
      __$$BankPricesResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<BankPrice>> bankPriceList,
      AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap,
      AsyncValue<Map<String, Map<String, int>>> bankPriceDatePadMap});
}

/// @nodoc
class __$$BankPricesResponseStateImplCopyWithImpl<$Res>
    extends _$BankPricesResponseStateCopyWithImpl<$Res,
        _$BankPricesResponseStateImpl>
    implements _$$BankPricesResponseStateImplCopyWith<$Res> {
  __$$BankPricesResponseStateImplCopyWithImpl(
      _$BankPricesResponseStateImpl _value,
      $Res Function(_$BankPricesResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankPriceList = null,
    Object? bankPriceListMap = null,
    Object? bankPriceDatePadMap = null,
  }) {
    return _then(_$BankPricesResponseStateImpl(
      bankPriceList: null == bankPriceList
          ? _value.bankPriceList
          : bankPriceList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankPrice>>,
      bankPriceListMap: null == bankPriceListMap
          ? _value.bankPriceListMap
          : bankPriceListMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, List<BankPrice>>>,
      bankPriceDatePadMap: null == bankPriceDatePadMap
          ? _value.bankPriceDatePadMap
          : bankPriceDatePadMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, Map<String, int>>>,
    ));
  }
}

/// @nodoc

class _$BankPricesResponseStateImpl implements _BankPricesResponseState {
  const _$BankPricesResponseStateImpl(
      {this.bankPriceList = const AsyncValue<List<BankPrice>>.loading(),
      this.bankPriceListMap =
          const AsyncValue<Map<String, List<BankPrice>>>.loading(),
      this.bankPriceDatePadMap =
          const AsyncValue<Map<String, Map<String, int>>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<BankPrice>> bankPriceList;

  ///
  @override
  @JsonKey()
  final AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap;

  ///
  @override
  @JsonKey()
  final AsyncValue<Map<String, Map<String, int>>> bankPriceDatePadMap;

  @override
  String toString() {
    return 'BankPricesResponseState(bankPriceList: $bankPriceList, bankPriceListMap: $bankPriceListMap, bankPriceDatePadMap: $bankPriceDatePadMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankPricesResponseStateImpl &&
            (identical(other.bankPriceList, bankPriceList) ||
                other.bankPriceList == bankPriceList) &&
            (identical(other.bankPriceListMap, bankPriceListMap) ||
                other.bankPriceListMap == bankPriceListMap) &&
            (identical(other.bankPriceDatePadMap, bankPriceDatePadMap) ||
                other.bankPriceDatePadMap == bankPriceDatePadMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bankPriceList, bankPriceListMap, bankPriceDatePadMap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankPricesResponseStateImplCopyWith<_$BankPricesResponseStateImpl>
      get copyWith => __$$BankPricesResponseStateImplCopyWithImpl<
          _$BankPricesResponseStateImpl>(this, _$identity);
}

abstract class _BankPricesResponseState implements BankPricesResponseState {
  const factory _BankPricesResponseState(
      {final AsyncValue<List<BankPrice>> bankPriceList,
      final AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap,
      final AsyncValue<Map<String, Map<String, int>>>
          bankPriceDatePadMap}) = _$BankPricesResponseStateImpl;

  @override
  AsyncValue<List<BankPrice>> get bankPriceList;
  @override

  ///
  AsyncValue<Map<String, List<BankPrice>>> get bankPriceListMap;
  @override

  ///
  AsyncValue<Map<String, Map<String, int>>> get bankPriceDatePadMap;
  @override
  @JsonKey(ignore: true)
  _$$BankPricesResponseStateImplCopyWith<_$BankPricesResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
