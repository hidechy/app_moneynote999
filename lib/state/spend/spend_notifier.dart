import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/spend.dart';
import 'spend_response_state.dart';

final spendProvider = StateNotifierProvider.autoDispose<SpendNotifier, SpendResponseState>((ref) {
  final spendItem = List.generate(10, (index) => '');
  final spendPrice = List.generate(10, (index) => 0);
  final minusCheck = List.generate(10, (index) => false);

  return SpendNotifier(SpendResponseState(spendItem: spendItem, spendPrice: spendPrice, minusCheck: minusCheck));
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

  ///
  Future<void> clearInputValue() async {
    final spendItem = List.generate(10, (index) => '');
    final spendPrice = List.generate(10, (index) => 0);
    final minusCheck = List.generate(10, (index) => false);

    state = state.copyWith(
        spendItem: spendItem, spendPrice: spendPrice, minusCheck: minusCheck, itemPos: 0, baseDiff: '', diff: 0);
  }

  ///
  Future<void> deleteSpendList({required String date}) async {
    final spendList = state.spendList.value!;

    spendList.where((element) => element.date == date).toList().forEach((element) {
      try {
        spendList.removeAt(element.id!);
        // ignore: avoid_catches_without_on_clauses, empty_catches
      } catch (e) {}
    });

    state = state.copyWith(spendList: AsyncValue.data(spendList));
  }

  ///
  Future<void> setUpdateValue(
      {required List<String> spendItem, required List<int> spendPrice, required List<bool> minusCheck}) async {
    state = state.copyWith(
        spendItem: spendItem, spendPrice: spendPrice, minusCheck: minusCheck, itemPos: 0, baseDiff: '', diff: 0);
  }

  ///

  Future<void> clearOneLineItem({required int pos}) async {
    final spendItem = [...state.spendItem];
    final spendPrice = [...state.spendPrice];
    final minusCheck = [...state.minusCheck];

    spendItem[pos] = '';
    spendPrice[pos] = 0;
    minusCheck[pos] = false;

    state = state.copyWith(spendItem: spendItem, spendPrice: spendPrice, minusCheck: minusCheck);
  }
}
