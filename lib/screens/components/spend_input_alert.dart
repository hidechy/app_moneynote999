import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/spend_type.dart';
import '../../extensions/extensions.dart';
import '../../models/spend.dart';
import '../../repository/spend_repository.dart';
import '../../state/spend/spend_notifier.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class SpendInputAlert extends ConsumerWidget {
  SpendInputAlert({super.key, required this.date, required this.spend});

  final DateTime date;
  final int spend;

  final List<TextEditingController> _priceTecs = [];

  List<String> _spendItem = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => ref.read(spendProvider.notifier).setBaseDiff(baseDiff: spend.toString()));

    final spendState = ref.watch(spendProvider);

    _makeTecs();

    _makeSpendItem();

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
              Text(date.yyyymmdd),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Difference'),
                      const SizedBox(width: 10),
                      Text(
                        (spendState.diff != 0)
                            ? spendState.diff.toString().toCurrency()
                            : (spendState.baseDiff == '')
                                ? ''
                                : spendState.baseDiff.toCurrency(),
                        style: TextStyle(
                          color: (spendState.diff == 0) ? Colors.yellowAccent : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: _inputSpend,
                    child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                  ),
                ],
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Expanded(child: _displayInputParts()),
              Divider(thickness: 2, color: Colors.white.withOpacity(0.4)),
              SizedBox(
                height: context.screenSize.height * 0.23,
                child: _spendItemSetPanel(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  void _makeTecs() {
    final spendState = _ref.watch(spendProvider);

    for (var i = 0; i < 10; i++) {
      _priceTecs
          .add(TextEditingController(text: (spendState.spendPrice[i] == 0) ? '' : spendState.spendPrice[i].toString()));
    }
  }

  ///
  Widget _displayInputParts() {
    final list = <Widget>[
      const DefaultTextStyle(
        style: TextStyle(fontSize: 10, color: Colors.grey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('矢印を選択して入力'),
            Text('マイナス値入力の際は ー を押下'),
          ],
        ),
      )
    ];

    final spendState = _ref.watch(spendProvider);

    for (var i = 0; i < 10; i++) {
      list.add(
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: (spendState.itemPos == i) ? Colors.greenAccent.withOpacity(0.1) : Colors.transparent),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => _ref.read(spendProvider.notifier).setItemPos(pos: i),
                          child: Icon(
                            Icons.arrow_forward,
                            color: (i == spendState.itemPos) ? Colors.greenAccent : Colors.grey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _ref.read(spendProvider.notifier).clearOneLineItem(pos: i);
                          },
                          child: Icon(Icons.close, color: Colors.yellowAccent.withOpacity(0.6), size: 14),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        width: _context.screenSize.width * 0.45,
                        child: TextField(
                          style: const TextStyle(fontSize: 12),
                          readOnly: true,
                          controller: TextEditingController(text: spendState.spendItem[i]),
                          decoration: const InputDecoration(
                            hintText: '項目名',
                            filled: true,
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _ref.read(spendProvider.notifier).setMinusCheck(pos: i),
              child: Icon(
                Icons.remove,
                color: (spendState.minusCheck[i]) ? Colors.redAccent : Colors.white,
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: _context.screenSize.width * 0.25,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _priceTecs[i],
                decoration: const InputDecoration(
                  hintText: '金額',
                  filled: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                ),
                style: const TextStyle(fontSize: 12),
                onChanged: (value) => _ref.read(spendProvider.notifier).setSpendPrice(
                      pos: i,
                      price: value.toInt(),
                    ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      );
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Widget _spendItemSetPanel() {
    final spendState = _ref.watch(spendProvider);

    return SingleChildScrollView(
      child: Wrap(
        children: _spendItem.map((e) {
          return GestureDetector(
            onTap: () => _ref.read(spendProvider.notifier).setSpendItem(pos: spendState.itemPos, item: e),
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: (e == spendState.spendItem[spendState.itemPos])
                    ? Colors.yellowAccent.withOpacity(0.2)
                    : Colors.blueGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(e, style: const TextStyle(fontSize: 10)),
            ),
          );
        }).toList(),
      ),
    );
  }

  ///
  void _makeSpendItem() {
    _spendItem = [];
    SpendType.values.forEach((element) => _spendItem.add(element.japanName!));
  }

  ///
  Future<void> _inputSpend() async {
    final spendState = _ref.watch(spendProvider);

    final spendItem = spendState.spendItem;
    final spendPrice = spendState.spendPrice;
    final minusCheck = spendState.minusCheck;

    final list = <Map<String, dynamic>>[];

    var errFlg = false;

    for (var i = 0; i < 10; i++) {
      if (spendItem[i] != '' && spendPrice[i] != 0) {
        final price = (minusCheck[i]) ? spendPrice[i] * -1 : spendPrice[i];

        list.add({'item': spendItem[i], 'price': price});
      }
    }

    if (list.isEmpty) {
      errFlg = true;
    }

    final diff = spendState.diff;

    if (diff != 0 || errFlg) {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    await SpendRepository.deleteSpend(date: date.yyyymmdd, ref: _ref);

    list.forEach((element) async {
      final spend = Spend(date: date.yyyymmdd, spendType: element['item'], price: element['price'].toString());

      await SpendRepository.insertSpend(spend: spend);
    });

    await _ref.read(spendProvider.notifier).clearInputValue();

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
