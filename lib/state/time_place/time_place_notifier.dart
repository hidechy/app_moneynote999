import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/models/timeplace.dart';

import '../../extensions/extensions.dart';
import 'time_place_response_state.dart';

final timePlaceProvider = StateNotifierProvider.autoDispose<TimePlaceNotifier, TimePlaceResponseState>((ref) {
  final spendTime = List.generate(10, (index) => '');
  final spendPlace = List.generate(10, (index) => '');
  final spendPrice = List.generate(10, (index) => 0);
  final minusCheck = List.generate(10, (index) => false);

  return TimePlaceNotifier(
    TimePlaceResponseState(
      spendTime: spendTime,
      spendPlace: spendPlace,
      spendPrice: spendPrice,
      minusCheck: minusCheck,
    ),
  );
});

class TimePlaceNotifier extends StateNotifier<TimePlaceResponseState> {
  TimePlaceNotifier(super.state);

  ///
  Future<void> setBaseDiff({required String baseDiff}) async => state = state.copyWith(baseDiff: baseDiff);

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
      sum += prices[i];
    }

    final baseDiff = state.baseDiff.toInt();
    final diff = baseDiff - sum;

    state = state.copyWith(spendPrice: prices, diff: diff);
  }

  ///
  Future<void> setMinusCheck({required int pos}) async {
    final minusChecks = <bool>[...state.minusCheck];
    final check = minusChecks[pos];
    minusChecks[pos] = !check;
    state = state.copyWith(minusCheck: minusChecks);
  }

  ///
  Future<void> deleteTimePlaceList({required String date}) async {}

  ///
  Future<void> clearInputValue() async {
    final spendTime = List.generate(10, (index) => '');
    final spendPlace = List.generate(10, (index) => '');
    final spendPrice = List.generate(10, (index) => 0);
    final minusCheck = List.generate(10, (index) => false);

    state = state.copyWith(
      spendTime: spendTime,
      spendPlace: spendPlace,
      spendPrice: spendPrice,
      minusCheck: minusCheck,
      baseDiff: '',
      diff: 0,
    );
  }

  ///
  Future<void> setTimePlaceList({required List<TimePlace> timePlaceList}) async =>
      state = state.copyWith(timePlaceList: AsyncValue.data(timePlaceList));
}
