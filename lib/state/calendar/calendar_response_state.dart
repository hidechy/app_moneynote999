import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_response_state.freezed.dart';

@freezed
class CalendarResponseState with _$CalendarResponseState {
  const factory CalendarResponseState({
    @Default('') String baseYearMonth,
    @Default('') String prevYearMonth,
    @Default('') String nextYearMonth,
  }) = _CalendarResponseState;
}
