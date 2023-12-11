import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '_money_dialog.dart';
import 'bank_names_input_alert.dart';

class BankNamesListAlert extends StatelessWidget {
  const BankNamesListAlert({super.key});

  ///
  @override
  Widget build(BuildContext context) {
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
                child: Text('bank adding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
