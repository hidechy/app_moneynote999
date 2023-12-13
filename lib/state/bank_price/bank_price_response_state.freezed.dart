// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_price_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankPriceResponseState {
  AsyncValue<List<BankPrice>> get bankPriceList =>
      throw _privateConstructorUsedError;
  AsyncValue<Map<String, BankPrice>> get bankPriceLastMap =>
      throw _privateConstructorUsedError;
  AsyncValue<Map<String, List<BankPrice>>> get bankPriceListMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankPriceResponseStateCopyWith<BankPriceResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankPriceResponseStateCopyWith<$Res> {
  factory $BankPriceResponseStateCopyWith(BankPriceResponseState value,
          $Res Function(BankPriceResponseState) then) =
      _$BankPriceResponseStateCopyWithImpl<$Res, BankPriceResponseState>;
  @useResult
  $Res call(
      {AsyncValue<List<BankPrice>> bankPriceList,
      AsyncValue<Map<String, BankPrice>> bankPriceLastMap,
      AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap});
}

/// @nodoc
class _$BankPriceResponseStateCopyWithImpl<$Res,
        $Val extends BankPriceResponseState>
    implements $BankPriceResponseStateCopyWith<$Res> {
  _$BankPriceResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankPriceList = null,
    Object? bankPriceLastMap = null,
    Object? bankPriceListMap = null,
  }) {
    return _then(_value.copyWith(
      bankPriceList: null == bankPriceList
          ? _value.bankPriceList
          : bankPriceList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankPrice>>,
      bankPriceLastMap: null == bankPriceLastMap
          ? _value.bankPriceLastMap
          : bankPriceLastMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, BankPrice>>,
      bankPriceListMap: null == bankPriceListMap
          ? _value.bankPriceListMap
          : bankPriceListMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, List<BankPrice>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankPriceResponseStateImplCopyWith<$Res>
    implements $BankPriceResponseStateCopyWith<$Res> {
  factory _$$BankPriceResponseStateImplCopyWith(
          _$BankPriceResponseStateImpl value,
          $Res Function(_$BankPriceResponseStateImpl) then) =
      __$$BankPriceResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<BankPrice>> bankPriceList,
      AsyncValue<Map<String, BankPrice>> bankPriceLastMap,
      AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap});
}

/// @nodoc
class __$$BankPriceResponseStateImplCopyWithImpl<$Res>
    extends _$BankPriceResponseStateCopyWithImpl<$Res,
        _$BankPriceResponseStateImpl>
    implements _$$BankPriceResponseStateImplCopyWith<$Res> {
  __$$BankPriceResponseStateImplCopyWithImpl(
      _$BankPriceResponseStateImpl _value,
      $Res Function(_$BankPriceResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankPriceList = null,
    Object? bankPriceLastMap = null,
    Object? bankPriceListMap = null,
  }) {
    return _then(_$BankPriceResponseStateImpl(
      bankPriceList: null == bankPriceList
          ? _value.bankPriceList
          : bankPriceList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankPrice>>,
      bankPriceLastMap: null == bankPriceLastMap
          ? _value.bankPriceLastMap
          : bankPriceLastMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, BankPrice>>,
      bankPriceListMap: null == bankPriceListMap
          ? _value.bankPriceListMap
          : bankPriceListMap // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Map<String, List<BankPrice>>>,
    ));
  }
}

/// @nodoc

class _$BankPriceResponseStateImpl implements _BankPriceResponseState {
  const _$BankPriceResponseStateImpl(
      {this.bankPriceList = const AsyncValue<List<BankPrice>>.loading(),
      this.bankPriceLastMap =
          const AsyncValue<Map<String, BankPrice>>.loading(),
      this.bankPriceListMap =
          const AsyncValue<Map<String, List<BankPrice>>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<BankPrice>> bankPriceList;
  @override
  @JsonKey()
  final AsyncValue<Map<String, BankPrice>> bankPriceLastMap;
  @override
  @JsonKey()
  final AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap;

  @override
  String toString() {
    return 'BankPriceResponseState(bankPriceList: $bankPriceList, bankPriceLastMap: $bankPriceLastMap, bankPriceListMap: $bankPriceListMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankPriceResponseStateImpl &&
            (identical(other.bankPriceList, bankPriceList) ||
                other.bankPriceList == bankPriceList) &&
            (identical(other.bankPriceLastMap, bankPriceLastMap) ||
                other.bankPriceLastMap == bankPriceLastMap) &&
            (identical(other.bankPriceListMap, bankPriceListMap) ||
                other.bankPriceListMap == bankPriceListMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bankPriceList, bankPriceLastMap, bankPriceListMap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankPriceResponseStateImplCopyWith<_$BankPriceResponseStateImpl>
      get copyWith => __$$BankPriceResponseStateImplCopyWithImpl<
          _$BankPriceResponseStateImpl>(this, _$identity);
}

abstract class _BankPriceResponseState implements BankPriceResponseState {
  const factory _BankPriceResponseState(
          {final AsyncValue<List<BankPrice>> bankPriceList,
          final AsyncValue<Map<String, BankPrice>> bankPriceLastMap,
          final AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap}) =
      _$BankPriceResponseStateImpl;

  @override
  AsyncValue<List<BankPrice>> get bankPriceList;
  @override
  AsyncValue<Map<String, BankPrice>> get bankPriceLastMap;
  @override
  AsyncValue<Map<String, List<BankPrice>>> get bankPriceListMap;
  @override
  @JsonKey(ignore: true)
  _$$BankPriceResponseStateImplCopyWith<_$BankPriceResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
