import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';

import 'calendar_response_state.dart';

////////////////////////////////////////////////

final calendarProvider = StateNotifierProvider.autoDispose<CalendarNotifier, CalendarResponseState>((ref) {
  return CalendarNotifier(const CalendarResponseState())..setCalendarYearMonth();
});

class CalendarNotifier extends StateNotifier<CalendarResponseState> {
  CalendarNotifier(super.state);

  Future<void> setCalendarYearMonth({String? baseYm}) async {
    final baseYearMonth = (baseYm != null) ? baseYm : DateTime.now().yyyymm;

    final prevYearMonth = DateTime(baseYearMonth.split('-')[0].toInt(), baseYearMonth.split('-')[1].toInt() - 1).yyyymm;
    final nextYearMonth = DateTime(baseYearMonth.split('-')[0].toInt(), baseYearMonth.split('-')[1].toInt() + 1).yyyymm;

    state = state.copyWith(baseYearMonth: baseYearMonth, prevYearMonth: prevYearMonth, nextYearMonth: nextYearMonth);
  }
}

////////////////////////////////////////////////
