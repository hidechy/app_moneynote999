import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enums/get_monthly_stp_from.dart';
import '../enums/get_monthly_stp_usage.dart';
import '../extensions/extensions.dart';
import '../repository/bank_price_repository.dart';
import '../repository/money_repository.dart';
import '../repository/spend_time_place_repository.dart';
import '../state/app_params/app_params_notifier.dart';
import '../state/bank_prices/bank_prices_notifier.dart';
import '../state/calendars/calendars_notifier.dart';
import '../state/holidays/holidays_notifier.dart';
import '../state/moneies/moneies_notifier.dart';
import '../state/spend_time_places/spend_time_places_notifier.dart';
import '../utilities/utilities.dart';
import 'components/___dummy_data_input_alert.dart';
import 'components/_money_dialog.dart';
import 'components/daily_money_display_alert.dart';
import 'components/deposit_tab_alert.dart';
import 'components/parts/back_ground_image.dart';
import 'components/parts/menu_head_icon.dart';
import 'components/spend_time_place_list_alert.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key, this.baseYm});

  String? baseYm;

  DateTime _calendarMonthFirst = DateTime.now();
  final List<String> _youbiList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  List<String> _calendarDays = [];

  Map<String, String> _holidayMap = {};

  final Utility _utility = Utility();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  Future<void> init({required WidgetRef ref}) async {
    await SpendTimePlaceRepository().getMonthRecord(
      yearmonth: baseYm ?? DateTime.now().yyyymm,
      ref: ref,
      from: GetMonthlyStpFrom.homeScreen,
      usage: GetMonthlyStpUsage.sum,
    );

    await BankPriceRepository().getList(ref: ref);

    await MoneyRepository().getMonthRecord(yearmonth: baseYm ?? DateTime.now().yyyymm, ref: ref);
  }

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    if (baseYm != null) {
      Future(() => ref.read(calendarProvider.notifier).setCalendarYearMonth(baseYm: baseYm));
    }

    Future(() => init(ref: ref));

    final calendarState = ref.watch(calendarProvider);

    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.3),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(calendarState.baseYearMonth),
        centerTitle: false,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: _goPrevMonth,
              child: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.8), size: 14),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: (DateTime.now().yyyymm == calendarState.baseYearMonth) ? null : _goNextMonth,
              child: Icon(
                Icons.arrow_forward_ios,
                color: (DateTime.now().yyyymm == calendarState.baseYearMonth)
                    ? Colors.grey.withOpacity(0.6)
                    : Colors.white.withOpacity(0.8),
                size: 14,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            icon: Icon(Icons.settings, color: Colors.white.withOpacity(0.6), size: 20),
          )
        ],
      ),
      body: Stack(
        children: [
          const BackGroundImage(),
          Container(
            width: context.screenSize.width,
            height: context.screenSize.height,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
          ),
          SafeArea(
            child: DefaultTextStyle(
              style: GoogleFonts.kiwiMaru(fontSize: 12),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: _context.screenSize.height * 0.3),
                    child: _getCalendar(),
                  ),
                  Expanded(child: _displaySpendList()),
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: _dispDrawer(),
    );
  }

  ///
  Widget _displaySpendList() {
    final monthlySpendItemSumMap = _ref.watch(spendTimePlaceProvider.select((value) => value.monthlySpendItemSumMap));

    return monthlySpendItemSumMap.when(
      data: (value) {
        final list = <Widget>[];

        var sum = 0;
        value.forEach((key, value) {
          sum += value;
        });

        if (sum > 0) {
          list.add(
            Container(
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
            ),
          );
        }

        value.forEach((key, value) {
          final percent = value / sum * 100;

          list.add(Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(key),
                Row(
                  children: [
                    Text(value.toString().toCurrency()),
                    Container(
                      width: 60,
                      alignment: Alignment.topRight,
                      child: Text('${percent.toStringAsFixed(1)} %'),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        MoneyDialog(
                          context: _context,
                          widget: SpendTimePlaceListAlert(
                            date: (baseYm != null) ? DateTime.parse('$baseYm-01 00:00:00') : DateTime.now(),
                            item: key,
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        alignment: Alignment.topRight,
                        child: Icon(Icons.info_outline_rounded, color: Colors.white.withOpacity(0.6)),
                      ),
                    ),
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
  Widget _dispDrawer() {
    return Drawer(
      backgroundColor: Colors.blueGrey.withOpacity(0.2),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () async => MoneyDialog(context: _context, widget: DepositTabAlert()),
                child: Row(
                  children: [
                    const MenuHeadIcon(),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                        margin: const EdgeInsets.all(5),
                        //    decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                        child: const Text('金融機関、電子マネー管理'),
                      ),
                    ),
                  ],
                ),
              ),

              ///

              const SizedBox(height: 100),
              GestureDetector(
                onTap: () async => MoneyDialog(context: _context, widget: DummyDataInputAlert()),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                  child: const Text('dummy data'),
                ),
              ),

              ///
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _getCalendar() {
    final holidayState = _ref.watch(holidayProvider);

    if (holidayState.holidayMap.value != null) {
      _holidayMap = holidayState.holidayMap.value!;
    }

    final calendarState = _ref.watch(calendarProvider);

    _calendarMonthFirst = DateTime.parse('${calendarState.baseYearMonth}-01 00:00:00');

    final monthEnd = DateTime.parse('${calendarState.nextYearMonth}-00 00:00:00');

    final diff = monthEnd.difference(_calendarMonthFirst).inDays;
    final monthDaysNum = diff + 1;

    final youbi = _calendarMonthFirst.youbiStr;
    final youbiNum = _youbiList.indexWhere((element) => element == youbi);

    final weekNum = ((monthDaysNum + youbiNum) <= 35) ? 5 : 6;

    _calendarDays = List.generate(weekNum * 7, (index) => '');

    for (var i = 0; i < (weekNum * 7); i++) {
      if (i >= youbiNum) {
        final gendate = _calendarMonthFirst.add(Duration(days: i - youbiNum));

        if (_calendarMonthFirst.month == gendate.month) {
          _calendarDays[i] = gendate.day.toString();
        }
      }
    }

    final list = <Widget>[];
    for (var i = 0; i < weekNum; i++) {
      list.add(_getCalendarRow(week: i));
    }

    return DefaultTextStyle(style: const TextStyle(fontSize: 10), child: Column(children: list));
  }

  ///
  Widget _getCalendarRow({required int week}) {
    final bankPriceTotalPadMap = _ref.watch(bankPriceProvider.select((value) => value.bankPriceTotalPadMap));

    final moneyMap = _ref.watch(moneyProvider.select((value) => value.moneyMap));

    final appParamState = _ref.watch(appParamProvider);

    final list = <Widget>[];

    for (var i = week * 7; i < ((week + 1) * 7); i++) {
      final generateYmd = (_calendarDays[i] == '')
          ? ''
          : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).yyyymmdd;

      final youbiStr = (_calendarDays[i] == '')
          ? ''
          : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).youbiStr;

      var diff = 0;
      if (generateYmd != '') {
        final genDate = DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt());
        diff = genDate.difference(DateTime.now()).inSeconds;
      }

      var bankPrice = 0;
      if (bankPriceTotalPadMap.value != null) {
        if (bankPriceTotalPadMap.value![generateYmd] != null) {
          bankPrice = bankPriceTotalPadMap.value![generateYmd]!;
        }
      }

      var dateSum = 0;
      if (moneyMap.value != null) {
        if (moneyMap.value![generateYmd] != null) {
          dateSum = _utility.makeCurrencySum(money: moneyMap.value![generateYmd]);
        }
      }

      list.add(
        Expanded(
          child: GestureDetector(
            onTap: (_calendarDays[i] == '' || diff > 0)
                ? null
                : () {
                    _ref
                        .read(appParamProvider.notifier)
                        .setCalendarSelectedDate(date: DateTime.parse('$generateYmd 00:00:00'));

                    _ref.read(appParamProvider.notifier).setMenuNumber(menuNumber: 0);

                    MoneyDialog(
                      context: _context,
                      widget: DailyMoneyDisplayAlert(date: DateTime.parse('$generateYmd 00:00:00')),
                    );
                  },
            child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: (_calendarDays[i] == '')
                      ? Colors.transparent
                      : (generateYmd == DateTime.now().yyyymmdd)
                          ? Colors.orangeAccent.withOpacity(0.4)
                          : Colors.white.withOpacity(0.1),
                  width: 3,
                ),
                color: (_calendarDays[i] == '')
                    ? Colors.transparent
                    : (diff > 0)
                        ? Colors.white.withOpacity(0.1)
                        : (appParamState.calendarSelectedDate != null &&
                                generateYmd == appParamState.calendarSelectedDate!.yyyymmdd)
                            ? Colors.yellowAccent.withOpacity(0.2)
                            : _utility.getYoubiColor(date: generateYmd, youbiStr: youbiStr, holidayMap: _holidayMap),
              ),
              child: (_calendarDays[i] == '')
                  ? const Text('')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: _context.screenSize.height / 30),
                          child: Text(_calendarDays[i].padLeft(2, '0')),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(((bankPrice + dateSum) == 0) ? '' : (bankPrice + dateSum).toString().toCurrency()),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ),
      );
    }

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }

  ///
  void _goPrevMonth() {
    final calendarState = _ref.watch(calendarProvider);

    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => HomeScreen(baseYm: calendarState.prevYearMonth)),
    );
  }

  ///
  void _goNextMonth() {
    final calendarState = _ref.watch(calendarProvider);

    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => HomeScreen(baseYm: calendarState.nextYearMonth)),
    );
  }
}
