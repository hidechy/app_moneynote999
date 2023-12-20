import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/money.dart';

part 'moneies_response_state.freezed.dart';

@freezed
class MoneiesResponseState with _$MoneiesResponseState {
  const factory MoneiesResponseState({
    Money? singleMoney,
    Money? beforeDateMoney,
    Money? beforeDateMoneyForSum,

    //
    @Default(AsyncValue<List<Money>>.loading()) AsyncValue<List<Money>> moneyList,

    //
    @Default(AsyncValue<Map<String, Money>>.loading()) AsyncValue<Map<String, Money>> moneyMap,
  }) = _MoneiesResponseState;
}
