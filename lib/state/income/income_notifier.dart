import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'income_response_state.dart';

final incomeProvider = StateNotifierProvider.autoDispose<IncomeNotifier, IncomeResponseState>((ref) {
  return IncomeNotifier(const IncomeResponseState());
});

class IncomeNotifier extends StateNotifier<IncomeResponseState> {
  IncomeNotifier(super.state);
}
