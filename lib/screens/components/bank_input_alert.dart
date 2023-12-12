import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../repository/bank_name_repository.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';

class BankInputAlert extends ConsumerStatefulWidget {
  const BankInputAlert({super.key});

  @override
  ConsumerState<BankInputAlert> createState() => _BankInputAlertState();
}

class _BankInputAlertState extends ConsumerState<BankInputAlert> {
  Map<String, dynamic> tecs = {};

  ///
  @override
  Widget build(BuildContext context) {
    Future(() => BankNameRepository.getBankNames(ref: ref));

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
              const Text('銀行口座追加'),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),
              Expanded(child: _displayBankPriceInputParts()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> makeTecs() async {
    final bankNameList = ref.watch(bankNamesSettingProvider.select((value) => value.bankNameList));

    if (bankNameList.value != null) {
      bankNameList.value!.forEach((element) {
        tecs['${element.bankName}|${element.branchName}|${element.accountNumber}'] = TextEditingController();
      });
    }
  }

  ///
  Widget _displayBankPriceInputParts() {
    return ref.watch(bankNamesSettingProvider.select((value) => value.bankNameList)).when(
          data: (value) {
            final list = <Widget>[];

            value.forEach((element) {
              list.add(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${element.bankName} ${element.branchName} ${element.accountNumber}'),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: tecs['${element.bankName}|${element.branchName}|${element.accountNumber}'],
                      decoration: const InputDecoration(labelText: '金額'),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    const SizedBox(height: 30),
                  ],
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
