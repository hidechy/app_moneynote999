import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_params_response_state.freezed.dart';

@freezed
class AppParamsResponseState with _$AppParamsResponseState {
  const factory AppParamsResponseState({
    DateTime? calendarSelectedDate,
    @Default(0) int menuNumber,
    @Default(true) bool openCurrencyArea,
    @Default(true) bool openBankArea,
    @Default(true) bool openEmoneyArea,
    @Default(true) bool openSpendTimePlaceArea,
  }) = _AppParamsResponseState;
}
