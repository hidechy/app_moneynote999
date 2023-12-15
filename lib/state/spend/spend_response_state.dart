import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/spend.dart';

part 'spend_response_state.freezed.dart';

@freezed
class SpendResponseState with _$SpendResponseState {
  const factory SpendResponseState({
    @Default([]) List<String> spendItem,
    @Default([]) List<int> spendPrice,
    @Default(0) int itemPos,
    @Default('') String baseDiff,
    @Default(0) int diff,
    @Default([]) List<bool> minusCheck,
    @Default(AsyncValue<List<Spend>>.loading()) AsyncValue<List<Spend>> spendList,
  }) = _SpendResponseState;
}
