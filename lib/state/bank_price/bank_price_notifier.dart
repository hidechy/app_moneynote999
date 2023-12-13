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

    if (bankPriceList.isNotEmpty) {
      //--- (1)
      final bplMap = <String, int>{};
      bankPriceList.forEach((element) => bplMap[element.date] = element.price);
      //--- (1)

      //--- (2)
      final dt = DateTime.parse('${bankPriceList[0].date} 00:00:00');
      final now = DateTime.now();
      final diff = now.difference(dt).inDays;

      bankPriceList.forEach((element) {
        final map4 = <String, int>{};

        var price = 0;
        for (var i = 0; i <= diff; i++) {
          final date = dt.add(Duration(days: i)).yyyymmdd;

          if (bplMap[date] != null) {
            price = bplMap[date] ?? 0;
          }

          map4[date] = price;
        }

        map3['${element.depositType}-${element.bankId}'] = map4;
      });
      //--- (2)
    }

/*
//    print(map3);
    I/flutter ( 6961): {bank-1: {2023-12-05: 66666, 2023-12-06: 66666, 2023-12-07: 66666, 2023-12-08: 66666, 2023-12-09: 66666, 2023-12-10: 66666,
    2023-12-11: 99999, 2023-12-12: 99999, 2023-12-13: 99999}}

*/

    //=======================//

    state = state.copyWith(
      bankPriceList: AsyncValue.data(bankPriceList),
      bankPriceListMap: AsyncValue.data(map2),
      bankPriceDatePadMap: AsyncValue.data(map3),
    );
  }
}
