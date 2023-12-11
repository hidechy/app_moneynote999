import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/screens/components/parts/error_dialog.dart';

import '../../enums/account_type.dart';
import '../../enums/diposit_type.dart';
import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../repository/bank_name_repository.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';

// ignore: must_be_immutable
class BankNameInputAlert extends ConsumerWidget {
  BankNameInputAlert({super.key, required this.dipositType});

  final DipositType dipositType;

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
              const Text('銀行口座追加'),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),

              ///

              IconButton(
                onPressed: _setDummyBank,
                icon: const Icon(Icons.ac_unit),
              ),

              ///

              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: _inputBankName,
                    child: const Text(
                      '銀行口座を追加する',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _inputBankName() async {
    final accountType = _ref.watch(bankNamesSettingProvider.select((value) => value.accountType));

    if (bankNumberEditingController.text == '' ||
        bankNameEditingController.text == '' ||
        branchNumberEditingController.text == '' ||
        branchNameEditingController.text == '' ||
        accountNumberEditingController.text == '' ||
        (accountType == AccountType.blank)) {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '不完全データあり', content: '入力値に不備があります。'),
      );

      return;
    }

    final bankName = BankName(
      bankNumber: bankNumberEditingController.text,
      bankName: bankNameEditingController.text,
      branchNumber: branchNumberEditingController.text,
      branchName: branchNameEditingController.text,
      accountType: accountType.japanName,
      accountNumber: accountNumberEditingController.text,
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName).then((value) {
      Navigator.pop(_context);
    });
  }

  ///
  Future<void> _setDummyBank() async {
    final bankName1 = BankName(
      bankNumber: '0001',
      bankName: 'みずほ銀行',
      branchNumber: '046',
      branchName: '虎ノ門支店',
      accountType: '普通預金',
      accountNumber: '2961375',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName1);

    final bankName2 = BankName(
      bankNumber: '0009',
      bankName: '三井住友銀行',
      branchNumber: '547',
      branchName: '横浜駅前支店',
      accountType: '普通預金',
      accountNumber: '8981660',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName2);

    final bankName3 = BankName(
      bankNumber: '0009',
      bankName: '三井住友銀行',
      branchNumber: '259',
      branchName: '新宿西口支店',
      accountType: '普通預金',
      accountNumber: '2967733',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName3);

    final bankName4 = BankName(
      bankNumber: '0005',
      bankName: '三菱UFJ銀行',
      branchNumber: '271',
      branchName: '船橋支店',
      accountType: '普通預金',
      accountNumber: '0782619',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName4);

    final bankName5 = BankName(
      bankNumber: '0036',
      bankName: '楽天銀行',
      branchNumber: '226',
      branchName: 'ギター支店',
      accountType: '普通預金',
      accountNumber: '2994905',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName5);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
