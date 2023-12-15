import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/get_single_money_from.dart';
import '../../enums/get_single_money_when.dart';
import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../models/bank_price.dart';
import '../../models/emoney_name.dart';
import '../../repository/bank_name_repository.dart';
import '../../repository/bank_price_repository.dart';
import '../../repository/emoney_name_repository.dart';
import '../../repository/money_repository.dart';
import '../../repository/spend_repository.dart';
import '../../state/app_param/app_param_notifier.dart';
import '../../state/bank_names/bank_names_notifier.dart';
import '../../state/bank_price/bank_price_notifier.dart';
import '../../state/emoney_names/emoney_names_notifier.dart';
import '../../state/money/money_notifier.dart';
import '../../state/spend/spend_notifier.dart';
import '../../utilities/utilities.dart';
import '_money_dialog.dart';
import 'bank_price_input_alert.dart';
import 'income_list_alert.dart';
import 'money_input_alert.dart';
import 'parts/bank_emoney_blank_message.dart';
import 'spend_input_alert.dart';
import 'timeplace_input_alert.dart';

// ignore: must_be_immutable
class DailyMoneyDisplayAlert extends ConsumerWidget {
  DailyMoneyDisplayAlert({super.key, required this.date});

  final DateTime date;

  int _currencySum = 0;

  int _totalMoney = 0;

