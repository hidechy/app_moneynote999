import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/state/app_params/app_params_notifier.dart';
import 'package:money_note/state/incomes/incomes_notifier.dart';

import '../../extensions/extensions.dart';
import '../../models/income.dart';
import '../../repository/income_repository.dart';
import 'parts/error_dialog.dart';

class IncomeListAlert extends ConsumerStatefulWidget {
  const IncomeListAlert({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<IncomeListAlert> createState() => _IncomeListAlertState();
}

class _IncomeListAlertState extends ConsumerState<IncomeListAlert> {
  final TextEditingController _incomePriceEditingController = TextEditingController();
  final TextEditingController _incomeSourceEditingController = TextEditingController();

  List<String> yearList = [];

  ///
  Future<void> init({required WidgetRef ref}) async {
    await IncomeRepository().getList(ref: ref);
  }

  ///
  @override
  Widget build(BuildContext context) {
    Future(() => init(ref: ref));

    _makeYearList();

    final sameMonthIncomeDeleteFlag = ref.watch(appParamProvider.select((value) => value.sameMonthIncomeDeleteFlag));

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
                  const Text('収入履歴登録'),
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
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(appParamProvider.notifier)
                                .setSameMonthIncomeDeleteFlag(flag: !sameMonthIncomeDeleteFlag);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: sameMonthIncomeDeleteFlag
                                  ? Colors.yellowAccent.withOpacity(0.2)
                                  : const Color(0xFFfffacd).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text('同月データを入れ替え'),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _incomePriceEditingController,
                      decoration: const InputDecoration(labelText: '金額'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _incomeSourceEditingController,
                      decoration: const InputDecoration(labelText: '支払い元'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: _insertIncome,
                    child: const Text('入力する'),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                child: _displayYearButton(),
              ),
              Expanded(child: _displayIncomeList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  void _makeYearList() {
    yearList = [];

    final incomeList = ref.watch(incomeProvider.select((value) => value.incomeList));

    final map = <String, String>{};

    incomeList.value?.forEach((element) {
      final exDate = element.date.split('-');

      map[exDate[0]] = '';
    });

    map.forEach((key, value) {
      yearList.add(key);
    });

    yearList.sort((a, b) => -1 * a.compareTo(b));
  }

  ///
  Widget _displayYearButton() {
    final selectedIncomeYear = ref.watch(appParamProvider.select((value) => value.selectedIncomeYear));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: yearList.map((e) {
          return GestureDetector(
            onTap: () {
              ref.read(appParamProvider.notifier).setSelectedIncomeYear(year: e);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: (selectedIncomeYear == e) ? Colors.yellowAccent.withOpacity(0.2) : Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(e),
            ),
          );
        }).toList(),
      ),
    );
  }

  ///
  Widget _displayIncomeList() {
    final incomeList = ref.watch(incomeProvider.select((value) => value.incomeList));

    return incomeList.when(
      data: (value) {
        final list = <Widget>[];

        var sum = 0;
        value.forEach((element) {
          sum += element.price;
        });

        if (sum > 0) {
          list.add(Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  sum.toString().toCurrency(),
                  style: const TextStyle(color: Colors.yellowAccent),
                ),
              ],
            ),
          ));
        }

        value.forEach((element) {
          list.add(Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(element.date),
                    Text(element.price.toString().toCurrency()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(element.sourceName),
                  ],
                ),
              ],
            ),
          ));
        });

        return SingleChildScrollView(child: Column(children: list));
      },
      error: (error, stackTrace) => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  ///
  Future<void> _insertIncome() async {
    if (_incomePriceEditingController.text == '' || _incomePriceEditingController.text == '') {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    final income = Income(
      date: widget.date.yyyymmdd,
      sourceName: _incomeSourceEditingController.text,
      price: _incomePriceEditingController.text.toInt(),
    );

    final sameMonthIncomeDeleteFlag = ref.watch(appParamProvider.select((value) => value.sameMonthIncomeDeleteFlag));

    if (sameMonthIncomeDeleteFlag) {
      await IncomeRepository().deleteByYearMonth(income: income, ref: ref);
    }

    await IncomeRepository().insert(param: income).then((value) async {
      _incomeSourceEditingController.clear();
      _incomePriceEditingController.clear();

      await IncomeRepository().getList(ref: ref);
    });
  }
}
