import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/spend_time_place.dart';

part 'spend_time_place_response_state.freezed.dart';

@freezed
class SpendTimePlaceResponseState with _$SpendTimePlaceResponseState {
  const factory SpendTimePlaceResponseState({
    @Default(0) int itemPos,
    //
    @Default('') String baseDiff,
    @Default(0) int diff,
    //
    @Default([]) List<String> spendTime,
    @Default([]) List<String> spendPlace,
    @Default([]) List<String> spendItem,
    @Default([]) List<int> spendPrice,
    @Default([]) List<bool> minusCheck,
    //
    @Default(AsyncValue<List<SpendTimePlace>>.loading()) AsyncValue<List<SpendTimePlace>> spendTimePlaceList,

    //
    @Default(false) bool blinkingFlag,
  }) = _SpendTimePlaceResponseState;
}
