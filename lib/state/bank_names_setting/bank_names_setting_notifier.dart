import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/enums/account_type.dart';

import '../../models/bank_name.dart';
import 'bank_names_setting_response_state.dart';

final bankNamesSettingProvider =
    StateNotifierProvider.autoDispose<BankNamesSettingNotifier, BankNamesSettingResponseState>((ref) {
  return BankNamesSettingNotifier(const BankNamesSettingResponseState());
});

class BankNamesSettingNotifier extends StateNotifier<BankNamesSettingResponseState> {
  BankNamesSettingNotifier(super.state);

  ///
  Future<void> setAccountType({required AccountType accountType}) async =>
      state = state.copyWith(accountType: accountType);

  ///
  Future<void> setBankNameList({required List<BankName> bankNameList}) async =>
      state = state.copyWith(bankNameList: AsyncValue.data(bankNameList));

  ///
  Future<void> updateBankNameList({required BankName bankName}) async {
    final bankNameList = state.bankNameList.value!;

    final index = bankNameList.indexWhere((bn) => bn.id == bankName.id);

    if (index != -1) {
      bankNameList[index] = bankName;
    }

    state = state.copyWith(bankNameList: AsyncValue.data(bankNameList));
  }

  ///
  Future<void> deleteBankNameList({required BankName bankName}) async {
    final bankNameList = state.bankNameList.value!;

    final index = bankNameList.indexWhere((bn) => bn.id == bankName.id);

    bankNameList.removeAt(index);

    state = state.copyWith(bankNameList: AsyncValue.data(bankNameList));
  }
}
