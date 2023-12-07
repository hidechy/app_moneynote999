import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/extensions/extensions.dart';

import '../../enums/account_type.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';

class BankNamesSettingAlert extends ConsumerStatefulWidget {
  const BankNamesSettingAlert({super.key});

  @override
  ConsumerState<BankNamesSettingAlert> createState() => _BankNamesSettingAlertState();
}

class _BankNamesSettingAlertState extends ConsumerState<BankNamesSettingAlert> {
  TextEditingController bankNumController = TextEditingController();

  List<TextEditingController> bankNumberTecs = [];
  List<TextEditingController> bankNameTecs = [];

  List<TextEditingController> branchNumberTecs = [];
  List<TextEditingController> branchNameTecs = [];

  List<TextEditingController> accountNumberTecs = [];

  ///
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(bankNamesSettingProvider.notifier).setBankNum(num: 3),
    );
  }

  ///
  @override
  Widget build(BuildContext context) {
    bankNumController.text = ref.watch(bankNamesSettingProvider.select((value) => value.addBankNum)).toString();

    makeTecs();

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              const Text('BankSettingAlert'),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bankNumController,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(bankNamesSettingProvider.notifier).setBankNum(num: bankNumController.text.toInt());

                      primaryFocus?.unfocus();
                    },
                    child: const Text('click'),
                  ),
                ],
              ),
              Expanded(child: _displayBankNameSettings()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  void makeTecs() {
    final addBankNum = ref.watch(bankNamesSettingProvider.select((value) => value.addBankNum));

    for (var i = 0; i < addBankNum; i++) {
      bankNumberTecs.add(TextEditingController(text: ''));
      bankNameTecs.add(TextEditingController(text: ''));
      branchNumberTecs.add(TextEditingController(text: ''));
      branchNameTecs.add(TextEditingController(text: ''));
      accountNumberTecs.add(TextEditingController(text: ''));
    }
  }

  ///
  Widget _displayBankNameSettings() {
    final bankNamesSettingState = ref.watch(bankNamesSettingProvider);

    final list = <Widget>[];

    for (var i = 0; i < bankNamesSettingState.addBankNum; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
          child: Column(
            children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButton(
//                       dropdownColor: Colors.pinkAccent.withOpacity(0.1),
//                       iconEnabledColor: Colors.white,
//                       items: DepositType.values.map((e) {
//                         return DropdownMenuItem(
//                           value: e,
//                           child: Text(e.japanName, style: const TextStyle(fontSize: 12)),
//                         );
//                       }).toList(),
//                       value: bankNamesSettingState.depositTypes[i],
//                       //                      value: DepositType.blank,
//                       onChanged: (value) async {
// //                      return await _ref.watch(latLngTempleProvider.notifier).setSelectedRadius(radius: value
// //                      .toString().toInt());
//
//                         ref
//                             .read(bankNamesSettingProvider.notifier)
//                             .setDepositType(pos: i, depositType: value as DepositType);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                       flex: 2,
//                       child: Container(
//                         alignment: Alignment.topRight,
//                         child: Checkbox(
//                           value: true,
//                           onChanged: (value) {},
//                           checkColor: Colors.white.withOpacity(0.6),
//                           activeColor: Colors.black.withOpacity(0.6),
//                         ),
//                       )),
//                 ],
//               ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bankNumberTecs[i],
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(labelText: '銀行番号'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bankNameTecs[i],
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(labelText: '銀行名'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: branchNumberTecs[i],
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(labelText: '支店番号'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: branchNameTecs[i],
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(labelText: '支店名'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
                      iconEnabledColor: Colors.white,
                      items: AccountType.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.japanName, style: const TextStyle(fontSize: 12)),
                        );
                      }).toList(),
                      value: AccountType.blank,
                      onChanged: (value) async {
//                      return await _ref.watch(latLngTempleProvider.notifier).setSelectedRadius(radius: value
//                      .toString().toInt());
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: accountNumberTecs[i],
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(labelText: '口座番号'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(child: Column(children: list));
  }
}
