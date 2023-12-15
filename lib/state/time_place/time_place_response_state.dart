import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_place_response_state.freezed.dart';

@freezed
class TimePlaceResponseState with _$TimePlaceResponseState {
  const factory TimePlaceResponseState({
    @Default([]) List<String> spendTime,
    @Default([]) List<String> spendPlace,
    @Default([]) List<int> spendPrice,
    @Default('') String baseDiff,
    @Default(0) int diff,
    @Default([]) List<bool> minusCheck,
  }) = _TimePlaceResponseState;
}
