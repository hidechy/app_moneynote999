import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../models/bank_price.dart';
import '../../repository/bank_price_repository.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class BankPriceInputAlert extends ConsumerStatefulWidget {
  BankPriceInputAlert({super.key, required this.date, required this.bankName, this.bankPriceList});

  final DateTime date;
  final BankName bankName;

  List<BankPrice>? bankPriceList;

  @override
  ConsumerState<BankPriceInputAlert> createState() => _BankPriceInputAlertState();
}

class _BankPriceInputAlertState extends ConsumerState<BankPriceInputAlert> {
  TextEditingController bankPriceEditingController = TextEditingController();

  late BuildContext _context;

  ///
  @override
  void initState() {
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.bankName.bankName} ${widget.bankName.branchName}'),
                      Text('${widget.bankName.accountType} ${widget.bankName.accountNumber}'),
                    ],
                  ),
                  Text(widget.date.yyyymmdd),
                ],
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: bankPriceEditingController,
                  decoration: const InputDecoration(labelText: '金額'),
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: _insertBankMoney,
                    child: const Text('金額を入力する'),
                  ),
                ],
              ),
              Expanded(child: _displayBankPriceList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayBankPriceList() {
    final list = <Widget>[];

    if (widget.bankPriceList != null) {
      widget.bankPriceList!.forEach((element) {
        list.add(Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.date),
              Text(element.price.toString().toCurrency()),
            ],
          ),
        ));
      });
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Future<void> _insertBankMoney() async {
    if (bankPriceEditingController.text == '') {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '不完全データあり', content: '入力値に不備があります。'),
      );

      return;
    }

    final bankPrice = BankPrice(
      date: widget.date.yyyymmdd,
      depositType: widget.bankName.depositType,
      bankId: widget.bankName.id!,
      price: bankPriceEditingController.text.toInt(),
    );

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice).then((value) {
      Navigator.pop(context);
    });
  }
}
