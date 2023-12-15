import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_param_response_state.dart';

final appParamProvider = StateNotifierProvider.autoDispose<AppParamNotifier, AppParamResponseState>((ref) {
  return AppParamNotifier(const AppParamResponseState());
});

class AppParamNotifier extends StateNotifier<AppParamResponseState> {
  AppParamNotifier(super.state);

  ///
  Future<void> setCalendarSelectedDate({required DateTime date}) async =>
      state = state.copyWith(calendarSelectedDate: date);

  ///
  Future<void> setMenuNumber({required int menuNumber}) async => state = state.copyWith(menuNumber: menuNumber);

  ///
  Future<void> setOpenCurrencyArea({required bool value}) async => state = state.copyWith(openCurrencyArea: value);

  ///
  Future<void> setOpenBankArea({required bool value}) async => state = state.copyWith(openBankArea: value);

  ///
  Future<void> setOpenEmoneyArea({required bool value}) async => state = state.copyWith(openEmoneyArea: value);

  ///
  Future<void> setOpenSpendArea({required bool value}) async => state = state.copyWith(openSpendArea: value);

  ///
  Future<void> setOpenTimeplaceArea({required bool value}) async => state = state.copyWith(openTimeplaceArea: value);
}
