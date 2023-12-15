import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/models/timeplace.dart';

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
    @Default(AsyncValue<List<TimePlace>>.loading()) AsyncValue<List<TimePlace>> timePlaceList,
  }) = _TimePlaceResponseState;
}
