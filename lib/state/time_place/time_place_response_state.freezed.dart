// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_place_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimePlaceResponseState {
  List<String> get spendTime => throw _privateConstructorUsedError;
  List<String> get spendPlace => throw _privateConstructorUsedError;
  List<int> get spendPrice => throw _privateConstructorUsedError;
  String get baseDiff => throw _privateConstructorUsedError;
  int get diff => throw _privateConstructorUsedError;
  List<bool> get minusCheck => throw _privateConstructorUsedError;
  AsyncValue<List<TimePlace>> get timePlaceList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimePlaceResponseStateCopyWith<TimePlaceResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimePlaceResponseStateCopyWith<$Res> {
  factory $TimePlaceResponseStateCopyWith(TimePlaceResponseState value,
          $Res Function(TimePlaceResponseState) then) =
      _$TimePlaceResponseStateCopyWithImpl<$Res, TimePlaceResponseState>;
  @useResult
  $Res call(
      {List<String> spendTime,
      List<String> spendPlace,
      List<int> spendPrice,
      String baseDiff,
      int diff,
      List<bool> minusCheck,
      AsyncValue<List<TimePlace>> timePlaceList});
}

/// @nodoc
class _$TimePlaceResponseStateCopyWithImpl<$Res,
        $Val extends TimePlaceResponseState>
    implements $TimePlaceResponseStateCopyWith<$Res> {
  _$TimePlaceResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendTime = null,
    Object? spendPlace = null,
    Object? spendPrice = null,
    Object? baseDiff = null,
    Object? diff = null,
    Object? minusCheck = null,
    Object? timePlaceList = null,
  }) {
    return _then(_value.copyWith(
      spendTime: null == spendTime
          ? _value.spendTime
          : spendTime // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spendPlace: null == spendPlace
          ? _value.spendPlace
          : spendPlace // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spendPrice: null == spendPrice
          ? _value.spendPrice
          : spendPrice // ignore: cast_nullable_to_non_nullable
              as List<int>,
      baseDiff: null == baseDiff
          ? _value.baseDiff
          : baseDiff // ignore: cast_nullable_to_non_nullable
              as String,
      diff: null == diff
          ? _value.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as int,
      minusCheck: null == minusCheck
          ? _value.minusCheck
          : minusCheck // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      timePlaceList: null == timePlaceList
          ? _value.timePlaceList
          : timePlaceList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TimePlace>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimePlaceResponseStateImplCopyWith<$Res>
    implements $TimePlaceResponseStateCopyWith<$Res> {
  factory _$$TimePlaceResponseStateImplCopyWith(
          _$TimePlaceResponseStateImpl value,
          $Res Function(_$TimePlaceResponseStateImpl) then) =
      __$$TimePlaceResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> spendTime,
      List<String> spendPlace,
      List<int> spendPrice,
      String baseDiff,
      int diff,
      List<bool> minusCheck,
      AsyncValue<List<TimePlace>> timePlaceList});
}

/// @nodoc
class __$$TimePlaceResponseStateImplCopyWithImpl<$Res>
    extends _$TimePlaceResponseStateCopyWithImpl<$Res,
        _$TimePlaceResponseStateImpl>
    implements _$$TimePlaceResponseStateImplCopyWith<$Res> {
  __$$TimePlaceResponseStateImplCopyWithImpl(
      _$TimePlaceResponseStateImpl _value,
      $Res Function(_$TimePlaceResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spendTime = null,
    Object? spendPlace = null,
    Object? spendPrice = null,
    Object? baseDiff = null,
    Object? diff = null,
    Object? minusCheck = null,
    Object? timePlaceList = null,
  }) {
    return _then(_$TimePlaceResponseStateImpl(
      spendTime: null == spendTime
          ? _value._spendTime
          : spendTime // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spendPlace: null == spendPlace
          ? _value._spendPlace
          : spendPlace // ignore: cast_nullable_to_non_nullable
              as List<String>,
      spendPrice: null == spendPrice
          ? _value._spendPrice
          : spendPrice // ignore: cast_nullable_to_non_nullable
              as List<int>,
      baseDiff: null == baseDiff
          ? _value.baseDiff
          : baseDiff // ignore: cast_nullable_to_non_nullable
              as String,
      diff: null == diff
          ? _value.diff
          : diff // ignore: cast_nullable_to_non_nullable
              as int,
      minusCheck: null == minusCheck
          ? _value._minusCheck
          : minusCheck // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      timePlaceList: null == timePlaceList
          ? _value.timePlaceList
          : timePlaceList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TimePlace>>,
    ));
  }
}

/// @nodoc

class _$TimePlaceResponseStateImpl implements _TimePlaceResponseState {
  const _$TimePlaceResponseStateImpl(
      {final List<String> spendTime = const [],
      final List<String> spendPlace = const [],
      final List<int> spendPrice = const [],
      this.baseDiff = '',
      this.diff = 0,
      final List<bool> minusCheck = const [],
      this.timePlaceList = const AsyncValue<List<TimePlace>>.loading()})
      : _spendTime = spendTime,
        _spendPlace = spendPlace,
        _spendPrice = spendPrice,
        _minusCheck = minusCheck;

  final List<String> _spendTime;
  @override
  @JsonKey()
  List<String> get spendTime {
    if (_spendTime is EqualUnmodifiableListView) return _spendTime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendTime);
  }

  final List<String> _spendPlace;
  @override
  @JsonKey()
  List<String> get spendPlace {
    if (_spendPlace is EqualUnmodifiableListView) return _spendPlace;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendPlace);
  }

  final List<int> _spendPrice;
  @override
  @JsonKey()
  List<int> get spendPrice {
    if (_spendPrice is EqualUnmodifiableListView) return _spendPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendPrice);
  }

  @override
  @JsonKey()
  final String baseDiff;
  @override
  @JsonKey()
  final int diff;
  final List<bool> _minusCheck;
  @override
  @JsonKey()
  List<bool> get minusCheck {
    if (_minusCheck is EqualUnmodifiableListView) return _minusCheck;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_minusCheck);
  }

  @override
  @JsonKey()
  final AsyncValue<List<TimePlace>> timePlaceList;

  @override
  String toString() {
    return 'TimePlaceResponseState(spendTime: $spendTime, spendPlace: $spendPlace, spendPrice: $spendPrice, baseDiff: $baseDiff, diff: $diff, minusCheck: $minusCheck, timePlaceList: $timePlaceList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimePlaceResponseStateImpl &&
            const DeepCollectionEquality()
                .equals(other._spendTime, _spendTime) &&
            const DeepCollectionEquality()
                .equals(other._spendPlace, _spendPlace) &&
            const DeepCollectionEquality()
                .equals(other._spendPrice, _spendPrice) &&
            (identical(other.baseDiff, baseDiff) ||
                other.baseDiff == baseDiff) &&
            (identical(other.diff, diff) || other.diff == diff) &&
            const DeepCollectionEquality()
                .equals(other._minusCheck, _minusCheck) &&
            (identical(other.timePlaceList, timePlaceList) ||
                other.timePlaceList == timePlaceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spendTime),
      const DeepCollectionEquality().hash(_spendPlace),
      const DeepCollectionEquality().hash(_spendPrice),
      baseDiff,
      diff,
      const DeepCollectionEquality().hash(_minusCheck),
      timePlaceList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimePlaceResponseStateImplCopyWith<_$TimePlaceResponseStateImpl>
      get copyWith => __$$TimePlaceResponseStateImplCopyWithImpl<
          _$TimePlaceResponseStateImpl>(this, _$identity);
}

abstract class _TimePlaceResponseState implements TimePlaceResponseState {
  const factory _TimePlaceResponseState(
          {final List<String> spendTime,
          final List<String> spendPlace,
          final List<int> spendPrice,
          final String baseDiff,
          final int diff,
          final List<bool> minusCheck,
          final AsyncValue<List<TimePlace>> timePlaceList}) =
      _$TimePlaceResponseStateImpl;

  @override
  List<String> get spendTime;
  @override
  List<String> get spendPlace;
  @override
  List<int> get spendPrice;
  @override
  String get baseDiff;
  @override
  int get diff;
  @override
  List<bool> get minusCheck;
  @override
  AsyncValue<List<TimePlace>> get timePlaceList;
  @override
  @JsonKey(ignore: true)
  _$$TimePlaceResponseStateImplCopyWith<_$TimePlaceResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
