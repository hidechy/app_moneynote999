// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incomes_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomesResponseState {
  AsyncValue<List<Income>> get incomeList => throw _privateConstructorUsedError;
  int get incomeMinYear => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomesResponseStateCopyWith<IncomesResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomesResponseStateCopyWith<$Res> {
  factory $IncomesResponseStateCopyWith(IncomesResponseState value,
          $Res Function(IncomesResponseState) then) =
      _$IncomesResponseStateCopyWithImpl<$Res, IncomesResponseState>;
  @useResult
  $Res call({AsyncValue<List<Income>> incomeList, int incomeMinYear});
}

/// @nodoc
class _$IncomesResponseStateCopyWithImpl<$Res,
        $Val extends IncomesResponseState>
    implements $IncomesResponseStateCopyWith<$Res> {
  _$IncomesResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeList = null,
    Object? incomeMinYear = null,
  }) {
    return _then(_value.copyWith(
      incomeList: null == incomeList
          ? _value.incomeList
          : incomeList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Income>>,
      incomeMinYear: null == incomeMinYear
          ? _value.incomeMinYear
          : incomeMinYear // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncomesResponseStateImplCopyWith<$Res>
    implements $IncomesResponseStateCopyWith<$Res> {
  factory _$$IncomesResponseStateImplCopyWith(_$IncomesResponseStateImpl value,
          $Res Function(_$IncomesResponseStateImpl) then) =
      __$$IncomesResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<Income>> incomeList, int incomeMinYear});
}

/// @nodoc
class __$$IncomesResponseStateImplCopyWithImpl<$Res>
    extends _$IncomesResponseStateCopyWithImpl<$Res, _$IncomesResponseStateImpl>
    implements _$$IncomesResponseStateImplCopyWith<$Res> {
  __$$IncomesResponseStateImplCopyWithImpl(_$IncomesResponseStateImpl _value,
      $Res Function(_$IncomesResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeList = null,
    Object? incomeMinYear = null,
  }) {
    return _then(_$IncomesResponseStateImpl(
      incomeList: null == incomeList
          ? _value.incomeList
          : incomeList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Income>>,
      incomeMinYear: null == incomeMinYear
          ? _value.incomeMinYear
          : incomeMinYear // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncomesResponseStateImpl implements _IncomesResponseState {
  const _$IncomesResponseStateImpl(
      {this.incomeList = const AsyncValue<List<Income>>.loading(),
      this.incomeMinYear = 0});

  @override
  @JsonKey()
  final AsyncValue<List<Income>> incomeList;
  @override
  @JsonKey()
  final int incomeMinYear;

  @override
  String toString() {
    return 'IncomesResponseState(incomeList: $incomeList, incomeMinYear: $incomeMinYear)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomesResponseStateImpl &&
            (identical(other.incomeList, incomeList) ||
                other.incomeList == incomeList) &&
            (identical(other.incomeMinYear, incomeMinYear) ||
                other.incomeMinYear == incomeMinYear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomeList, incomeMinYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomesResponseStateImplCopyWith<_$IncomesResponseStateImpl>
      get copyWith =>
          __$$IncomesResponseStateImplCopyWithImpl<_$IncomesResponseStateImpl>(
              this, _$identity);
}

abstract class _IncomesResponseState implements IncomesResponseState {
  const factory _IncomesResponseState(
      {final AsyncValue<List<Income>> incomeList,
      final int incomeMinYear}) = _$IncomesResponseStateImpl;

  @override
  AsyncValue<List<Income>> get incomeList;
  @override
  int get incomeMinYear;
  @override
  @JsonKey(ignore: true)
  _$$IncomesResponseStateImplCopyWith<_$IncomesResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