  int _totalMoneyBeforeDate = 0;

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  Future<void> init({required WidgetRef ref}) async {
    await MoneyRepository.getSingleMoney(
      date: date.yyyymmdd,
      ref: ref,
      from: GetSingleMoneyFrom.dailyMoneyDisplayAlert,
      when: GetSingleMoneyWhen.today,
    );

    //-----
    final beforeDate = DateTime(date.year, date.month, date.day - 1);
    await Future(
      () => MoneyRepository.getSingleMoney(
        date: beforeDate.yyyymmdd,
        ref: ref,
        from: GetSingleMoneyFrom.dailyMoneyDisplayAlert,
        when: GetSingleMoneyWhen.yesterday,
      ),
    );
    //-----

    await BankNameRepository.getBankNamesList(ref: ref);
    await EmoneyNameRepository.getEmoneyNamesList(ref: ref);

    await BankPriceRepository.getBankPriceList(ref: ref);

    await SpendRepository.getSingleSpend(date: date.yyyymmdd, ref: ref);
  }

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => init(ref: ref));

    //================
    final singleMoney = ref.watch(moneySingleProvider.select((value) => value.singleMoney));
    _currencySum = _utility.makeCurrencySum(money: singleMoney);
    _totalMoney = _utility.makeTotalMoney(currencySum: _currencySum, ref: ref, date: date);
    //================

    //================
    final beforeDateMoneyForSum = ref.watch(moneySingleProvider.select((value) => value.beforeDateMoneyForSum));
    if (beforeDateMoneyForSum != null) {
      final beforeDate = DateTime(date.year, date.month, date.day - 1);
      final beforeDateSum = _utility.makeCurrencySum(money: beforeDateMoneyForSum);
      _totalMoneyBeforeDate = _utility.makeTotalMoney(currencySum: beforeDateSum, ref: ref, date: beforeDate);
    }
    //================

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
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Start'),
                            Text(_totalMoneyBeforeDate.toString().toCurrency()),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('End'),
                            Text(_totalMoney.toString().toCurrency()),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Difference'),
                            Row(
                              children: [
                                if ((_totalMoneyBeforeDate - _totalMoney) < 0) ...[
                                  Bubble(
                                    color: Colors.indigoAccent.withOpacity(0.6),
                                    nip: BubbleNip.rightTop,
                                    child: const Text('増えた！'),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                                Text((_totalMoneyBeforeDate - _totalMoney).toString().toCurrency()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _ref.read(appParamProvider.notifier).setMenuNumber(menuNumber: 0),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.close, color: Colors.yellowAccent.withOpacity(0.6), size: 16),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                          child: const Text(''),
                        ),
                        GestureDetector(
                          onTap: () => _ref.read(appParamProvider.notifier).setMenuNumber(menuNumber: 1),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                          ),
                        ),
                        if (_currencySum > 0) ...[
                          DecoratedBox(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                            child: const Text(''),
                          ),
                          GestureDetector(
                            onTap: () => _ref.read(appParamProvider.notifier).setMenuNumber(menuNumber: 2),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.info_outline_rounded,
                                  color: Colors.greenAccent.withOpacity(0.6), size: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _ref.read(appParamProvider.notifier).setMenuNumber(menuNumber: 3),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.access_time, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                            ),
                          ),
                        ],
                        DecoratedBox(
                          decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                          child: const Text(''),
                        ),
                        GestureDetector(
                          onTap: () => _ref.read(appParamProvider.notifier).setMenuNumber(menuNumber: 4),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.monetization_on, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                          ),
                        ),
                      ],
                    ),
                    _getMenuOpenStr(),
                  ],
                ),
                const SizedBox(height: 20),
                _displaySingleMoney(),
                const SizedBox(height: 20),
                _displayBankMoney(),
                const SizedBox(height: 20),
                _displayEmoneyMoney(),
                const SizedBox(height: 20),
                _displaySpend(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Widget _getMenuOpenStr() {
    final menuNumber = _ref.watch(appParamProvider.select((value) => value.menuNumber));

    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

    final spendList = _ref.watch(spendProvider.select((value) => value.spendList));

    switch (menuNumber) {
      case 1:
        return Row(
          children: [
            const Text('金種枚数登録'),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                MoneyDialog(
                  context: _context,
                  widget: MoneyInputAlert(date: date, money: singleMoney),
                );
              },
              child: Text('OPEN', style: TextStyle(color: Theme.of(_context).colorScheme.primary)),
            ),
          ],
        );

      case 2:
        return Row(
          children: [
            const Text('使用用途登録'),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () async {
                await _ref.read(spendProvider.notifier).clearInputValue();

                //===========================

                if (spendList.value != null) {
                  final spendItem = List<String>.generate(10, (index) => '');
                  final spendPrice = List<int>.generate(10, (index) => 0);
                  final minusCheck = List<bool>.generate(10, (index) => false);

                  for (var i = 0; i < spendList.value!.length; i++) {
                    spendItem[i] = spendList.value![i].spendType;
                    if (spendList.value![i].price.toInt() < 0) {
                      spendPrice[i] = spendList.value![i].price.toInt() * -1;
                      minusCheck[i] = true;
                    } else {
                      spendPrice[i] = spendList.value![i].price.toInt();
                      minusCheck[i] = false;
                    }
                  }

                  await _ref
                      .read(spendProvider.notifier)
                      .setUpdateValue(spendItem: spendItem, spendPrice: spendPrice, minusCheck: minusCheck);
                }

                //===========================

                await _ref
                    .read(spendProvider.notifier)
                    .setBaseDiff(baseDiff: (_totalMoneyBeforeDate - _totalMoney).toString());

                // ignore: use_build_context_synchronously
                await MoneyDialog(
                  context: _context,
                  widget: SpendInputAlert(date: date, spend: _totalMoneyBeforeDate - _totalMoney),
                );
              },
              child: Text('OPEN', style: TextStyle(color: Theme.of(_context).colorScheme.primary)),
            ),
          ],
        );

      case 3:
        return Row(
          children: [
            const Text('使用場所登録'),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                MoneyDialog(
                  context: _context,
                  widget: TimeplaceInputAlert(date: date, spend: _totalMoneyBeforeDate - _totalMoney),
                );
              },
              child: Text('OPEN', style: TextStyle(color: Theme.of(_context).colorScheme.primary)),
            ),
          ],
        );

      case 4:
        return Row(
          children: [
            const Text('収入履歴登録'),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                MoneyDialog(
                  context: _context,
                  widget: const IncomeListAlert(),
                );
              },
              child: Text('OPEN', style: TextStyle(color: Theme.of(_context).colorScheme.primary)),
            ),
          ],
        );
    }

    return Container();
  }

  ///
  Widget _displaySingleMoney() {
    final singleMoney = _ref.watch(moneySingleProvider.select((value) => value.singleMoney));

    final openCurrencyArea = _ref.watch(appParamProvider.select((value) => value.openCurrencyArea));

    return ExpansionTile(
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      initiallyExpanded: openCurrencyArea,
      iconColor: Colors.white,
      onExpansionChanged: (value) => _ref.read(appParamProvider.notifier).setOpenCurrencyArea(value: value),
      title: const Text(
        'CURRENCY',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      _currencySum.toString().toCurrency(),
                      style: const TextStyle(color: Colors.yellowAccent),
                    ),
                  ],
                ),
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
              const SizedBox(height: 10),
            ],
          ),
        ),
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

    final openBankArea = _ref.watch(appParamProvider.select((value) => value.openBankArea));

    return ExpansionTile(
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      initiallyExpanded: openBankArea,
      iconColor: Colors.white,
      onExpansionChanged: (value) => _ref.read(appParamProvider.notifier).setOpenBankArea(value: value),
      title: const Text(
        'BANK',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              bankNameList.when(
                data: (value) {
                  if (value.isEmpty) {
                    return BankEmoneyBlankMessage(deposit: '金融機関');
                  }

                  final list = <Widget>[];

                  value.forEach((element) {
                    final bankPrice = _getBankPrice(bankName: element);

                    final bankPriceList = bankPriceListMap?['${element.depositType}-${element.id}'];

                    list.add(Container(
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
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
          ),
        ),
        const SizedBox(height: 10),
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

    final openEmoneyArea = _ref.watch(appParamProvider.select((value) => value.openEmoneyArea));

    return ExpansionTile(
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      initiallyExpanded: openEmoneyArea,
      iconColor: Colors.white,
      onExpansionChanged: (value) => _ref.read(appParamProvider.notifier).setOpenEmoneyArea(value: value),
      title: const Text(
        'E-MONEY',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              emoneyNameList.when(
                data: (value) {
                  if (value.isEmpty) {
                    return BankEmoneyBlankMessage(deposit: '電子マネー', index: 1);
                  }

                  final list = <Widget>[];

                  value.forEach((element) {
                    final bankPrice = _getBankPrice(emoneyName: element);

                    final bankPriceList = bankPriceListMap?['${element.depositType}-${element.id}'];

                    list.add(Container(
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
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
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  ///
  Widget _displaySpend() {
    final spendList = _ref.watch(spendProvider.select((value) => value.spendList));

    final openSpendArea = _ref.watch(appParamProvider.select((value) => value.openSpendArea));

    // TODO エラー修正できない
    if (spendList.value?.length == 0) {
      return Container();
    }

    return ExpansionTile(
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      initiallyExpanded: openSpendArea,
      iconColor: Colors.white,
      onExpansionChanged: (value) => _ref.read(appParamProvider.notifier).setOpenSpendArea(value: value),
      title: const Text(
        'SPEND',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              spendList.when(
                data: (value) {
                  final list = <Widget>[];

                  value.forEach((element) {
                    list.add(Container(
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(element.spendType),
                          Text(element.price.toCurrency()),
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
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  ///
  int _getBankPrice({BankName? bankName, EmoneyName? emoneyName}) {
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
