import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/models/spend.dart';

import '../../extensions/extensions.dart';
import 'spend_response_state.dart';

final spendProvider = StateNotifierProvider.autoDispose<SpendNotifier, SpendResponseState>((ref) {
  final list = <String>[];
  final list2 = <int>[];
  final list3 = <bool>[];
  for (var i = 0; i < 10; i++) {
    list.add('');
    list2.add(0);
    list3.add(false);
  }

  return SpendNotifier(SpendResponseState(spendItem: list, spendPrice: list2, minusCheck: list3));
});

class SpendNotifier extends StateNotifier<SpendResponseState> {
  SpendNotifier(super.state);

  ///
  Future<void> setBaseDiff({required String baseDiff}) async {
    state = state.copyWith(baseDiff: baseDiff);
  }

  ///
  Future<void> setItemPos({required int pos}) async {
    state = state.copyWith(itemPos: pos);
  }

  ///
  Future<void> setMinusCheck({required int pos}) async {
    final minusChecks = <bool>[...state.minusCheck];
    final check = minusChecks[pos];
    minusChecks[pos] = !check;
    state = state.copyWith(minusCheck: minusChecks);
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

  ///
  Future<void> setSpendItem({required int pos, required String item}) async {
    final items = <String>[...state.spendItem];

    items[pos] = item;

    state = state.copyWith(spendItem: items);
  }

  ///
  Future<void> setSpendList({required List<Spend> spendList}) async =>
      state = state.copyWith(spendList: AsyncValue.data(spendList));
}
