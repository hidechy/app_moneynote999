import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/bank_price.dart';
import 'bank_price_response_state.dart';

final bankPriceProvider = StateNotifierProvider.autoDispose<BankPriceSettingNotifier, BankPriceResponseState>((ref) {
  return BankPriceSettingNotifier(const BankPriceResponseState());
});

class BankPriceSettingNotifier extends StateNotifier<BankPriceResponseState> {
  BankPriceSettingNotifier(super.state);

  ///
  Future<void> setBankPriceList({required List<BankPrice> bankPriceList}) async {
    final map = <String, BankPrice>{};
    final map2 = <String, List<BankPrice>>{};

    bankPriceList
      ..forEach((element) {
        map2['${element.depositType}-${element.bankId}'] = [];
      })
      ..forEach((element) {
        map2['${element.depositType}-${element.bankId}']?.add(element);
        map['${element.depositType}-${element.bankId}'] = element;
      });

    state = state.copyWith(
      bankPriceList: AsyncValue.data(bankPriceList),
      bankPriceLastMap: AsyncValue.data(map),
      bankPriceListMap: AsyncValue.data(map2),
    );
  }
}
