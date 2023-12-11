import 'package:flutter/material.dart';
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




//
//
//
//
//
//   Future<void> setup() async {
//     var tecs = makeTecs(num: 3);
//
//     state = state.copyWith(
//       bankNumController: TextEditingController(text: '3'),
//       bankNumberTecs: tecs['bankNumberTecs'],
//       bankNameTecs: tecs['bankNameTecs'],
//       branchNumberTecs: tecs['branchNumberTecs'],
//       branchNameTecs: tecs['branchNameTecs'],
//       accountNumberTecs: tecs['accountNumberTecs'],
//       accountTypes: tecs['accountType'],
//     );
//   }
//
//   // ///
//   // Future<void> setBankNameList({required List<BankName> bankNameList}) async {
//   //   state = state.copyWith(bankNameList: AsyncValue.data(bankNameList));
//   // }
//   //
//   //
//   //
//
//   ///
//   Map<String, dynamic> makeTecs({required int num}) {
//     List<TextEditingController> bankNumberTecs = [];
//     List<TextEditingController> bankNameTecs = [];
//     List<TextEditingController> branchNumberTecs = [];
//     List<TextEditingController> branchNameTecs = [];
//     List<TextEditingController> accountNumberTecs = [];
//
//     List<AccountType> accountTypes = [];
//
//     for (var i = 0; i < num; i++) {
//       // bankNumberTecs[i] = TextEditingController(text: '');
//       // bankNameTecs[i] = TextEditingController(text: '');
//       // branchNumberTecs[i] = TextEditingController(text: '');
//       // branchNameTecs[i] = TextEditingController(text: '');
//       // accountNumberTecs[i] = TextEditingController(text: '');
//       //
//       // accountTypes[i] = AccountType.blank;
//       //
//       //
//       //
//
//       bankNumberTecs.add(TextEditingController(text: ''));
//       bankNameTecs.add(TextEditingController(text: ''));
//       branchNumberTecs.add(TextEditingController(text: ''));
//       branchNameTecs.add(TextEditingController(text: ''));
//       accountNumberTecs.add(TextEditingController(text: ''));
//
//       accountTypes.add(AccountType.blank);
//     }
//
//     return {
//       'bankNumberTecs': bankNumberTecs,
//       'bankNameTecs': bankNameTecs,
//       'branchNumberTecs': branchNumberTecs,
//       'branchNameTecs': branchNameTecs,
//       'accountNumberTecs': accountNumberTecs,
//       'accountType': accountTypes,
//     };
//   }
//
//   ///
//   void changeBankNum({required String value}) {
//     TextEditingController textEditingController = TextEditingController();
//     textEditingController.text = value;
//
//     print(textEditingController);
//
//     state = state.copyWith(bankNumController: textEditingController);
//   }
//
// // ///
// // Future<void> setBankNum({required int num}) async {
// //   final accounts = <AccountType>[];
// //   final checks = <bool>[];
// //
// //   for (var i = 0; i < num; i++) {
// //     accounts.add(AccountType.blank);
// //     checks.add(false);
// //   }
// //
// //   state = state.copyWith(addBankNum: num, accountTypes: accounts, checkBoxes: checks);
// // }
// //
// // //
// // Future<void> setAccountType({required int pos, required AccountType accountType}) async {
// //   final list = [...state.accountTypes];
// //   list[pos] = accountType;
// //   state = state.copyWith(accountTypes: list);
// // }
// //
// // //
// // Future<void> setCheckBoxType({required int pos, required bool value}) async {
// //   final list = [...state.checkBoxes];
// //   list[pos] = value;
// //   state = state.copyWith(checkBoxes: list);
// // }
// //
// //
// //
// //
}
