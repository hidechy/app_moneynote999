import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/bank_name.dart';
import 'bank_names_response_state.dart';

final bankNamesProvider = StateNotifierProvider.autoDispose<BankNamesNotifier, BankNamesResponseState>((ref) {
  return BankNamesNotifier(const BankNamesResponseState());
});

class BankNamesNotifier extends StateNotifier<BankNamesResponseState> {
  BankNamesNotifier(super.state);

  ///
  Future<void> setBankNameList({required List<BankName> bankNameList}) async =>
      state = state.copyWith(bankNameList: AsyncValue.data(bankNameList));

  ///
  Future<void> setBankNum({required int num}) async {
    final deposits = <String>[];
    final accounts = <String>[];
    final checks = <bool>[];

    for (var i = 0; i < num; i++) {
      deposits.add('');
      accounts.add('');
      checks.add(false);
    }

    state = state.copyWith(addBankNum: num, depositTypes: deposits, accountTypes: accounts, checkBoxes: checks);
  }

  //
  Future<void> setDepositType({required int pos, required String value}) async {
    final list = [...state.depositTypes];
    list[pos] = value;
    state = state.copyWith(depositTypes: list);
  }

  //
  Future<void> setAccountType({required int pos, required String value}) async {
    final list = [...state.accountTypes];
    list[pos] = value;
    state = state.copyWith(accountTypes: list);
  }

  //
  Future<void> setCheckBoxType({required int pos, required bool value}) async {
    final list = [...state.checkBoxes];
    list[pos] = value;
    state = state.copyWith(checkBoxes: list);
  }
}
