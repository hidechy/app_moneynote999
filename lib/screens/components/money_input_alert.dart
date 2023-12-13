import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/money.dart';
import '../../repository/money_repository.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class MoneyInputAlert extends ConsumerStatefulWidget {
  MoneyInputAlert({super.key, required this.date, this.money});

  final DateTime date;
  Money? money;

  @override
  ConsumerState<MoneyInputAlert> createState() => _MoneyInputAlertState();
}

class _MoneyInputAlertState extends ConsumerState<MoneyInputAlert> {
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

  late BuildContext _context;

  ///
  @override
  void initState() {
    super.initState();

    if (widget.money != null) {
      tecYen10000.text = widget.money!.yen_10000.toString();
      tecYen5000.text = widget.money!.yen_5000.toString();
      tecYen2000.text = widget.money!.yen_2000.toString();
      tecYen1000.text = widget.money!.yen_1000.toString();
      tecYen500.text = widget.money!.yen_500.toString();
      tecYen100.text = widget.money!.yen_100.toString();
      tecYen50.text = widget.money!.yen_50.toString();
      tecYen10.text = widget.money!.yen_10.toString();
      tecYen5.text = widget.money!.yen_5.toString();
      tecYen1.text = widget.money!.yen_1.toString();
    }
  }

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
              Text(widget.date.yyyymmdd),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),
              SizedBox(
                height: context.screenSize.height * 0.45,
                child: displayMoneyInput(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///

//                  Container(),

                  GestureDetector(
                    onTap: () {
                      tecYen10000.text = '9';
                      tecYen5000.text = '9';
                      tecYen2000.text = '9';
                      tecYen1000.text = '9';
                      tecYen500.text = '9';
                      tecYen100.text = '9';
                      tecYen50.text = '9';
                      tecYen10.text = '9';
                      tecYen5.text = '9';
                      tecYen1.text = '9';
                    },
                    child: const Icon(Icons.ac_unit),
                  ),

                  ///

                  (widget.money != null)
                      ? TextButton(
                          onPressed: _updateMoney,
                          child: const Text('マネーデータを更新する', style: TextStyle(fontSize: 12)),
                        )
                      : TextButton(
                          onPressed: _insertMoney,
                          child: const Text('マネーデータを追加する', style: TextStyle(fontSize: 12)),
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
        style: const TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }

  ///
  void _insertMoney() {
    if (tecYen10000.text == '' ||
        tecYen5000.text == '' ||
        tecYen2000.text == '' ||
        tecYen1000.text == '' ||
        tecYen500.text == '' ||
        tecYen100.text == '' ||
        tecYen50.text == '' ||
        tecYen10.text == '' ||
        tecYen5.text == '' ||
        tecYen1.text == '') {
      Future.delayed(
        Duration.zero,
            () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    final money = Money(
      date: widget.date.yyyymmdd,
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

    MoneyRepository.insertMoney(money: money).then((value) {
      tecYen10000.clear();
      tecYen5000.clear();
      tecYen2000.clear();
      tecYen1000.clear();
      tecYen500.clear();
      tecYen100.clear();
      tecYen50.clear();
      tecYen10.clear();
      tecYen5.clear();
      tecYen1.clear();

      Navigator.pop(context);
    });
  }

  ///
  void _updateMoney() {
    final updateMoney = Money(
      id: widget.money!.id,
      date: widget.date.yyyymmdd,
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

    MoneyRepository.updateMoney(money: updateMoney, ref: ref).then((value) {
      tecYen10000.clear();
      tecYen5000.clear();
      tecYen2000.clear();
      tecYen1000.clear();
      tecYen500.clear();
      tecYen100.clear();
      tecYen50.clear();
      tecYen10.clear();
      tecYen5.clear();
      tecYen1.clear();

      Navigator.pop(context);
    });
  }
}
