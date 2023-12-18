import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/income.dart';

part 'incomes_response_state.freezed.dart';

@freezed
class IncomesResponseState with _$IncomesResponseState {
  const factory IncomesResponseState({
    @Default(AsyncValue<List<Income>>.loading()) AsyncValue<List<Income>> incomeList,
  }) = _IncomesResponseState;
}
