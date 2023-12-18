import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/bank_price.dart';

part 'bank_price_response_state.freezed.dart';

@freezed
class BankPriceResponseState with _$BankPriceResponseState {
  const factory BankPriceResponseState({
    @Default(AsyncValue<List<BankPrice>>.loading()) AsyncValue<List<BankPrice>> bankPriceList,

    ///
    @Default(AsyncValue<Map<String, List<BankPrice>>>.loading())
    AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap,

    ///
    @Default(AsyncValue<Map<String, Map<String, int>>>.loading())
    AsyncValue<Map<String, Map<String, int>>> bankPriceDatePadMap,
  }) = _BankPriceResponseState;
}
