import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/state/bank_setting/bank_setting_notifier.dart';

import '../../extensions/extensions.dart';

// ignore: must_be_immutable
class BankSettingAlert extends ConsumerWidget {
  BankSettingAlert({super.key});

  TextEditingController bankNumController = TextEditingController();

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    bankNumController.text = ref.watch(bankSettingProvider.select((value) => value.addBankNum)).toString();

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
                      ref.read(bankSettingProvider.notifier).setBankNum(num: bankNumController.text.toInt());

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
    final addBankNum = _ref.watch(bankSettingProvider.select((value) => value.addBankNum));

    final list = <Widget>[];

    for (var i = 0; i < addBankNum; i++) {
      list.add(Text(i.toString()));
    }

    return SingleChildScrollView(child: Column(children: list));
  }
}
