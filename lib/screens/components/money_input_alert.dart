import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/money.dart';
import '../../repository/money_repository.dart';

// ignore: must_be_immutable
class MoneyInputAlert extends ConsumerWidget {
  MoneyInputAlert({super.key, required this.date, this.money});

  final DateTime date;
  Money? money;

  TextEditingController tecYen10000 = TextEditingController();
  TextEditingController tecYen5000 = TextEditingController();
  TextEditingController tecYen2000 = TextEditingController();
  TextEditingController tecYen1000 = TextEditingController();
  TextEditingController tecYen500 = TextEditingController();
  TextEditingController tecYen100 = TextEditingController();
  TextEditingController tecYen50 = TextEditingController();
  TextEditingController tecYen10 = TextEditingController();
  TextEditingController tecYen5 = TextEditingController();
  TextEditingController tecYen1 = TextEditingController();

  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    if (money != null) {
      tecYen10000.text = money!.yen_10000.toString();
      tecYen5000.text = money!.yen_5000.toString();
      tecYen2000.text = money!.yen_2000.toString();
      tecYen1000.text = money!.yen_1000.toString();
      tecYen500.text = money!.yen_500.toString();
      tecYen100.text = money!.yen_100.toString();
      tecYen50.text = money!.yen_50.toString();
      tecYen10.text = money!.yen_10.toString();
      tecYen5.text = money!.yen_5.toString();
      tecYen1.text = money!.yen_1.toString();
    }

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
              SizedBox(
                height: context.screenSize.height * 0.45,
                child: displayMoneyInput(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  ElevatedButton(
                    onPressed: () {
                      (money != null) ? _updateMoney() : _insertMoney();

                      MoneyRepository.getSingleMoney(date: date.yyyymmdd, ref: ref);

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('input'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget displayMoneyInput() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: displayInputParts(name: '10000', tec: tecYen10000)),
              Expanded(child: displayInputParts(name: '100', tec: tecYen100)),
            ],
          ),
          Row(
            children: [
              Expanded(child: displayInputParts(name: '5000', tec: tecYen5000)),
              Expanded(child: displayInputParts(name: '50', tec: tecYen50)),
            ],
          ),
          Row(
            children: [
              Expanded(child: displayInputParts(name: '2000', tec: tecYen2000)),
              Expanded(child: displayInputParts(name: '10', tec: tecYen10)),
            ],
          ),
          Row(
            children: [
              Expanded(child: displayInputParts(name: '1000', tec: tecYen1000)),
              Expanded(child: displayInputParts(name: '5', tec: tecYen5)),
            ],
          ),
          Row(
            children: [
              Expanded(child: displayInputParts(name: '500', tec: tecYen500)),
              Expanded(child: displayInputParts(name: '1', tec: tecYen1)),
            ],
          ),
        ],
      ),
    );
  }

  ///
  Widget displayInputParts({required String name, required TextEditingController tec}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: tec,
        textAlign: TextAlign.end,
        decoration: InputDecoration(labelText: name),
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        onChanged: (value) {
//          setMoneyInputStateKind(kind: kind, value: value);
        },
      ),
    );
  }

  ///
  void _insertMoney() {
    final money = Money(
      date: date.yyyymmdd,
      yen_10000: (tecYen10000.text == '') ? 0 : tecYen10000.text.toInt(),
      yen_5000: (tecYen5000.text == '') ? 0 : tecYen5000.text.toInt(),
      yen_2000: (tecYen2000.text == '') ? 0 : tecYen2000.text.toInt(),
      yen_1000: (tecYen1000.text == '') ? 0 : tecYen1000.text.toInt(),
      yen_500: (tecYen500.text == '') ? 0 : tecYen500.text.toInt(),
      yen_100: (tecYen100.text == '') ? 0 : tecYen100.text.toInt(),
      yen_50: (tecYen50.text == '') ? 0 : tecYen50.text.toInt(),
      yen_10: (tecYen10.text == '') ? 0 : tecYen10.text.toInt(),
      yen_5: (tecYen5.text == '') ? 0 : tecYen5.text.toInt(),
      yen_1: (tecYen1.text == '') ? 0 : tecYen1.text.toInt(),
    );

    MoneyRepository.insertMoney(money: money);
  }

  ///
  void _updateMoney() {
    final updateMoney = Money(
      id: money!.id,
      date: date.yyyymmdd,
      yen_10000: (tecYen10000.text == '') ? 0 : tecYen10000.text.toInt(),
      yen_5000: (tecYen5000.text == '') ? 0 : tecYen5000.text.toInt(),
      yen_2000: (tecYen2000.text == '') ? 0 : tecYen2000.text.toInt(),
      yen_1000: (tecYen1000.text == '') ? 0 : tecYen1000.text.toInt(),
      yen_500: (tecYen500.text == '') ? 0 : tecYen500.text.toInt(),
      yen_100: (tecYen100.text == '') ? 0 : tecYen100.text.toInt(),
      yen_50: (tecYen50.text == '') ? 0 : tecYen50.text.toInt(),
      yen_10: (tecYen10.text == '') ? 0 : tecYen10.text.toInt(),
      yen_5: (tecYen5.text == '') ? 0 : tecYen5.text.toInt(),
      yen_1: (tecYen1.text == '') ? 0 : tecYen1.text.toInt(),
    );

    MoneyRepository.updateMoney(money: updateMoney, ref: _ref);
  }
}
