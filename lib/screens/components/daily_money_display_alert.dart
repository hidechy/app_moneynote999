import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../repository/money_repository.dart';
import '../../state/money/money_notifier.dart';
import '_money_dialog.dart';
import 'money_input_alert.dart';

// ignore: must_be_immutable
class DailyMoneyDisplayAlert extends ConsumerWidget {
  DailyMoneyDisplayAlert({super.key, required this.date});

  final DateTime date;

  int currencySum = 0;

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => MoneyRepository.getSingleMoney(date: date.yyyymmdd, ref: ref));

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
              Text(date.yyyymmdd),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Expanded(child: _displaySingleMoney()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displaySingleMoney() {
    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

    makeCurrencySum();

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Text('CURRENCY'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      MoneyDialog(
                        context: _context,
                        widget: MoneyInputAlert(date: date, money: singleMoney),
                      );
                    },
                    child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      currencySum.toString().toCurrency(),
                      style: const TextStyle(color: Colors.yellowAccent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        _displayMoneyParts(key: '10000', value: (singleMoney != null) ? singleMoney.yen_10000 : 0),
        _displayMoneyParts(key: '5000', value: (singleMoney != null) ? singleMoney.yen_5000 : 0),
        _displayMoneyParts(key: '2000', value: (singleMoney != null) ? singleMoney.yen_2000 : 0),
        _displayMoneyParts(key: '1000', value: (singleMoney != null) ? singleMoney.yen_1000 : 0),
        _displayMoneyParts(key: '500', value: (singleMoney != null) ? singleMoney.yen_500 : 0),
        _displayMoneyParts(key: '100', value: (singleMoney != null) ? singleMoney.yen_100 : 0),
        _displayMoneyParts(key: '50', value: (singleMoney != null) ? singleMoney.yen_50 : 0),
        _displayMoneyParts(key: '10', value: (singleMoney != null) ? singleMoney.yen_10 : 0),
        _displayMoneyParts(key: '5', value: (singleMoney != null) ? singleMoney.yen_5 : 0),
        _displayMoneyParts(key: '1', value: (singleMoney != null) ? singleMoney.yen_1 : 0),
      ],
    );
  }

  ///
  Widget _displayMoneyParts({required String key, required int value}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(key), Text(value.toString().toCurrency())],
      ),
    );
  }

  ///
  void makeCurrencySum() {
    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

    final yen_10000 = (singleMoney != null) ? singleMoney.yen_10000 : 0;
    final yen_5000 = (singleMoney != null) ? singleMoney.yen_5000 : 0;
    final yen_2000 = (singleMoney != null) ? singleMoney.yen_2000 : 0;
    final yen_1000 = (singleMoney != null) ? singleMoney.yen_1000 : 0;
    final yen_500 = (singleMoney != null) ? singleMoney.yen_500 : 0;
    final yen_100 = (singleMoney != null) ? singleMoney.yen_100 : 0;
    final yen_50 = (singleMoney != null) ? singleMoney.yen_50 : 0;
    final yen_10 = (singleMoney != null) ? singleMoney.yen_10 : 0;
    final yen_5 = (singleMoney != null) ? singleMoney.yen_5 : 0;
    final yen_1 = (singleMoney != null) ? singleMoney.yen_1 : 0;

    currencySum = (yen_10000 * 10000) +
        (yen_5000 * 5000) +
        (yen_2000 * 2000) +
        (yen_1000 * 1000) +
        (yen_500 * 500) +
        (yen_100 * 100) +
        (yen_50 * 50) +
        (yen_10 * 10) +
        (yen_5 * 5) +
        (yen_1 + 1);
  }
}
