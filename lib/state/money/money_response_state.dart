import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/money.dart';

part 'money_response_state.freezed.dart';

@freezed
class MoneyResponseState with _$MoneyResponseState {
  const factory MoneyResponseState({
    Money? singleMoney,
  }) = _MoneyResponseState;
}
