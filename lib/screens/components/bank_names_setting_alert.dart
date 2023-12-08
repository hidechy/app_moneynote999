import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/repository/bank_name_repository.dart';

import '../../enums/account_type.dart';
import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';

class BankNamesSettingAlert extends ConsumerStatefulWidget {
  const BankNamesSettingAlert({super.key, this.bankNameList});

  final List<BankName>? bankNameList;

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
      (_) => ref
          .read(bankNamesSettingProvider.notifier)
          .setBankNum(num: (widget.bankNameList != null) ? widget.bankNameList!.length : 3),
    );
  }

  ///
  @override
  Widget build(BuildContext context) {
    Future(() => BankNameRepository.getBankNames(ref: ref));

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
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _inputBankName,
                  child: const Text('input'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: setDummyData,
                  child: const Text('dummy'),
                ),
              ),
              const SizedBox(height: 20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      const Text('変更'),
                      Checkbox(
                        value:
                            // ignore: avoid_bool_literals_in_conditional_expressions
                            (bankNamesSettingState.checkBoxes.isNotEmpty) ? bankNamesSettingState.checkBoxes[i] : false,
                        onChanged: (value) {
                          ref.read(bankNamesSettingProvider.notifier).setCheckBoxType(pos: i, value: value!);
                        },
                        checkColor: Colors.white.withOpacity(0.6),
                        activeColor: Colors.black.withOpacity(0.6),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bankNumberTecs[i],
                      decoration: const InputDecoration(labelText: '銀行番号'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bankNameTecs[i],
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
                      decoration: const InputDecoration(labelText: '支店番号'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: branchNameTecs[i],
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
                      value: (bankNamesSettingState.accountTypes.isNotEmpty)
                          ? bankNamesSettingState.accountTypes[i]
                          : AccountType.blank,
                      onChanged: (value) async {
                        await ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: i, accountType: value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: accountNumberTecs[i],
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
  void _inputBankName() {
    final bankNamesSettingState = ref.watch(bankNamesSettingProvider);

    final list = <BankName>[];

    final passNumber = <int>[];

    for (var i = 0; i < bankNamesSettingState.addBankNum; i++) {
      if (bankNumberTecs[i].text == '' ||
          bankNameTecs[i].text == '' ||
          branchNumberTecs[i].text == '' ||
          branchNameTecs[i].text == '' ||
          accountNumberTecs[i].text == '' ||
          bankNamesSettingState.accountTypes[i] == AccountType.blank) {
        passNumber.add(i);

        continue;
      }

      list.add(BankName(
        bankNumber: bankNumberTecs[i].text,
        bankName: bankNameTecs[i].text,
        branchNumber: branchNumberTecs[i].text,
        branchName: branchNameTecs[i].text,
        accountType: bankNamesSettingState.accountTypes[i].japanName,
        accountNumber: accountNumberTecs[i].text,
        depositType: 'bank',
      ));
    }

    if (passNumber.isNotEmpty) {
      Future.delayed(
        Duration.zero,
        () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('不完全データあり'),
                content: Text('以下のデータが不完全ですが、登録しますか？\n$passNumber'),
                actions: [
                  GestureDetector(
                    child: const Text('はい'),
                    onTap: () async {
                      await BankNameRepository.insertBankNames(bankNameList: list);

                      if (mounted) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  GestureDetector(
                    child: const Text('いいえ'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    }
  }

  ///
  void setDummyData() {
    ref.read(bankNamesSettingProvider.notifier).setBankNum(num: 5);

    bankNumberTecs[0].text = '0001';
    bankNameTecs[0].text = 'みずほ銀行';
    branchNumberTecs[0].text = '046';
    branchNameTecs[0].text = '虎ノ門支店';
    ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 0, accountType: AccountType.normal);
    accountNumberTecs[0].text = '2961375';

    bankNumberTecs[1].text = '0009';
    bankNameTecs[1].text = '三井住友銀行';
    branchNumberTecs[1].text = '547';
    branchNameTecs[1].text = '横浜駅前支店';
    ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 1, accountType: AccountType.normal);
    accountNumberTecs[1].text = '8981660';

    bankNumberTecs[2].text = '0009';
    bankNameTecs[2].text = '三井住友銀行';
    branchNumberTecs[2].text = '259';
    branchNameTecs[2].text = '新宿西口支店';
    ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 2, accountType: AccountType.normal);
    accountNumberTecs[2].text = '2967733';

    bankNumberTecs[3].text = '0005';
    bankNameTecs[3].text = '三菱UFJ銀行';
    branchNumberTecs[3].text = '271';
    branchNameTecs[3].text = '船橋支店';
    ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 3, accountType: AccountType.normal);
    accountNumberTecs[3].text = '0782619';

    bankNumberTecs[4].text = '0036';
    bankNameTecs[4].text = '楽天銀行';
    branchNumberTecs[4].text = '226';
    branchNameTecs[4].text = 'ギター支店';
    ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 4, accountType: AccountType.normal);
//    accountNumberTecs[4].text = '2994905';
  }
}
