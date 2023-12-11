import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/account_type.dart';
import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../repository/bank_name_repository.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';

// ignore: must_be_immutable
class BankNamesInputAlert extends ConsumerWidget {
  BankNamesInputAlert({super.key});

  TextEditingController bankNumberEditingController = TextEditingController();
  TextEditingController bankNameEditingController = TextEditingController();
  TextEditingController branchNumberEditingController = TextEditingController();
  TextEditingController branchNameEditingController = TextEditingController();
  TextEditingController accountNumberEditingController = TextEditingController();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final bankNamesSettingState = ref.watch(bankNamesSettingProvider);

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
              const Text('BankNamesInputAlert'),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: bankNumberEditingController,
                            decoration: const InputDecoration(labelText: '銀行番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: bankNameEditingController,
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
                            controller: branchNumberEditingController,
                            decoration: const InputDecoration(labelText: '支店番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: branchNameEditingController,
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
                            value: bankNamesSettingState.accountType,
                            onChanged: (value) {
                              ref.read(bankNamesSettingProvider.notifier).setAccountType(accountType: value!);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: accountNumberEditingController,
                            decoration: const InputDecoration(labelText: '口座番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
  Future<void> _inputBankName() async {
    final accountType = _ref.watch(bankNamesSettingProvider.select((value) => value.accountType));

    final bankName = BankName(
      bankNumber: bankNumberEditingController.text,
      bankName: bankNameEditingController.text,
      branchNumber: branchNumberEditingController.text,
      branchName: branchNameEditingController.text,
      accountType: accountType.japanName,
      accountNumber: accountNumberEditingController.text,
      depositType: 'bank',
    );

    await BankNameRepository.insertBankNames(bankName: bankName).then((value) {
      Navigator.pop(_context);
    });
  }

  ///
  void setDummyData() {
    bankNumberEditingController.text = '0001';
    bankNameEditingController.text = 'みずほ銀行';
    branchNumberEditingController.text = '046';
    branchNameEditingController.text = '虎ノ門支店';
    _ref.read(bankNamesSettingProvider.notifier).setAccountType(accountType: AccountType.normal);
    accountNumberEditingController.text = '2961375';

    // ref.read(bankNamesSettingProvider.notifier).setBankNum(num: 5);
    //
    // bankNumberTecs[0].text = '0001';
    // bankNameTecs[0].text = 'みずほ銀行';
    // branchNumberTecs[0].text = '046';
    // branchNameTecs[0].text = '虎ノ門支店';
    // ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 0, accountType: AccountType.normal);
    // accountNumberTecs[0].text = '2961375';
    //
    // bankNumberTecs[1].text = '0009';
    // bankNameTecs[1].text = '三井住友銀行';
    // branchNumberTecs[1].text = '547';
    // branchNameTecs[1].text = '横浜駅前支店';
    // ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 1, accountType: AccountType.normal);
    // accountNumberTecs[1].text = '8981660';
    //
    // bankNumberTecs[2].text = '0009';
    // bankNameTecs[2].text = '三井住友銀行';
    // branchNumberTecs[2].text = '259';
    // branchNameTecs[2].text = '新宿西口支店';
    // ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 2, accountType: AccountType.normal);
    // accountNumberTecs[2].text = '2967733';
    //
    // bankNumberTecs[3].text = '0005';
    // bankNameTecs[3].text = '三菱UFJ銀行';
    // branchNumberTecs[3].text = '271';
    // branchNameTecs[3].text = '船橋支店';
    // ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 3, accountType: AccountType.normal);
    // accountNumberTecs[3].text = '0782619';
    //
    // bankNumberTecs[4].text = '0036';
    // bankNameTecs[4].text = '楽天銀行';
    // branchNumberTecs[4].text = '226';
    // branchNameTecs[4].text = 'ギター支店';
    // ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: 4, accountType: AccountType.normal);
    // accountNumberTecs[4].text = '2994905';
  }
}
