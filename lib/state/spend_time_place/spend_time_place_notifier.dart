import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/extensions/extensions.dart';

import 'spend_time_place_response_state.dart';

final spendTimePlaceProvider =
    StateNotifierProvider.autoDispose<SpendTimePlaceNotifier, SpendTimePlaceResponseState>((ref) {
  final spendTime = List.generate(10, (index) => '時間');
  final spendPlace = List.generate(10, (index) => '');
  final spendItem = List.generate(10, (index) => '項目名');
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

  ///
  Future<void> setItemPos({required int pos}) async => state = state.copyWith(itemPos: pos);

  ///
  Future<void> setSpendItem({required int pos, required String item}) async {
    final items = <String>[...state.spendItem];

    items[pos] = item;

    state = state.copyWith(spendItem: items);
  }

  ///
  Future<void> setTime({required int pos, required String time}) async {
    final spendTime = <String>[...state.spendTime];
    spendTime[pos] = time;
    state = state.copyWith(spendTime: spendTime);
  }

  ///
  Future<void> setPlace({required int pos, required String place}) async {
    final spendPlace = <String>[...state.spendPlace];
    spendPlace[pos] = place;
    state = state.copyWith(spendPlace: spendPlace);
  }

  ///
  Future<void> setSpendPrice({required int pos, required int price}) async {
    final prices = <int>[...state.spendPrice];
    prices[pos] = price;

    var sum = 0;
    for (var i = 0; i < prices.length; i++) {
      if (state.minusCheck[i]) {
        sum -= prices[i];
      } else {
        sum += prices[i];
      }
    }

    final baseDiff = state.baseDiff.toInt();
    final diff = baseDiff - sum;

    state = state.copyWith(spendPrice: prices, diff: diff);
  }
}
