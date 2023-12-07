// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_names_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankNamesResponseState {
  int get addBankNum => throw _privateConstructorUsedError;
  AsyncValue<List<BankName>> get bankNameList =>
      throw _privateConstructorUsedError;
  List<bool> get checkBoxes => throw _privateConstructorUsedError;
  List<String> get accountTypes => throw _privateConstructorUsedError;
  List<String> get depositTypes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankNamesResponseStateCopyWith<BankNamesResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankNamesResponseStateCopyWith<$Res> {
  factory $BankNamesResponseStateCopyWith(BankNamesResponseState value,
          $Res Function(BankNamesResponseState) then) =
      _$BankNamesResponseStateCopyWithImpl<$Res, BankNamesResponseState>;
  @useResult
  $Res call(
      {int addBankNum,
      AsyncValue<List<BankName>> bankNameList,
      List<bool> checkBoxes,
      List<String> accountTypes,
      List<String> depositTypes});
}

/// @nodoc
class _$BankNamesResponseStateCopyWithImpl<$Res,
        $Val extends BankNamesResponseState>
    implements $BankNamesResponseStateCopyWith<$Res> {
  _$BankNamesResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addBankNum = null,
    Object? bankNameList = null,
    Object? checkBoxes = null,
    Object? accountTypes = null,
    Object? depositTypes = null,
  }) {
    return _then(_value.copyWith(
      addBankNum: null == addBankNum
          ? _value.addBankNum
          : addBankNum // ignore: cast_nullable_to_non_nullable
              as int,
      bankNameList: null == bankNameList
          ? _value.bankNameList
          : bankNameList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankName>>,
      checkBoxes: null == checkBoxes
          ? _value.checkBoxes
          : checkBoxes // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      accountTypes: null == accountTypes
          ? _value.accountTypes
          : accountTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      depositTypes: null == depositTypes
          ? _value.depositTypes
          : depositTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankNamesResponseStateImplCopyWith<$Res>
    implements $BankNamesResponseStateCopyWith<$Res> {
  factory _$$BankNamesResponseStateImplCopyWith(
          _$BankNamesResponseStateImpl value,
          $Res Function(_$BankNamesResponseStateImpl) then) =
      __$$BankNamesResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int addBankNum,
      AsyncValue<List<BankName>> bankNameList,
      List<bool> checkBoxes,
      List<String> accountTypes,
      List<String> depositTypes});
}

/// @nodoc
class __$$BankNamesResponseStateImplCopyWithImpl<$Res>
    extends _$BankNamesResponseStateCopyWithImpl<$Res,
        _$BankNamesResponseStateImpl>
    implements _$$BankNamesResponseStateImplCopyWith<$Res> {
  __$$BankNamesResponseStateImplCopyWithImpl(
      _$BankNamesResponseStateImpl _value,
      $Res Function(_$BankNamesResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addBankNum = null,
    Object? bankNameList = null,
    Object? checkBoxes = null,
    Object? accountTypes = null,
    Object? depositTypes = null,
  }) {
    return _then(_$BankNamesResponseStateImpl(
      addBankNum: null == addBankNum
          ? _value.addBankNum
          : addBankNum // ignore: cast_nullable_to_non_nullable
              as int,
      bankNameList: null == bankNameList
          ? _value.bankNameList
          : bankNameList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BankName>>,
      checkBoxes: null == checkBoxes
          ? _value._checkBoxes
          : checkBoxes // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      accountTypes: null == accountTypes
          ? _value._accountTypes
          : accountTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      depositTypes: null == depositTypes
          ? _value._depositTypes
          : depositTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$BankNamesResponseStateImpl implements _BankNamesResponseState {
  const _$BankNamesResponseStateImpl(
      {this.addBankNum = 3,
      this.bankNameList = const AsyncValue<List<BankName>>.loading(),
      final List<bool> checkBoxes = const [],
      final List<String> accountTypes = const [],
      final List<String> depositTypes = const []})
      : _checkBoxes = checkBoxes,
        _accountTypes = accountTypes,
        _depositTypes = depositTypes;

  @override
  @JsonKey()
  final int addBankNum;
  @override
  @JsonKey()
  final AsyncValue<List<BankName>> bankNameList;
  final List<bool> _checkBoxes;
  @override
  @JsonKey()
  List<bool> get checkBoxes {
    if (_checkBoxes is EqualUnmodifiableListView) return _checkBoxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkBoxes);
  }

  final List<String> _accountTypes;
  @override
  @JsonKey()
  List<String> get accountTypes {
    if (_accountTypes is EqualUnmodifiableListView) return _accountTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accountTypes);
  }

  final List<String> _depositTypes;
  @override
  @JsonKey()
  List<String> get depositTypes {
    if (_depositTypes is EqualUnmodifiableListView) return _depositTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_depositTypes);
  }

  @override
  String toString() {
    return 'BankNamesResponseState(addBankNum: $addBankNum, bankNameList: $bankNameList, checkBoxes: $checkBoxes, accountTypes: $accountTypes, depositTypes: $depositTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankNamesResponseStateImpl &&
            (identical(other.addBankNum, addBankNum) ||
                other.addBankNum == addBankNum) &&
            (identical(other.bankNameList, bankNameList) ||
                other.bankNameList == bankNameList) &&
            const DeepCollectionEquality()
                .equals(other._checkBoxes, _checkBoxes) &&
            const DeepCollectionEquality()
                .equals(other._accountTypes, _accountTypes) &&
            const DeepCollectionEquality()
                .equals(other._depositTypes, _depositTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      addBankNum,
      bankNameList,
      const DeepCollectionEquality().hash(_checkBoxes),
      const DeepCollectionEquality().hash(_accountTypes),
      const DeepCollectionEquality().hash(_depositTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankNamesResponseStateImplCopyWith<_$BankNamesResponseStateImpl>
      get copyWith => __$$BankNamesResponseStateImplCopyWithImpl<
          _$BankNamesResponseStateImpl>(this, _$identity);
}

abstract class _BankNamesResponseState implements BankNamesResponseState {
  const factory _BankNamesResponseState(
      {final int addBankNum,
      final AsyncValue<List<BankName>> bankNameList,
      final List<bool> checkBoxes,
      final List<String> accountTypes,
      final List<String> depositTypes}) = _$BankNamesResponseStateImpl;

  @override
  int get addBankNum;
  @override
  AsyncValue<List<BankName>> get bankNameList;
  @override
  List<bool> get checkBoxes;
  @override
  List<String> get accountTypes;
  @override
  List<String> get depositTypes;
  @override
  @JsonKey(ignore: true)
  _$$BankNamesResponseStateImplCopyWith<_$BankNamesResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
