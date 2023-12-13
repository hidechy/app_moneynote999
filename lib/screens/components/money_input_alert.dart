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
  final TextEditingController _tecYen10000 = TextEditingController();
  final TextEditingController _tecYen5000 = TextEditingController();
  final TextEditingController _tecYen2000 = TextEditingController();
  final TextEditingController _tecYen1000 = TextEditingController();
  final TextEditingController _tecYen500 = TextEditingController();
  final TextEditingController _tecYen100 = TextEditingController();
  final TextEditingController _tecYen50 = TextEditingController();
  final TextEditingController _tecYen10 = TextEditingController();
  final TextEditingController _tecYen5 = TextEditingController();
  final TextEditingController _tecYen1 = TextEditingController();

  late BuildContext _context;

  ///
  @override
  void initState() {
    super.initState();

    if (widget.money != null) {
      _tecYen10000.text = widget.money!.yen_10000.toString();
      _tecYen5000.text = widget.money!.yen_5000.toString();
      _tecYen2000.text = widget.money!.yen_2000.toString();
      _tecYen1000.text = widget.money!.yen_1000.toString();
      _tecYen500.text = widget.money!.yen_500.toString();
      _tecYen100.text = widget.money!.yen_100.toString();
      _tecYen50.text = widget.money!.yen_50.toString();
      _tecYen10.text = widget.money!.yen_10.toString();
      _tecYen5.text = widget.money!.yen_5.toString();
      _tecYen1.text = widget.money!.yen_1.toString();
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
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _displayInputParts(name: '10000', tec: _tecYen10000)),
                        Expanded(child: _displayInputParts(name: '100', tec: _tecYen100)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _displayInputParts(name: '5000', tec: _tecYen5000)),
                        Expanded(child: _displayInputParts(name: '50', tec: _tecYen50)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _displayInputParts(name: '2000', tec: _tecYen2000)),
                        Expanded(child: _displayInputParts(name: '10', tec: _tecYen10)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _displayInputParts(name: '1000', tec: _tecYen1000)),
                        Expanded(child: _displayInputParts(name: '5', tec: _tecYen5)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _displayInputParts(name: '500', tec: _tecYen500)),
                        Expanded(child: _displayInputParts(name: '1', tec: _tecYen1)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
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
  Widget _displayInputParts({required String name, required TextEditingController tec}) {
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
  Future<void> _insertMoney() async {
    if (_tecYen10000.text == '' ||
        _tecYen5000.text == '' ||
        _tecYen2000.text == '' ||
        _tecYen1000.text == '' ||
        _tecYen500.text == '' ||
        _tecYen100.text == '' ||
        _tecYen50.text == '' ||
        _tecYen10.text == '' ||
        _tecYen5.text == '' ||
        _tecYen1.text == '') {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    final money = Money(
      date: widget.date.yyyymmdd,
      yen_10000: (_tecYen10000.text == '') ? 0 : _tecYen10000.text.toInt(),
      yen_5000: (_tecYen5000.text == '') ? 0 : _tecYen5000.text.toInt(),
      yen_2000: (_tecYen2000.text == '') ? 0 : _tecYen2000.text.toInt(),
      yen_1000: (_tecYen1000.text == '') ? 0 : _tecYen1000.text.toInt(),
      yen_500: (_tecYen500.text == '') ? 0 : _tecYen500.text.toInt(),
      yen_100: (_tecYen100.text == '') ? 0 : _tecYen100.text.toInt(),
      yen_50: (_tecYen50.text == '') ? 0 : _tecYen50.text.toInt(),
      yen_10: (_tecYen10.text == '') ? 0 : _tecYen10.text.toInt(),
      yen_5: (_tecYen5.text == '') ? 0 : _tecYen5.text.toInt(),
      yen_1: (_tecYen1.text == '') ? 0 : _tecYen1.text.toInt(),
    );

    await MoneyRepository.insertMoney(money: money).then((value) {
      _tecYen10000.clear();
      _tecYen5000.clear();
      _tecYen2000.clear();
      _tecYen1000.clear();
      _tecYen500.clear();
      _tecYen100.clear();
      _tecYen50.clear();
      _tecYen10.clear();
      _tecYen5.clear();
      _tecYen1.clear();

      Navigator.pop(context);
    });
  }

  ///
  Future<void> _updateMoney() async {
    final updateMoney = Money(
      id: widget.money!.id,
      date: widget.date.yyyymmdd,
      yen_10000: (_tecYen10000.text == '') ? 0 : _tecYen10000.text.toInt(),
      yen_5000: (_tecYen5000.text == '') ? 0 : _tecYen5000.text.toInt(),
      yen_2000: (_tecYen2000.text == '') ? 0 : _tecYen2000.text.toInt(),
      yen_1000: (_tecYen1000.text == '') ? 0 : _tecYen1000.text.toInt(),
      yen_500: (_tecYen500.text == '') ? 0 : _tecYen500.text.toInt(),
      yen_100: (_tecYen100.text == '') ? 0 : _tecYen100.text.toInt(),
      yen_50: (_tecYen50.text == '') ? 0 : _tecYen50.text.toInt(),
      yen_10: (_tecYen10.text == '') ? 0 : _tecYen10.text.toInt(),
      yen_5: (_tecYen5.text == '') ? 0 : _tecYen5.text.toInt(),
      yen_1: (_tecYen1.text == '') ? 0 : _tecYen1.text.toInt(),
    );

    await MoneyRepository.updateMoney(money: updateMoney, ref: ref).then((value) {
      _tecYen10000.clear();
      _tecYen5000.clear();
      _tecYen2000.clear();
      _tecYen1000.clear();
      _tecYen500.clear();
      _tecYen100.clear();
      _tecYen50.clear();
      _tecYen10.clear();
      _tecYen5.clear();
      _tecYen1.clear();

      Navigator.pop(context);
    });
  }
}
