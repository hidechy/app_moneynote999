import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/money.dart';
import 'money_response_state.dart';

final moneySingleProvider = StateNotifierProvider.autoDispose<MoneySingleNotifier, MoneyResponseState>((ref) {
  return MoneySingleNotifier(const MoneyResponseState());
});

class MoneySingleNotifier extends StateNotifier<MoneyResponseState> {
  MoneySingleNotifier(super.state);

  ///
  Future<void> setMoney({required Money money}) async => state = state.copyWith(singleMoney: money);
}
