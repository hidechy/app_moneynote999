import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/get_monthly_stp_from.dart';
import '../../enums/get_monthly_stp_usage.dart';
import '../../extensions/extensions.dart';
import '../../repository/spend_time_place_repository.dart';
import '../../state/spend_time_places/spend_time_places_notifier.dart';

// ignore: must_be_immutable
class SpendTimePlaceListAlert extends ConsumerWidget {
  SpendTimePlaceListAlert({super.key, required this.date, required this.item});

  final DateTime date;
  final String item;

  late WidgetRef _ref;

  ///
  Future<void> init({required WidgetRef ref}) async {
    await SpendTimePlaceRepository().getMonthRecord(
      yearmonth: date.yyyymm,
      ref: ref,
      from: GetMonthlyStpFrom.spendTimePlaceListAlert,
      usage: GetMonthlyStpUsage.stpItemList,
    );
  }

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

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
              Container(width: context.screenSize.width),
              Text(date.yyyymmdd),
              Text(item),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Expanded(child: _displayMonthlyStpList()),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayMonthlyStpList() {
    final spendTimePlaceList = _ref.watch(spendTimePlaceProvider.select((value) => value.spendTimePlaceList));

    return spendTimePlaceList.when(
      data: (value) {
        final list = <Widget>[];

        value.where((element) => element.spendType == item).forEach((element) {
          list.add(Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(element.date),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 40,
                      child: Text(element.time),
                    ),
                    const SizedBox(width: 20),
                    Text(element.place),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(element.price.toString().toCurrency()),
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
}
