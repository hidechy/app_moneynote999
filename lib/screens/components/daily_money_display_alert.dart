import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../models/bank_price.dart';
import '../../models/emoney_name.dart';
import '../../repository/bank_name_repository.dart';
import '../../repository/bank_price_repository.dart';
import '../../repository/emoney_name_repository.dart';
import '../../repository/money_repository.dart';
import '../../state/bank_names/bank_names_notifier.dart';
import '../../state/bank_price/bank_price_notifier.dart';
import '../../state/emoney_names/emoney_names_notifier.dart';
import '../../state/money/money_notifier.dart';
import '../../utilities/utilities.dart';
import '_money_dialog.dart';
import 'bank_price_input_alert.dart';
import 'money_input_alert.dart';
import 'parts/bank_emoney_blank_message.dart';

// ignore: must_be_immutable
class DailyMoneyDisplayAlert extends ConsumerWidget {
  DailyMoneyDisplayAlert({super.key, required this.date});

  final DateTime date;

  int _currencySum = 0;

  int _totalMoney = 0;

  final Utility _utility = Utility();

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

    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

    _currencySum = _utility.makeCurrencySum(money: singleMoney);

    _totalMoney = _utility.makeTotalMoney(currencySum: _currencySum, ref: ref, date: date);

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
                Container(
                  width: _context.screenSize.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Column(
                        children: [
                          Text(_totalMoney.toString().toCurrency()),
                        ],
                      ),
                    ],
                  ),
                ),
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
  Widget _displayBankMoney() {
    final bankNameList = _ref.watch(bankNamesProvider.select((value) => value.bankNameList));

    final bankPriceState = _ref.watch(bankPriceProvider);

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
              return BankEmoneyBlankMessage(deposit: '金融機関');
            }

            final list = <Widget>[];

            value.forEach((element) {
              final bankPrice = getBankPrice(bankName: element);

              final bankPriceList = bankPriceListMap?['${element.depositType}-${element.id}'];

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
                                    bankPriceList: bankPriceList,
                                    bankPrice: bankPrice,
                                  ),
                                );
                              },
                              child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                            ),
                          ],
                        ),
                        if (bankPriceList != null)
                          Text(
                            bankPriceList.last.date,
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
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
              return BankEmoneyBlankMessage(deposit: '電子マネー', index: 1);
            }

            final list = <Widget>[];

            value.forEach((element) {
              final bankPrice = getBankPrice(emoneyName: element);

              final bankPriceList = bankPriceListMap?['${element.depositType}-${element.id}'];

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
                                    bankPriceList: bankPriceList,
                                    bankPrice: bankPrice,
                                  ),
                                );
                              },
                              child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                            ),
                          ],
                        ),
                        if (bankPriceList != null)
                          Text(
                            bankPriceList.last.date,
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
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
  int getBankPrice({BankName? bankName, EmoneyName? emoneyName}) {
    var bankPrice = 0;

    final bankPriceState = _ref.watch(bankPriceProvider);

    final bankPriceDatePadMap = (bankPriceState.bankPriceDatePadMap.value != null)
        ? bankPriceState.bankPriceDatePadMap.value
        : <String, Map<String, int>>{};

    if (bankName != null) {
      if (bankPriceDatePadMap?['${bankName.depositType}-${bankName.id}'] != null) {
        if (bankPriceDatePadMap?['${bankName.depositType}-${bankName.id}']?[date.yyyymmdd] != null) {
          bankPrice = bankPriceDatePadMap!['${bankName.depositType}-${bankName.id}']![date.yyyymmdd]!;
        }
      }
    } else if (emoneyName != null) {
      if (bankPriceDatePadMap?['${emoneyName.depositType}-${emoneyName.id}'] != null) {
        if (bankPriceDatePadMap?['${emoneyName.depositType}-${emoneyName.id}']?[date.yyyymmdd] != null) {
          bankPrice = bankPriceDatePadMap!['${emoneyName.depositType}-${emoneyName.id}']![date.yyyymmdd]!;
        }
      }
    }

    return bankPrice;
  }
}
