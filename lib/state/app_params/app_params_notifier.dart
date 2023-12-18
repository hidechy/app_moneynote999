import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_params_response_state.dart';

final appParamProvider = StateNotifierProvider.autoDispose<AppParamNotifier, AppParamsResponseState>((ref) {
  return AppParamNotifier(const AppParamsResponseState());
});

class AppParamNotifier extends StateNotifier<AppParamsResponseState> {
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
  Future<void> setOpenSpendTimePlaceArea({required bool value}) async =>
      state = state.copyWith(openSpendTimePlaceArea: value);

  ///
  Future<void> setSelectedIncomeYear({required String year}) async => state = state.copyWith(selectedIncomeYear: year);
}
