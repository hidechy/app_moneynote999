import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/extensions.dart';

class SpendInputAlert extends StatelessWidget {
  const SpendInputAlert({super.key, required this.date, required this.spend});

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
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),

              Text(date.yyyymmdd),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Difference'),
                  Text(spend.toString()),
                ],
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),

              // Expanded(child: _displayBankList()),
            ],
          ),
        ),
      ),
    );
  }
}
