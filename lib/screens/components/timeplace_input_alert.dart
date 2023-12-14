import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/extensions.dart';

class TimeplaceInputAlert extends StatelessWidget {
  const TimeplaceInputAlert({super.key, required this.date, required this.spend});

  final DateTime date;
  final int spend;

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
          style: GoogleFonts.kiwiMaru(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: context.screenSize.width),

              const Text('TimeplaceListAlert'),
              Text(spend.toString()),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(),
              //     TextButton(
              //       onPressed: () =>
              //           MoneyDialog(context: context, widget: BankNameInputAlert(depositType: DepositType.bank)),
              //       child: const Text('金融機関を追加する'),
              //     ),
              //   ],
              // ),
              // Expanded(child: _displayBankList()),
            ],
          ),
        ),
      ),
    );
  }
}
