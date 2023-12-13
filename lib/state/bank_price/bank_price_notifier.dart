import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/extensions/extensions.dart';
import '../../models/bank_price.dart';
import 'bank_price_response_state.dart';

final bankPriceProvider = StateNotifierProvider.autoDispose<BankPriceSettingNotifier, BankPriceResponseState>((ref) {
  return BankPriceSettingNotifier(const BankPriceResponseState());
});

class BankPriceSettingNotifier extends StateNotifier<BankPriceResponseState> {
  BankPriceSettingNotifier(super.state);

  ///
  Future<void> setBankPriceList({required List<BankPrice> bankPriceList}) async {
    final map2 = <String, List<BankPrice>>{};

    bankPriceList
      ..forEach((element) {
        map2['${element.depositType}-${element.bankId}'] = [];
      })
      ..forEach((element) {
        map2['${element.depositType}-${element.bankId}']?.add(element);
      });

    //=======================//

    final map3 = <String, Map<String, int>>{};

    final dt = DateTime.parse('${bankPriceList[0].date} 00:00:00');
    final now = DateTime.now();

    final diff = now.difference(dt).inDays;

    var price = 0;
    var keepPrice = 0;
    bankPriceList.forEach((element) {
      if (keepPrice != element.price) {
        price = element.price;
      }

      final map4 = <String, int>{};
      for (var i = 0; i <= diff; i++) {
        map4[dt.add(Duration(days: i)).yyyymmdd] = price;
      }

      map3['${element.depositType}-${element.bankId}'] = map4;

      keepPrice = element.price;
    });

    //=======================//

    state = state.copyWith(
      bankPriceList: AsyncValue.data(bankPriceList),
      bankPriceListMap: AsyncValue.data(map2),
      bankPriceDatePadMap: AsyncValue.data(map3),
    );
  }
}
