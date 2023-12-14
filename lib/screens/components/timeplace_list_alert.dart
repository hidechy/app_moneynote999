import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/extensions.dart';

class TimeplaceListAlert extends StatelessWidget {
  const TimeplaceListAlert({super.key});

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
