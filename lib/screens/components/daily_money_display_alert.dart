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

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    Future(() => MoneyRepository.getSingleMoney(date: date.yyyymmdd, ref: ref));

    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  IconButton(
                    onPressed: () {
                      MoneyDialog(
                        context: context,
                        widget: MoneyInputAlert(date: date, money: singleMoney),
                      );
                    },
                    icon: Icon(Icons.input, color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
              const Text('DailyMoneyDisplayAlert'),
              Text(date.yyyymmdd),
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

    if (singleMoney == null) {
      return Container();
    }

    return Column(
      children: [
        _displayMoneyParts(key: '10000', value: singleMoney.yen_10000),
        _displayMoneyParts(key: '5000', value: singleMoney.yen_5000),
        _displayMoneyParts(key: '2000', value: singleMoney.yen_2000),
        _displayMoneyParts(key: '1000', value: singleMoney.yen_1000),
        _displayMoneyParts(key: '500', value: singleMoney.yen_500),
        _displayMoneyParts(key: '100', value: singleMoney.yen_100),
        _displayMoneyParts(key: '50', value: singleMoney.yen_50),
        _displayMoneyParts(key: '10', value: singleMoney.yen_10),
        _displayMoneyParts(key: '5', value: singleMoney.yen_5),
        _displayMoneyParts(key: '1', value: singleMoney.yen_1),
      ],
    );
  }

  ///
  Widget _displayMoneyParts({required String key, required int value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(key), Text(value.toString().toCurrency())],
    );
  }
}
