import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/extensions.dart';
import '../state/calendar/calendar_notifier.dart';
import '../state/holiday/holiday_notifier.dart';
import '../utilities/utilities.dart';
import 'components/_money_dialog.dart';
import 'components/bank_names_list_alert.dart';
import 'components/daily_money_display_alert.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key, this.baseYm});

  String? baseYm;

  DateTime _calendarMonthFirst = DateTime.now();
  final List<String> _youbiList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  List<String> _calendarDays = [];

  Map<String, String> _holidayMap = {};

  final Utility _utility = Utility();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    if (baseYm != null) {
      Future(() => ref.read(calendarProvider.notifier).setCalendarYearMonth(baseYm: baseYm));
    }

    final calendarState = ref.watch(calendarProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(calendarState.baseYearMonth),
        leading: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: _goPrevMonth,
              child: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.8), size: 14),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: _goNextMonth,
              child: Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.8), size: 14),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: _context.screenSize.height / 3),
              child: _getCalendar(),
            ),
          ],
        ),
      ),
      endDrawer: dispDrawer(context),
    );
  }

  ///
  Widget dispDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellowAccent.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () async {
                  await MoneyDialog(
                    context: context,
                    widget: BankNamesListAlert(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                  ),
                  child: const Text('Bank Setting'),
                ),
              ),
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
    final list = <Widget>[];

    for (var i = week * 7; i < ((week + 1) * 7); i++) {
      final dispDate = (_calendarDays[i] == '')
          ? ''
          : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).yyyymmdd;

      final youbiStr = (_calendarDays[i] == '')
          ? ''
          : DateTime(_calendarMonthFirst.year, _calendarMonthFirst.month, _calendarDays[i].toInt()).youbiStr;

      list.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              MoneyDialog(
                context: _context,
                widget: DailyMoneyDisplayAlert(
                  date: DateTime.parse('$dispDate 00:00:00'),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: (_calendarDays[i] == '') ? Colors.transparent : Colors.white.withOpacity(0.4),
                ),
                color: (_calendarDays[i] == '')
                    ? Colors.transparent
                    : _utility.getYoubiColor(date: dispDate, youbiStr: youbiStr, holidayMap: _holidayMap),
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
