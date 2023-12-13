import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../models/bank_price.dart';
import '../../models/emoney_name.dart';
import '../../models/money.dart';
import '../../repository/bank_name_repository.dart';
import '../../repository/bank_price_repository.dart';
import '../../repository/emoney_name_repository.dart';
import '../../repository/money_repository.dart';

// ignore: must_be_immutable
class DummyDataInputAlert extends StatelessWidget {
  DummyDataInputAlert({super.key});

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
              ElevatedButton(
                onPressed: _setDummyBankNameData,
                child: const Text('Bank Name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _setDummyEmoneyNameData,
                child: const Text('Emoney Name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _setDummyBankPriceData,
                child: const Text('Bank Price'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _setDummyMoneyData,
                child: const Text('Money'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _setDummyBankNameData() async {
    final bankName1 = BankName(
      bankNumber: '0001',
      bankName: 'みずほ銀行',
      branchNumber: '046',
      branchName: '虎ノ門支店',
      accountType: '普通預金',
      accountNumber: '2961375',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName1);

    final bankName2 = BankName(
      bankNumber: '0009',
      bankName: '三井住友銀行',
      branchNumber: '547',
      branchName: '横浜駅前支店',
      accountType: '普通預金',
      accountNumber: '8981660',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName2);

    final bankName3 = BankName(
      bankNumber: '0009',
      bankName: '三井住友銀行',
      branchNumber: '259',
      branchName: '新宿西口支店',
      accountType: '普通預金',
      accountNumber: '2967733',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName3);

    final bankName4 = BankName(
      bankNumber: '0005',
      bankName: '三菱UFJ銀行',
      branchNumber: '271',
      branchName: '船橋支店',
      accountType: '普通預金',
      accountNumber: '0782619',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName4);

    final bankName5 = BankName(
      bankNumber: '0036',
      bankName: '楽天銀行',
      branchNumber: '226',
      branchName: 'ギター支店',
      accountType: '普通預金',
      accountNumber: '2994905',
      depositType: 'bank',
    );

    await BankNameRepository.insertBankName(bankName: bankName5);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }

  ///
  Future<void> _setDummyEmoneyNameData() async {
    final emoneyName1 = EmoneyName(emoneyName: 'Suica1', depositType: 'emoney');
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName1);

    final emoneyName2 = EmoneyName(emoneyName: 'PayPay', depositType: 'emoney');
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName2);

    final emoneyName3 = EmoneyName(emoneyName: 'PASMO', depositType: 'emoney');
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName3);

    final emoneyName4 = EmoneyName(emoneyName: 'Suica2', depositType: 'emoney');
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName4);

    final emoneyName5 = EmoneyName(emoneyName: 'メルカリ', depositType: 'emoney');
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName5);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }

  ///
  Future<void> _setDummyBankPriceData() async {
    final bankPrice1 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'bank',
        bankId: 1,
        price: 10000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice1);

    final bankPrice2 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'bank',
        bankId: 2,
        price: 20000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice2);

    final bankPrice3 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'bank',
        bankId: 3,
        price: 30000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice3);

    final bankPrice4 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'bank',
        bankId: 4,
        price: 40000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice4);

    final bankPrice5 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'bank',
        bankId: 5,
        price: 50000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice5);

    //////////////////////////////////

    final bankPrice6 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'emoney',
        bankId: 1,
        price: 10000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice6);

    final bankPrice7 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'emoney',
        bankId: 2,
        price: 20000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice7);

    final bankPrice8 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'emoney',
        bankId: 3,
        price: 30000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice8);

    final bankPrice9 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'emoney',
        bankId: 4,
        price: 40000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice9);

    final bankPrice10 = BankPrice(
        date: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3).yyyymmdd,
        depositType: 'emoney',
        bankId: 5,
        price: 50000);

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice10);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }

  ///
  Future<void> _setDummyMoneyData() async {
    ////////////////////

    final date1 = DateTime.now();

    final money1 = Money(
      date: date1.yyyymmdd,
      yen_10000: 7,
      yen_5000: 7,
      yen_2000: 7,
      yen_1000: 7,
      yen_500: 7,
      yen_100: 7,
      yen_50: 7,
      yen_10: 7,
      yen_5: 7,
      yen_1: 7,
    );

    await MoneyRepository.insertMoney(money: money1);

    ////////////////////

    final date2 = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);

    final money2 = Money(
      date: date2.yyyymmdd,
      yen_10000: 8,
      yen_5000: 8,
      yen_2000: 8,
      yen_1000: 8,
      yen_500: 8,
      yen_100: 8,
      yen_50: 8,
      yen_10: 8,
      yen_5: 8,
      yen_1: 8,
    );

    await MoneyRepository.insertMoney(money: money2);

    ////////////////////

    final date3 = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 2);

    final money3 = Money(
      date: date3.yyyymmdd,
      yen_10000: 9,
      yen_5000: 9,
      yen_2000: 9,
      yen_1000: 9,
      yen_500: 9,
      yen_100: 9,
      yen_50: 9,
      yen_10: 9,
      yen_5: 9,
      yen_1: 9,
    );

    await MoneyRepository.insertMoney(money: money3);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
