import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/income.dart';

import 'income_response_state.dart';

final incomeProvider = StateNotifierProvider.autoDispose<IncomeNotifier, IncomeResponseState>((ref) {
  return IncomeNotifier(const IncomeResponseState());
});

class IncomeNotifier extends StateNotifier<IncomeResponseState> {
  IncomeNotifier(super.state);

  ///
  Future<void> deleteIncomeList({required Income income}) async {
    final incomeList = state.incomeList.value!;
    final index = incomeList.indexWhere((ic) => ic.id == income.id);
    incomeList.removeAt(index);
    state = state.copyWith(incomeList: AsyncValue.data(incomeList));
  }

  ///
  Future<void> updateIncomeList({required Income income}) async {
    final incomeList = state.incomeList.value!;
    final index = incomeList.indexWhere((ic) => ic.id == income.id);
    if (index != -1) {
      incomeList[index] = income;
    }
    state = state.copyWith(incomeList: AsyncValue.data(incomeList));
  }

  ///
  Future<void> setIncomeList({required List<Income> incomeList}) async =>
      state = state.copyWith(incomeList: AsyncValue.data(incomeList));
}
