import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_response_state.freezed.dart';

@freezed
class AppParamResponseState with _$AppParamResponseState {
  const factory AppParamResponseState({
    DateTime? calendarSelectedDate,
    @Default(0) int menuNumber,
  }) = _AppParamResponseState;
}
