import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/bank_price.dart';
import '../../repository/bank_name_repository.dart';
import '../../repository/bank_price_repository.dart';
import '../../repository/emoney_name_repository.dart';
import '../../repository/money_repository.dart';
import '../../state/bank_names/bank_names_notifier.dart';
import '../../state/bank_price/bank_price_notifier.dart';
import '../../state/emoney_names/emoney_names_notifier.dart';
import '../../state/money/money_notifier.dart';
import '_money_dialog.dart';
import 'bank_price_input_alert.dart';
import 'deposit_list_alert.dart';
import 'money_input_alert.dart';

// ignore: must_be_immutable
class DailyMoneyDisplayAlert extends ConsumerWidget {
  DailyMoneyDisplayAlert({super.key, required this.date});

  final DateTime date;

  int _currencySum = 0;

  int _totalMoney = 0;

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  Future<void> init({required WidgetRef ref}) async {
    await MoneyRepository.getSingleMoney(date: date.yyyymmdd, ref: ref);
    await BankNameRepository.getBankNamesList(ref: ref);
    await EmoneyNameRepository.getEmoneyNamesList(ref: ref);
    await BankPriceRepository.getBankPriceList(ref: ref);
  }

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => init(ref: ref));

    _makeCurrencySum();

    _makeTotalMoney();

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(width: context.screenSize.width),
                Text(date.yyyymmdd),
                Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
                _displaySingleMoney(),
                _displayBankMoney(),
                _displayEmoneyMoney(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget _displaySingleMoney() {
    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

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
                      _currencySum.toString().toCurrency(),
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
  Future<void> _makeCurrencySum() async {
    final singleMoney = await _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

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

    _currencySum = (yen_10000 * 10000) +
        (yen_5000 * 5000) +
        (yen_2000 * 2000) +
        (yen_1000 * 1000) +
        (yen_500 * 500) +
        (yen_100 * 100) +
        (yen_50 * 50) +
        (yen_10 * 10) +
        (yen_5 * 5) +
        (yen_1 * 1);
  }

  ///
  Future<void> _makeTotalMoney() async {
    final bankPriceState = _ref.watch(bankPriceProvider);
    final bankPriceLastMap =
        (bankPriceState.bankPriceLastMap.value != null) ? bankPriceState.bankPriceLastMap.value : <String, BankPrice>{};
  }

  ///
  Widget _displayBankMoney() {
    final bankNameList = _ref.watch(bankNamesProvider.select((value) => value.bankNameList));

    final bankPriceState = _ref.watch(bankPriceProvider);
    final bankPriceLastMap =
        (bankPriceState.bankPriceLastMap.value != null) ? bankPriceState.bankPriceLastMap.value : <String, BankPrice>{};

    final bankPriceListMap = (bankPriceState.bankPriceListMap.value != null)
        ? bankPriceState.bankPriceListMap.value
        : <String, List<BankPrice>>{};

    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Text('BANK'),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        bankNameList.when(
          data: (value) {
            if (value.isEmpty) {
              return DefaultTextStyle(
                style: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('金融機関が設定されていません。'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('必要であれば登録してください。'),
                        GestureDetector(
                          child:
                              Text('登録', style: TextStyle(fontSize: 12, color: Theme.of(_context).colorScheme.primary)),
                          onTap: () {
                            MoneyDialog(
                              context: _context,
                              widget: DepositListAlert(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            final list = <Widget>[];

            value.forEach((element) {
              var bankPrice = (bankPriceLastMap?['${element.depositType}-${element.id}'] != null)
                  ? bankPriceLastMap!['${element.depositType}-${element.id}']!.price
                  : 0;

              var bankPriceLastDate =
                  (bankPrice != 0) ? bankPriceLastMap!['${element.depositType}-${element.id}']!.date : '';

              //---------------------//前日開き
              if (bankPrice != 0) {
                final bankPriceLastDt = DateTime.parse('$bankPriceLastDate 00:00:00');

                final diff = date.difference(bankPriceLastDt).inDays;

                if (diff < 0) {
                  bankPrice = 0;
                  bankPriceLastDate = '';
                }
              }
              //---------------------//前日開き

              list.add(Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${element.bankName} ${element.branchName}'),
                        Text('${element.accountType} ${element.accountNumber}'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(bankPrice.toString().toCurrency()),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                MoneyDialog(
                                  context: _context,
                                  widget: BankPriceInputAlert(
                                    date: date,
                                    bankName: element,
                                    bankPriceList: bankPriceListMap?['${element.depositType}-${element.id}'],
                                  ),
                                );
                              },
                              child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                            ),
                          ],
                        ),
                        if (bankPriceLastDate != '') Text(bankPriceLastDate, style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ));
            });

            return SingleChildScrollView(child: Column(children: list));
          },
          error: (error, stackTrace) => Container(),
          loading: Container.new,
        ),
      ],
    );
  }

  ///
  Widget _displayEmoneyMoney() {
    final emoneyNameList = _ref.watch(emoneyNamesProvider.select((value) => value.emoneyNameList));

    final bankPriceState = _ref.watch(bankPriceProvider);
    final bankPriceLastMap =
        (bankPriceState.bankPriceLastMap.value != null) ? bankPriceState.bankPriceLastMap.value : <String, BankPrice>{};

    final bankPriceListMap = (bankPriceState.bankPriceListMap.value != null)
        ? bankPriceState.bankPriceListMap.value
        : <String, List<BankPrice>>{};

    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Text('E-MONEY'),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        emoneyNameList.when(
          data: (value) {
            if (value.isEmpty) {
              return DefaultTextStyle(
                style: TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('電子マネーが設定されていません。'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('必要であれば登録してください。'),
                        GestureDetector(
                          child:
                              Text('登録', style: TextStyle(fontSize: 12, color: Theme.of(_context).colorScheme.primary)),
                          onTap: () {
                            MoneyDialog(
                              context: _context,
                              widget: DepositListAlert(index: 1),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            final list = <Widget>[];

            value.forEach((element) {
              var bankPrice = (bankPriceLastMap?['${element.depositType}-${element.id}'] != null)
                  ? bankPriceLastMap!['${element.depositType}-${element.id}']!.price
                  : 0;

              var bankPriceLastDate =
                  (bankPrice != 0) ? bankPriceLastMap!['${element.depositType}-${element.id}']!.date : '';

              //---------------------//前日開き
              if (bankPrice != 0) {
                final bankPriceLastDt = DateTime.parse('$bankPriceLastDate 00:00:00');

                final diff = date.difference(bankPriceLastDt).inDays;

                if (diff < 0) {
                  bankPrice = 0;
                  bankPriceLastDate = '';
                }
              }
              //---------------------//前日開き

              list.add(Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(element.emoneyName),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(bankPrice.toString().toCurrency()),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                MoneyDialog(
                                  context: _context,
                                  widget: BankPriceInputAlert(
                                    date: date,
                                    emoneyName: element,
                                    bankPriceList: bankPriceListMap?['${element.depositType}-${element.id}'],
                                  ),
                                );
                              },
                              child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                            ),
                          ],
                        ),
                        if (bankPriceLastDate != '') Text(bankPriceLastDate, style: const TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ));
            });

            return SingleChildScrollView(child: Column(children: list));
          },
          error: (error, stackTrace) => Container(),
          loading: Container.new,
        ),
      ],
    );
  }
}
