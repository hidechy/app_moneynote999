import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../repository/bank_name_repository.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';
import '_money_dialog.dart';
import 'bank_names_input_alert.dart';

// ignore: must_be_immutable
class BankNamesListAlert extends ConsumerWidget {
  BankNamesListAlert({super.key});

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              const Text('BankNamesListAlert'),
              ElevatedButton(
                onPressed: () {
                  MoneyDialog(context: context, widget: BankNamesInputAlert());
                },
                child: const Text('bank adding'),
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
              list.add(Text(element.bankName));
            });

            return SingleChildScrollView(child: Column(children: list));
          },
          error: (error, stackTrace) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
