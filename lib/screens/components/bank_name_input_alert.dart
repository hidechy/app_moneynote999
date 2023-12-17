import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/account_type.dart';
import '../../enums/deposit_type.dart';
import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../repository/bank_name_repository.dart';
import '../../state/bank_names/bank_names_notifier.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class BankNameInputAlert extends ConsumerStatefulWidget {
  BankNameInputAlert({super.key, required this.depositType, this.bankName});

  final DepositType depositType;
  BankName? bankName;

  @override
  ConsumerState<BankNameInputAlert> createState() => _BankNameInputAlertState();
}

class _BankNameInputAlertState extends ConsumerState<BankNameInputAlert> {
  final TextEditingController _bankNumberEditingController = TextEditingController();
  final TextEditingController _bankNameEditingController = TextEditingController();
  final TextEditingController _branchNumberEditingController = TextEditingController();
  final TextEditingController _branchNameEditingController = TextEditingController();
  final TextEditingController _accountNumberEditingController = TextEditingController();

  AccountType _selectedAccountType = AccountType.blank;

  late BuildContext _context;

  ///
  @override
  void initState() {
    super.initState();

    if (widget.bankName != null) {
      _bankNumberEditingController.text = widget.bankName!.bankNumber;
      _bankNameEditingController.text = widget.bankName!.bankName;
      _branchNumberEditingController.text = widget.bankName!.branchNumber;
      _branchNameEditingController.text = widget.bankName!.branchName;
      _accountNumberEditingController.text = widget.bankName!.accountNumber;

      switch (widget.bankName!.accountType) {
        case '普通預金':
          _selectedAccountType = AccountType.normal;
          break;
        case '定期口座':
          _selectedAccountType = AccountType.fixed;
          break;
      }
    }
  }

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    final bankNamesSettingState = ref.watch(bankNamesProvider);

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
          style: GoogleFonts.kiwiMaru(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              const Text('金融機関追加'),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _bankNumberEditingController,
                            decoration: const InputDecoration(labelText: '金融機関番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _bankNameEditingController,
                            decoration: const InputDecoration(labelText: '金融機関名'),
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
                            controller: _branchNumberEditingController,
                            decoration: const InputDecoration(labelText: '支店番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _branchNameEditingController,
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
                            value: (_selectedAccountType != AccountType.blank)
                                ? _selectedAccountType
                                : bankNamesSettingState.accountType,
                            onChanged: (value) {
                              ref.read(bankNamesProvider.notifier).setAccountType(accountType: value!);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _accountNumberEditingController,
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
                  (widget.bankName != null)
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: _updateBankName,
                              child: Text(
                                '金融機関を更新する',
                                style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: _deleteBankName,
                              child: Text('金融機関を削除する',
                                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary)),
                            ),
                          ],
                        )
                      : TextButton(
                          onPressed: _inputBankName,
                          child: const Text('金融機関を追加する', style: TextStyle(fontSize: 12)),
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
    final accountType = ref.watch(bankNamesProvider.select((value) => value.accountType));

    if (_bankNumberEditingController.text == '' ||
        _bankNameEditingController.text == '' ||
        _branchNumberEditingController.text == '' ||
        _branchNameEditingController.text == '' ||
        _accountNumberEditingController.text == '' ||
        (accountType == AccountType.blank)) {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    final bankName = BankName(
      bankNumber: _bankNumberEditingController.text,
      bankName: _bankNameEditingController.text,
      branchNumber: _branchNumberEditingController.text,
      branchName: _branchNameEditingController.text,
      accountType: accountType.japanName,
      accountNumber: _accountNumberEditingController.text,
      depositType: widget.depositType.japanName,
    );

    await BankNameRepository.insertBankName(bankName: bankName).then((value) {
      _bankNumberEditingController.clear();
      _bankNameEditingController.clear();
      _branchNumberEditingController.clear();
      _branchNameEditingController.clear();
      _accountNumberEditingController.clear();

      Navigator.pop(_context);
    });
  }

  ///
  Future<void> _updateBankName() async {
    final accountType = ref.watch(bankNamesProvider.select((value) => value.accountType));

    await BankNameRepository.updateBankName(
      bankName: BankName(
        id: widget.bankName!.id,
        bankNumber: _bankNumberEditingController.text,
        bankName: _bankNameEditingController.text,
        branchNumber: _branchNumberEditingController.text,
        branchName: _branchNameEditingController.text,
        accountType: accountType.japanName,
        accountNumber: _accountNumberEditingController.text,
        depositType: widget.depositType.japanName,
      ),
      ref: ref,
    ).then((value) {
      _bankNumberEditingController.clear();
      _bankNameEditingController.clear();
      _branchNumberEditingController.clear();
      _branchNameEditingController.clear();
      _accountNumberEditingController.clear();

      Navigator.pop(_context);
    });
  }

  ///
  Future<void> _deleteBankName() async {
    await BankNameRepository.deleteBankName(bankName: widget.bankName!, ref: ref)
        .then((value) => Navigator.pop(_context));
  }
}
