import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/spend_type.dart';
import '../../extensions/extensions.dart';
import '../../state/spend_time_place/spend_time_place_notifier.dart';

class SpendTimePlaceInputAlert extends ConsumerStatefulWidget {
  const SpendTimePlaceInputAlert({super.key, required this.date, required this.spend});

  final DateTime date;
  final int spend;

  @override
  ConsumerState<SpendTimePlaceInputAlert> createState() => _SpendTimePlaceInputAlertState();
}

class _SpendTimePlaceInputAlertState extends ConsumerState<SpendTimePlaceInputAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  ///
  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(color: Colors.orangeAccent.withOpacity(0.1)),
    end: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.1)),
  );

  ///
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true);
  }

  ///
  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  List<String> _spendItem = [];

  final List<TextEditingController> _placeTecs = [];
  final List<TextEditingController> _priceTecs = [];

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    _makeTecs();

    _makeSpendItem();

    final spendTimePlaceState = ref.watch(spendTimePlaceProvider);

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
              Text(widget.date.yyyymmdd),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Difference'),
                      SizedBox(width: 10),
                      Text(
                        (spendTimePlaceState.diff != 0)
                            ? spendTimePlaceState.diff.toString().toCurrency()
                            : (spendTimePlaceState.baseDiff == '')
                                ? ''
                                : spendTimePlaceState.baseDiff.toCurrency(),
                        style: TextStyle(
                          color: (spendTimePlaceState.diff == 0) ? Colors.yellowAccent : Colors.white,
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
              Expanded(
                child: SizedBox(
                  width: context.screenSize.width,
                  child: Row(
                    children: [
                      Expanded(child: _displayInputParts()),
                      (spendTimePlaceState.blinkingFlag)
                          ? DecoratedBoxTransition(
                              decoration: _decorationTween.animate(_animationController),
                              child: SizedBox(
                                width: 90,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(color: Colors.black),
                                  child: _spendItemSetPanel(),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 90,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Colors.transparent),
                                child: _spendItemSetPanel(),
                              ),
                            ),
                    ],
                  ),
                ),
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
    for (var i = 0; i < 10; i++) {
      _placeTecs.add(TextEditingController(text: ''));
      _priceTecs.add(TextEditingController(text: ''));
    }
  }

  ///
  void _makeSpendItem() {
    _spendItem = [];
    SpendType.values.forEach((element) => _spendItem.add(element.japanName!));
  }

  ///
  Widget _spendItemSetPanel() {
    var spendTimePlaceState = ref.watch(spendTimePlaceProvider);

    return SingleChildScrollView(
      child: Column(
        children: _spendItem.map((e) {
          return GestureDetector(
            onTap: () {
              ref.read(spendTimePlaceProvider.notifier).setBlinkingFlag(blinkingFlag: false);

              ref.read(spendTimePlaceProvider.notifier).setSpendItem(pos: spendTimePlaceState.itemPos, item: e);
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: (e == spendTimePlaceState.spendItem[spendTimePlaceState.itemPos])
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
  Widget _displayInputParts() {
    final list = <Widget>[];

    var spendTimePlaceState = ref.watch(spendTimePlaceProvider);

    for (var i = 0; i < 10; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(spendTimePlaceProvider.notifier)
                            .setBlinkingFlag(blinkingFlag: !spendTimePlaceState.blinkingFlag);

                        ref.read(spendTimePlaceProvider.notifier).setItemPos(pos: i);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(spendTimePlaceState.spendItem[i]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => showTP(pos: i),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(spendTimePlaceState.spendTime[i]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                controller: _priceTecs[i],
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  hintText: '金額',
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                ),
                style: const TextStyle(fontSize: 12),
                onChanged: (value) => ref.read(spendTimePlaceProvider.notifier).setSpendPrice(
                      pos: i,
                      price: value.toInt(),
                    ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _placeTecs[i],
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  hintText: '場所',
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                ),
                style: const TextStyle(fontSize: 12),
                onChanged: (value) => ref.read(spendTimePlaceProvider.notifier).setPlace(pos: i, place: value),
              )
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Future<void> showTP({required int pos}) async {
    final selectedTime = await showTimePicker(
      context: _context,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );

    if (selectedTime != null) {
      final time = '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
      await ref.read(spendTimePlaceProvider.notifier).setTime(pos: pos, time: time);
    }
  }

  ///
  void _inputSpend() {}
}
