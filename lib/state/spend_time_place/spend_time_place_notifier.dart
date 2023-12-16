import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'spend_time_place_response_state.dart';

final spendTimePlaceProvider =
    StateNotifierProvider.autoDispose<SpendTimePlaceNotifier, SpendTimePlaceResponseState>((ref) {
  final spendTime = List.generate(10, (index) => '');
  final spendPlace = List.generate(10, (index) => '');
  final spendItem = List.generate(10, (index) => '');
  final spendPrice = List.generate(10, (index) => 0);
  final minusCheck = List.generate(10, (index) => false);

  return SpendTimePlaceNotifier(
    SpendTimePlaceResponseState(
      spendTime: spendTime,
      spendPlace: spendPlace,
      spendItem: spendItem,
      spendPrice: spendPrice,
      minusCheck: minusCheck,
    ),
  );
});

class SpendTimePlaceNotifier extends StateNotifier<SpendTimePlaceResponseState> {
  SpendTimePlaceNotifier(super.state);

  ///
  Future<void> setBlinkingFlag({required bool blinkingFlag}) async =>
      state = state.copyWith(blinkingFlag: blinkingFlag);
}
