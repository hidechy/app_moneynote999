import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/extensions/extensions.dart';
import 'package:money_note/models/spend_time_place.dart';

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
  Future<void> setBaseDiff({required String baseDiff}) async => state = state.copyWith(baseDiff: baseDiff);

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
  Future<void> setMinusCheck({required int pos}) async {
    final minusChecks = <bool>[...state.minusCheck];
    final check = minusChecks[pos];
    minusChecks[pos] = !check;
    state = state.copyWith(minusCheck: minusChecks);
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

  ///
  Future<void> deleteSpendTimePlaceList({required String date}) async {
    if (state.spendTimePlaceList.value != null) {
      final spendTimePlaceList = state.spendTimePlaceList.value!;

      spendTimePlaceList.where((element) => element.date == date).toList().forEach((element) {
        try {
          spendTimePlaceList.removeAt(element.id!);
          // ignore: avoid_catches_without_on_clauses, empty_catches
        } catch (e) {}
      });

      state = state.copyWith(spendTimePlaceList: AsyncValue.data(spendTimePlaceList));
    }
  }

  ///
  Future<void> clearInputValue() async {
    final spendTime = List.generate(10, (index) => '時間');
    final spendPlace = List.generate(10, (index) => '');
    final spendItem = List.generate(10, (index) => '項目名');
    final spendPrice = List.generate(10, (index) => 0);
    final minusCheck = List.generate(10, (index) => false);

    state = state.copyWith(
      spendTime: spendTime,
      spendPlace: spendPlace,
      spendItem: spendItem,
      spendPrice: spendPrice,
      minusCheck: minusCheck,
      itemPos: 0,
      baseDiff: '',
      diff: 0,
    );
  }

  ///
  Future<void> setSpendTimePlaceList({required List<SpendTimePlace> spendTimePlaceList}) async =>
      state = state.copyWith(spendTimePlaceList: AsyncValue.data(spendTimePlaceList));
}
