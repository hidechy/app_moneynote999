import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/money.dart';
import 'moneies_response_state.dart';

final moneyProvider = StateNotifierProvider.autoDispose<MoneyNotifier, MoneiesResponseState>((ref) {
  return MoneyNotifier(const MoneiesResponseState());
});

class MoneyNotifier extends StateNotifier<MoneiesResponseState> {
  MoneyNotifier(super.state);

  ///
  Future<void> setMoney({required Money money}) async => state = state.copyWith(singleMoney: money);

  ///
  Future<void> setBeforeDateMoney({required Money money}) async => state = state.copyWith(beforeDateMoney: money);

  ///
  Future<void> setBeforeDateMoneyForSum({required Money money}) async =>
      state = state.copyWith(beforeDateMoneyForSum: money);

  ///
  Future<void> setMoneyList({required List<Money> moneyList}) async =>
      state = state.copyWith(moneyList: AsyncValue.data(moneyList));

  ///
  Future<void> setMonthlyMoneyList({required List<Money> moneyList}) async {
    final map = <String, Money>{};
    moneyList.forEach((element) => map[element.date] = element);
    state = state.copyWith(moneyList: AsyncValue.data(moneyList), moneyMap: AsyncValue.data(map));
  }
}
