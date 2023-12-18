import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
              Expanded(child: _displayIncomeList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayIncomeList() {
    final incomeList = ref.watch(incomeProvider.select((value) => value.incomeList));

    return incomeList.when(
      data: (value) {
        final list = <Widget>[];

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

    await IncomeRepository().insert(param: income).then((value) {
      _incomeSourceEditingController.clear();
      _incomePriceEditingController.clear();

      Navigator.pop(context);
    });
  }
}
