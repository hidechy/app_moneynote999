// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomeResponseState {
  int get incomePrice => throw _privateConstructorUsedError;
  String get incomeFrom => throw _privateConstructorUsedError;

  ///
  AsyncValue<List<Income>> get incomeList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeResponseStateCopyWith<IncomeResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeResponseStateCopyWith<$Res> {
  factory $IncomeResponseStateCopyWith(
          IncomeResponseState value, $Res Function(IncomeResponseState) then) =
      _$IncomeResponseStateCopyWithImpl<$Res, IncomeResponseState>;
  @useResult
  $Res call(
      {int incomePrice,
      String incomeFrom,
      AsyncValue<List<Income>> incomeList});
}

/// @nodoc
class _$IncomeResponseStateCopyWithImpl<$Res, $Val extends IncomeResponseState>
    implements $IncomeResponseStateCopyWith<$Res> {
  _$IncomeResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomePrice = null,
    Object? incomeFrom = null,
    Object? incomeList = null,
  }) {
    return _then(_value.copyWith(
      incomePrice: null == incomePrice
          ? _value.incomePrice
          : incomePrice // ignore: cast_nullable_to_non_nullable
              as int,
      incomeFrom: null == incomeFrom
          ? _value.incomeFrom
          : incomeFrom // ignore: cast_nullable_to_non_nullable
              as String,
      incomeList: null == incomeList
          ? _value.incomeList
          : incomeList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Income>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomeResponseStateImplCopyWith<$Res>
    implements $IncomeResponseStateCopyWith<$Res> {
  factory _$$IncomeResponseStateImplCopyWith(_$IncomeResponseStateImpl value,
          $Res Function(_$IncomeResponseStateImpl) then) =
      __$$IncomeResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int incomePrice,
      String incomeFrom,
      AsyncValue<List<Income>> incomeList});
}

/// @nodoc
class __$$IncomeResponseStateImplCopyWithImpl<$Res>
    extends _$IncomeResponseStateCopyWithImpl<$Res, _$IncomeResponseStateImpl>
    implements _$$IncomeResponseStateImplCopyWith<$Res> {
  __$$IncomeResponseStateImplCopyWithImpl(_$IncomeResponseStateImpl _value,
      $Res Function(_$IncomeResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomePrice = null,
    Object? incomeFrom = null,
    Object? incomeList = null,
  }) {
    return _then(_$IncomeResponseStateImpl(
      incomePrice: null == incomePrice
          ? _value.incomePrice
          : incomePrice // ignore: cast_nullable_to_non_nullable
              as int,
      incomeFrom: null == incomeFrom
          ? _value.incomeFrom
          : incomeFrom // ignore: cast_nullable_to_non_nullable
              as String,
      incomeList: null == incomeList
          ? _value.incomeList
          : incomeList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Income>>,
    ));
  }
}

/// @nodoc

class _$IncomeResponseStateImpl implements _IncomeResponseState {
  const _$IncomeResponseStateImpl(
      {this.incomePrice = 0,
      this.incomeFrom = '',
      this.incomeList = const AsyncValue<List<Income>>.loading()});

  @override
  @JsonKey()
  final int incomePrice;
  @override
  @JsonKey()
  final String incomeFrom;

  ///
  @override
  @JsonKey()
  final AsyncValue<List<Income>> incomeList;

  @override
  String toString() {
    return 'IncomeResponseState(incomePrice: $incomePrice, incomeFrom: $incomeFrom, incomeList: $incomeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeResponseStateImpl &&
            (identical(other.incomePrice, incomePrice) ||
                other.incomePrice == incomePrice) &&
            (identical(other.incomeFrom, incomeFrom) ||
                other.incomeFrom == incomeFrom) &&
            (identical(other.incomeList, incomeList) ||
                other.incomeList == incomeList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, incomePrice, incomeFrom, incomeList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeResponseStateImplCopyWith<_$IncomeResponseStateImpl> get copyWith =>
      __$$IncomeResponseStateImplCopyWithImpl<_$IncomeResponseStateImpl>(
          this, _$identity);
}

abstract class _IncomeResponseState implements IncomeResponseState {
  const factory _IncomeResponseState(
      {final int incomePrice,
      final String incomeFrom,
      final AsyncValue<List<Income>> incomeList}) = _$IncomeResponseStateImpl;

  @override
  int get incomePrice;
  @override
  String get incomeFrom;
  @override

  ///
  AsyncValue<List<Income>> get incomeList;
  @override
  @JsonKey(ignore: true)
  _$$IncomeResponseStateImplCopyWith<_$IncomeResponseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
