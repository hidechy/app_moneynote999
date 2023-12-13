import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/models/emoney_name.dart';

import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../models/bank_price.dart';
import '../../repository/bank_price_repository.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class BankPriceInputAlert extends ConsumerStatefulWidget {
  BankPriceInputAlert({super.key, required this.date, this.bankName, this.emoneyName, this.bankPriceList});

  final DateTime date;

  BankName? bankName;
  EmoneyName? emoneyName;

  List<BankPrice>? bankPriceList;

  @override
  ConsumerState<BankPriceInputAlert> createState() => _BankPriceInputAlertState();
}

class _BankPriceInputAlertState extends ConsumerState<BankPriceInputAlert> {
  TextEditingController _bankPriceEditingController = TextEditingController();

  late BuildContext _context;

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
                  if (widget.bankName != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.bankName!.bankName} ${widget.bankName!.branchName}'),
                        Text('${widget.bankName!.accountType} ${widget.bankName!.accountNumber}'),
                      ],
                    ),
                  if (widget.emoneyName != null) Text(widget.emoneyName!.emoneyName),
                  Text(widget.date.yyyymmdd),
                ],
              ),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),

              ///

              IconButton(
                onPressed: _setDummyData,
                icon: const Icon(Icons.ac_unit),
              ),

              ///

              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _bankPriceEditingController,
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
    if (_bankPriceEditingController.text == '') {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    final bankPrice = BankPrice(
      date: widget.date.yyyymmdd,
      depositType: (widget.bankName != null) ? widget.bankName!.depositType : widget.emoneyName!.depositType,
      bankId: (widget.bankName != null) ? widget.bankName!.id! : widget.emoneyName!.id!,
      price: _bankPriceEditingController.text.toInt(),
    );

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice).then((value) {
      Navigator.pop(context);
    });
  }

  ///
  Future<void> _setDummyData() async {
    final bankPrice1 = BankPrice(date: widget.date.yyyymmdd, depositType: 'bank', bankId: 1, price: 10000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice1);

    final bankPrice2 = BankPrice(date: widget.date.yyyymmdd, depositType: 'bank', bankId: 2, price: 20000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice2);

    final bankPrice3 = BankPrice(date: widget.date.yyyymmdd, depositType: 'bank', bankId: 3, price: 30000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice3);

    final bankPrice4 = BankPrice(date: widget.date.yyyymmdd, depositType: 'bank', bankId: 4, price: 40000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice4);

    final bankPrice5 = BankPrice(date: widget.date.yyyymmdd, depositType: 'bank', bankId: 5, price: 50000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice5);

    //////////////////////////////////

    final bankPrice6 = BankPrice(date: widget.date.yyyymmdd, depositType: 'emoney', bankId: 1, price: 10000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice6);

    final bankPrice7 = BankPrice(date: widget.date.yyyymmdd, depositType: 'emoney', bankId: 2, price: 20000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice7);

    final bankPrice8 = BankPrice(date: widget.date.yyyymmdd, depositType: 'emoney', bankId: 3, price: 30000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice8);

    final bankPrice9 = BankPrice(date: widget.date.yyyymmdd, depositType: 'emoney', bankId: 4, price: 40000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice9);

    final bankPrice10 = BankPrice(date: widget.date.yyyymmdd, depositType: 'emoney', bankId: 5, price: 50000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice10);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
