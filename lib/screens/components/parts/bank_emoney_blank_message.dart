import 'package:flutter/material.dart';

import '../_money_dialog.dart';
import '../deposit_list_alert.dart';

// ignore: must_be_immutable
class BankEmoneyBlankMessage extends StatelessWidget {
  BankEmoneyBlankMessage({super.key, required this.deposit, this.index});

  final String deposit;
  int? index;

  ///
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$depositが設定されていません。'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('必要であれば登録してください。'),
              GestureDetector(
                child: Text('登録', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary)),
                onTap: () {
                  MoneyDialog(
                    context: context,
                    widget: (index != null) ? DepositListAlert(index: 1) : DepositListAlert(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
