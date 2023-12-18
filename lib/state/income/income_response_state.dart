import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/income.dart';

part 'income_response_state.freezed.dart';

@freezed
class IncomeResponseState with _$IncomeResponseState {
  const factory IncomeResponseState({
    @Default(AsyncValue<List<Income>>.loading()) AsyncValue<List<Income>> incomeList,
  }) = _IncomeResponseState;
}
