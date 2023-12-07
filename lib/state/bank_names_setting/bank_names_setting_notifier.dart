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
  Future<void> setBankNameList({required List<BankName> bankNameList}) async =>
      state = state.copyWith(bankNameList: AsyncValue.data(bankNameList));

  ///
  Future<void> setBankNum({required int num}) async {
    final accounts = <AccountType>[];
    final checks = <bool>[];

    for (var i = 0; i < num; i++) {
      accounts.add(AccountType.blank);
      checks.add(false);
    }

    state = state.copyWith(addBankNum: num, accountTypes: accounts, checkBoxes: checks);
  }

  //
  Future<void> setAccountType({required int pos, required AccountType accountType}) async {
    final list = [...state.accountTypes];
    list[pos] = accountType;
    state = state.copyWith(accountTypes: list);
  }

  //
  Future<void> setCheckBoxType({required int pos, required bool value}) async {
    final list = [...state.checkBoxes];
    list[pos] = value;
    state = state.copyWith(checkBoxes: list);
  }
}
