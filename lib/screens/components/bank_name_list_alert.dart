import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/deposit_type.dart';
import '../../extensions/extensions.dart';
import '../../repository/bank_name_repository.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';
import '_money_dialog.dart';
import 'bank_name_input_alert.dart';

// ignore: must_be_immutable
class BankNameListAlert extends ConsumerWidget {
  BankNameListAlert({super.key});

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => BankNameRepository.getBankNames(ref: ref));

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
              Container(width: context.screenSize.width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: () =>
                        MoneyDialog(context: context, widget: BankNameInputAlert(depositType: DepositType.bank)),
                    child: const Text('銀行口座を追加する', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              Expanded(child: _displayBankList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayBankList() {
    return _ref.watch(bankNamesSettingProvider.select((value) => value.bankNameList)).when(
          data: (value) {
            final list = <Widget>[];

            value.forEach((element) {
              list.add(
                Container(
                  width: _context.screenSize.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${element.depositType}-${element.id}: ${element.bankName} (${element.bankNumber}) '),
                            Text('${element.branchName} (${element.branchNumber})'),
                            Text('${element.accountType} ${element.accountNumber}'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              MoneyDialog(
                                context: _context,
                                widget: BankNameInputAlert(depositType: DepositType.bank, bankName: element),
                              );
                            },
                            child: Icon(Icons.edit, size: 16, color: Colors.white.withOpacity(0.4)),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.delete, size: 16, color: Colors.white.withOpacity(0.4)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });

            return SingleChildScrollView(child: Column(children: list));
          },
          error: (error, stackTrace) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
