import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/spend_type.dart';
import '../../extensions/extensions.dart';
import '../../models/spend_time_place.dart';
import '../../repository/spend_time_place_repository.dart';
import '../../state/spend_time_places/spend_time_places_notifier.dart';
import 'parts/error_dialog.dart';

class SpendTimePlaceInputAlert extends ConsumerStatefulWidget {
  const SpendTimePlaceInputAlert({super.key, required this.date, required this.spend, this.spendTimePlaceList});

  final DateTime date;
  final int spend;
  final List<SpendTimePlace>? spendTimePlaceList;

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

  final List<TextEditingController> _placeTecs = [];
  final List<TextEditingController> _priceTecs = [];

  final List<String> _timeUnknownItem = ['クレジット', '共済代', '投資', '税金', '年金', '国民年金基金', '健康保険代', '利息'];

  late BuildContext _context;

  ///
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..repeat(reverse: true);

    _setUpdateSpendTimePlace();
  }

  ///
  Future<void> _setUpdateSpendTimePlace() async {
    for (var i = 0; i < 10; i++) {
      _placeTecs.add(TextEditingController(text: ''));
      _priceTecs.add(TextEditingController(text: ''));
    }

    if (widget.spendTimePlaceList != null) {
      await Future(() => ref
          .read(spendTimePlaceProvider.notifier)
          .setUpdateSpendTimePlace(updateSpendTimePlace: widget.spendTimePlaceList!));

      for (var i = 0; i < widget.spendTimePlaceList!.length; i++) {
        _placeTecs[i].text = widget.spendTimePlaceList![i].place;

        _priceTecs[i].text = widget.spendTimePlaceList![i].price.abs().toString();
      }
    }
  }

  ///
  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  ///
  Future<void> init({required WidgetRef ref}) async {
    await SpendTimePlaceRepository().getList(ref: ref);
  }

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    final spendTimePlaceState = ref.watch(spendTimePlaceProvider);

    Future(() => ref.read(spendTimePlaceProvider.notifier).setBaseDiff(baseDiff: widget.spend.toString()));

    Future(() => init(ref: ref));

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
                      const Text('Spend'),
                      const SizedBox(width: 10),
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
                    onTap: _inputSpendTimePlace,
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
                                  margin: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(color: Colors.black),
                                  child: _spendItemSetPanel(),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 90,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(color: Colors.transparent),
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
  Widget _spendItemSetPanel() {
    final itemPos = ref.watch(spendTimePlaceProvider.select((value) => value.itemPos));
    final spendItem = ref.watch(spendTimePlaceProvider.select((value) => value.spendItem));

    return SingleChildScrollView(
      child: Column(
        children: SpendType.values.map((e) {
          return GestureDetector(
            onTap: () async {
              await ref.read(spendTimePlaceProvider.notifier).setBlinkingFlag(blinkingFlag: false);

              await ref.read(spendTimePlaceProvider.notifier).setSpendItem(pos: itemPos, item: e.japanName!);

              if (_timeUnknownItem.contains(e.japanName)) {
                await ref.read(spendTimePlaceProvider.notifier).setTime(pos: itemPos, time: '00:00');
              }
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: (e.japanName == spendItem[itemPos])
                    ? Colors.yellowAccent.withOpacity(0.2)
                    : Colors.blueGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(e.japanName!, style: const TextStyle(fontSize: 10)),
            ),
          );
        }).toList(),
      ),
    );
  }

  ///
  Widget _displayInputParts() {
    final list = <Widget>[];

    final spendTimePlaceState = ref.watch(spendTimePlaceProvider);

    for (var i = 0; i < 10; i++) {
      final item = spendTimePlaceState.spendItem[i];
      final time = spendTimePlaceState.spendTime[i];
      final price = spendTimePlaceState.spendPrice[i];
      final place = spendTimePlaceState.spendPlace[i];

      list.add(
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: (item != '項目名' && time != '時間' && price != 0 && place != '')
                  ? Colors.orangeAccent.withOpacity(0.4)
                  : Colors.white.withOpacity(0.2),
              width: 2,
            ),
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
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: (item != '項目名')
                              ? Colors.yellowAccent.withOpacity(0.2)
                              : const Color(0xFFfffacd).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(item),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showTP(pos: i),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: (time != '時間')
                              ? Colors.greenAccent.withOpacity(0.2)
                              : const Color(0xFF90ee90).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(time),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _clearOneBox(pos: i);
                    },
                    child: const Icon(Icons.close, color: Colors.redAccent),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => ref.read(spendTimePlaceProvider.notifier).setMinusCheck(pos: i),
                    child: Icon(
                      Icons.remove,
                      color: (spendTimePlaceState.minusCheck[i]) ? Colors.redAccent : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
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
                      onChanged: (value) {
                        if (value != '') {
                          ref.read(spendTimePlaceProvider.notifier).setSpendPrice(pos: i, price: value.toInt());
                        }
                      },
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                ],
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
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              )
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(child: Column(children: list));
  }

  ///
  Future<void> _showTP({required int pos}) async {
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
  Future<void> _inputSpendTimePlace() async {
    final spendTimePlaceState = ref.watch(spendTimePlaceProvider);

    final list = <Map<String, dynamic>>[];

    var errFlg = false;

    for (var i = 0; i < 10; i++) {
      if (spendTimePlaceState.spendItem[i] != '項目名' &&
          spendTimePlaceState.spendTime[i] != '時間' &&
          spendTimePlaceState.spendPlace[i] != '' &&
          spendTimePlaceState.spendPrice[i] != 0) {
        final price = (spendTimePlaceState.minusCheck[i])
            ? spendTimePlaceState.spendPrice[i] * -1
            : spendTimePlaceState.spendPrice[i];

        list.add({
          'item': spendTimePlaceState.spendItem[i],
          'time': spendTimePlaceState.spendTime[i],
          'place': spendTimePlaceState.spendPlace[i],
          'price': price
        });
      }
    }

    if (list.isEmpty) {
      errFlg = true;
    }

    var diff = spendTimePlaceState.diff;

    //============================//初回
    final spendTimePlaceList = ref.watch(spendTimePlaceProvider.select((value) => value.spendTimePlaceList));

    if (spendTimePlaceList.value != null) {
      if (spendTimePlaceList.value!.isEmpty) {
        diff = 0;
      }
    }
    //============================//初回

    if (diff != 0 || errFlg) {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '登録できません。', content: '値を正しく入力してください。'),
      );

      return;
    }

    await SpendTimePlaceRepository().delete(
        param: SpendTimePlace(date: widget.date.yyyymmdd, spendType: '', time: '', place: '', price: 0), ref: ref);

    list.forEach((element) async {
      final spendTimePlace = SpendTimePlace(
        date: widget.date.yyyymmdd,
        spendType: element['item'],
        time: element['time'],
        place: element['place'],
        price: element['price'],
      );

      await SpendTimePlaceRepository().insert(param: spendTimePlace);
    });

    await ref.read(spendTimePlaceProvider.notifier).clearInputValue();

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }

  ///
  Future<void> _clearOneBox({required int pos}) async {
    _priceTecs[pos].clear();
    _placeTecs[pos].clear();

    await ref.read(spendTimePlaceProvider.notifier).clearOneBox(pos: pos);
  }
}
