import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/timeplace.dart';
import '../../repository/time_place_repository.dart';
import '../../state/time_place/time_place_notifier.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class TimeplaceInputAlert extends ConsumerWidget {
  TimeplaceInputAlert({super.key, required this.date, required this.spend});

  final DateTime date;
  final int spend;

  final List<TextEditingController> _placeTecs = [];
  final List<TextEditingController> _priceTecs = [];

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => ref.read(timePlaceProvider.notifier).setBaseDiff(baseDiff: spend.toString()));

    final timePlaceState = ref.watch(timePlaceProvider);

    makeTecs();

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
                        (timePlaceState.diff != 0)
                            ? timePlaceState.diff.toString().toCurrency()
                            : (timePlaceState.baseDiff == '')
                                ? ''
                                : timePlaceState.baseDiff.toCurrency(),
                        style: TextStyle(
                          color: (timePlaceState.diff == 0) ? Colors.yellowAccent : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: _inputTimePlace,
                    child: Icon(Icons.input, color: Colors.greenAccent.withOpacity(0.6), size: 16),
                  ),
                ],
              ),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Expanded(child: _displayInputParts()),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayInputParts() {
    final list = <Widget>[
      const DefaultTextStyle(
        style: TextStyle(fontSize: 10, color: Colors.grey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('時間と場所を入力'),
            Text('マイナス値入力の際は ー を押下'),
          ],
        ),
      )
    ];

    final timePlaceState = _ref.watch(timePlaceProvider);

    for (var i = 0; i < 10; i++) {
      list.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SizedBox(
                width: _context.screenSize.width * 0.1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                  readOnly: true,
                  controller: TextEditingController(text: timePlaceState.spendTime[i]),
                  decoration: InputDecoration(
                    fillColor: Colors.yellowAccent.withOpacity(0.2),
                    hintText: '時間',
                    filled: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  ),
                  onTap: () => showTP(pos: i),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: _context.screenSize.width * 0.3,
                child: TextField(
                  controller: _placeTecs[i],
                  decoration: const InputDecoration(
                    hintText: '場所',
                    filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  ),
                  style: const TextStyle(fontSize: 12),
                  onChanged: (value) => _ref.read(timePlaceProvider.notifier).setPlace(pos: i, place: value),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _ref.read(timePlaceProvider.notifier).setMinusCheck(pos: i),
                child: Icon(
                  Icons.remove,
                  color: (timePlaceState.minusCheck[i]) ? Colors.redAccent : Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: _context.screenSize.width * 0.2,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _priceTecs[i],
                  decoration: const InputDecoration(
                    hintText: '金額',
                    filled: true,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  ),
                  style: const TextStyle(fontSize: 12),
                  onChanged: (value) =>
                      _ref.read(timePlaceProvider.notifier).setSpendPrice(pos: i, price: value.toInt()),
                ),
              ),
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
      await _ref.read(timePlaceProvider.notifier).setTime(pos: pos, time: time);
    }
  }

  ///
  void makeTecs() {
    final timePlaceState = _ref.watch(timePlaceProvider);

    for (var i = 0; i < 10; i++) {
      _placeTecs.add(TextEditingController(text: timePlaceState.spendPlace[i]));
      _priceTecs.add(TextEditingController(
        text: (timePlaceState.spendPrice[i] == 0) ? '' : timePlaceState.spendPrice[i].toString(),
      ));
    }
  }

  ///
  Future<void> _inputTimePlace() async {
    final timePlaceState = _ref.watch(timePlaceProvider);

    final spendTime = timePlaceState.spendTime;
    final spendPlace = timePlaceState.spendPlace;
    final minusCheck = timePlaceState.minusCheck;
    final spendPrice = timePlaceState.spendPrice;

    final list = <Map<String, dynamic>>[];

    var errFlg = false;

    for (var i = 0; i < 10; i++) {
      if (spendTime[i] != '' && spendPlace[i] != '' && spendPrice[i] != 0) {
        final price = (minusCheck[i]) ? spendPrice[i] * -1 : spendPrice[i];
        list.add({'time': spendTime[i], 'place': spendPlace[i], 'price': price});
      }
    }

    if (list.isEmpty) {
      errFlg = true;
    }

    final diff = timePlaceState.diff;

    if (diff != 0 || errFlg) {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    await TimePlaceRepository.deleteTimePlace(date: date.yyyymmdd, ref: _ref);

    list.forEach((element) async {
      final timePlace =
          TimePlace(date: date.yyyymmdd, time: element['time'], place: element['place'], price: element['price']);

      await TimePlaceRepository.insertTimePlace(timePlace: timePlace);
    });

    await _ref.read(timePlaceProvider.notifier).clearInputValue();

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
