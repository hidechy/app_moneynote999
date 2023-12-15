import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_response_state.freezed.dart';

@freezed
class AppParamResponseState with _$AppParamResponseState {
  const factory AppParamResponseState({
    DateTime? calendarSelectedDate,
    @Default(0) int menuNumber,
    @Default(true) bool openCurrencyArea,
    @Default(true) bool openBankArea,
    @Default(true) bool openEmoneyArea,
    @Default(true) bool openSpendArea,
    @Default(true) bool openTimeplaceArea,
  }) = _AppParamResponseState;
}
