import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/bank_price.dart';

part 'bank_prices_response_state.freezed.dart';

@freezed
class BankPricesResponseState with _$BankPricesResponseState {
  const factory BankPricesResponseState({
    @Default(AsyncValue<List<BankPrice>>.loading()) AsyncValue<List<BankPrice>> bankPriceList,

    ///
    @Default(AsyncValue<Map<String, List<BankPrice>>>.loading())
    AsyncValue<Map<String, List<BankPrice>>> bankPriceListMap,

    ///
    @Default(AsyncValue<Map<String, Map<String, int>>>.loading())
    AsyncValue<Map<String, Map<String, int>>> bankPriceDatePadMap,
  }) = _BankPricesResponseState;
}
