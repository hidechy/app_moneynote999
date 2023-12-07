// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday_response_state.freezed.dart';

@freezed
class HolidayResponseState with _$HolidayResponseState {
  const factory HolidayResponseState({
    @Default(AsyncValue<Map<String, String>>.loading()) AsyncValue<Map<String, String>> holidayMap,
  }) = _HolidayResponseState;
}
