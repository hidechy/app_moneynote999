import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/enums/account_type.dart';
import 'package:money_note/enums/deposit_type.dart';
import 'package:money_note/state/bank_names/bank_names_notifier.dart';

import '../../extensions/extensions.dart';

// ignore: must_be_immutable
class BankSettingAlert extends ConsumerWidget {
  BankSettingAlert({super.key});

  TextEditingController bankNumController = TextEditingController();

  List<TextEditingController> bankNumberTecs = [];
  List<TextEditingController> bankNameTecs = [];

  List<TextEditingController> branchNumberTecs = [];
  List<TextEditingController> branchNameTecs = [];

  List<TextEditingController> accountNumberTecs = [];

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    bankNumController.text = ref.watch(bankNamesProvider.select((value) => value.addBankNum)).toString();

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
                      ref.read(bankNamesProvider.notifier).setBankNum(num: bankNumController.text.toInt());

                      primaryFocus?.unfocus();
                    },
                    child: const Text('click'),
                  ),
                ],
              ),
              Expanded(child: _displayBankSettings()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayBankSettings() {
    final addBankNum = _ref.watch(bankNamesProvider.select((value) => value.addBankNum));

    final list = <Widget>[];

    for (var i = 0; i < addBankNum; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      dropdownColor: Colors.pinkAccent.withOpacity(0.1),
                      iconEnabledColor: Colors.white,
                      items: DepositType.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.japanName, style: const TextStyle(fontSize: 12)),
                        );
                      }).toList(),
                      value: DepositType.blank,
                      onChanged: (value) async {
//                      return await _ref.watch(latLngTempleProvider.notifier).setSelectedRadius(radius: value
//                      .toString().toInt());
                      },
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Checkbox(
                          value: true,
                          onChanged: (value) {},
                          checkColor: Colors.white.withOpacity(0.6),
                          activeColor: Colors.black.withOpacity(0.6),
                        ),
                      )),
                ],
              ),
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

  ///
  void makeTecs() {
    final addBankNum = _ref.watch(bankNamesProvider.select((value) => value.addBankNum));

    for (var i = 0; i < addBankNum; i++) {
      bankNumberTecs.add(TextEditingController(text: ''));
      bankNameTecs.add(TextEditingController(text: ''));
      branchNumberTecs.add(TextEditingController(text: ''));
      branchNameTecs.add(TextEditingController(text: ''));
      accountNumberTecs.add(TextEditingController(text: ''));
    }
  }
}
