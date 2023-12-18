import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/money.dart';
import 'moneies_response_state.dart';

final moneySingleProvider = StateNotifierProvider.autoDispose<MoneySingleNotifier, MoneiesResponseState>((ref) {
  return MoneySingleNotifier(const MoneiesResponseState());
});

class MoneySingleNotifier extends StateNotifier<MoneiesResponseState> {
  MoneySingleNotifier(super.state);

  ///
  Future<void> setMoney({required Money money}) async => state = state.copyWith(singleMoney: money);

  ///
  Future<void> setBeforeDateMoney({required Money money}) async => state = state.copyWith(beforeDateMoney: money);

  ///
  Future<void> setBeforeDateMoneyForSum({required Money money}) async =>
      state = state.copyWith(beforeDateMoneyForSum: money);
}
