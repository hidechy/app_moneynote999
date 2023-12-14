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
      final bplMap = <String, List<Map<String, int>>>{};

      bankPriceList
        ..forEach((element) {
          bplMap['${element.depositType}-${element.bankId}'] = [];
        })
        ..forEach((element) {
          bplMap['${element.depositType}-${element.bankId}']?.add({element.date: element.price});
        });
      //--- (1)

//  print(bplMap);

/*

I/flutter ( 5443): {
bank-1: [{2023-12-11: 10000}, {2023-12-12: 11000}, {2023-12-13: 12000}],
bank-2: [{2023-12-11: 20000}, {2023-12-12: 22000}],
bank-3: [{2023-12-11: 30000}, {2023-12-13: 33000}],
bank-4: [{2023-12-11: 40000}, {2023-12-13: 44000}],
bank-5: [{2023-12-11: 50000}],

emoney-1: [{2023-12-11: 10000}],
emoney-2: [{2023-12-11: 20000}],
emoney-3: [{2023-12-11: 30000}],
emoney-4: [{2023-12-11: 40000}],
emoney-5: [{2023-12-11: 50000}]}

*/

      //--- (2)
      final dt = DateTime.parse('${bankPriceList[0].date} 00:00:00');

      final now = DateTime.now();

      final diff = now.difference(dt).inDays;

      bplMap.forEach((deposit, value) {
        final map4 = <String, int>{};

        var price = 0;
        for (var i = 0; i <= diff; i++) {
          final date = dt.add(Duration(days: i)).yyyymmdd;

          value.forEach((element) {
            if (element[date] != null) {
              price = element[date] ?? 0;
            }

            map4[date] = price;
          });
        }

        map3[deposit] = map4;
      });

      //--- (2)
    }

//print(map3);

/*

bank-1: [{2023-12-11: 10000}, {2023-12-12: 11000}, {2023-12-13: 12000}],
bank-2: [{2023-12-11: 20000}, {2023-12-12: 22000}],
bank-3: [{2023-12-11: 30000}, {2023-12-13: 33000}],
bank-4: [{2023-12-11: 40000}, {2023-12-13: 44000}],
bank-5: [{2023-12-11: 50000}],
///

I/flutter ( 5443): {
bank-1: {2023-12-11: 10000, 2023-12-12: 11000, 2023-12-13: 12000, 2023-12-14: 12000},
bank-2: {2023-12-11: 20000, 2023-12-12: 22000, 2023-12-13: 22000, 2023-12-14: 22000},
bank-3: {2023-12-11: 30000, 2023-12-12: 30000, 2023-12-13: 33000, 2023-12-14: 33000},
bank-4: {2023-12-11: 40000, 2023-12-12: 40000, 2023-12-13: 44000, 2023-12-14: 44000},
bank-5: {2023-12-11: 50000, 2023-12-12: 50000, 2023-12-13: 50000, 2023-12-14: 50000},

emoney-1: {2023-12-11: 10000, 2023-12-12: 10000, 2023-12-13: 10000, 2023-12-14: 10000},
emoney-2: {2023-12-11: 20000, 2023-12-12: 20000, 2023-12-13: 20000, 2023-12-14: 20000},
emoney-3: {2023-12-11: 30000, 2023-12-12: 30000, 2023-12-13: 30000, 2023-12-14: 30000},
emoney-4: {2023-12-11: 40000, 2023-12-12: 40000, 2023-12-13: 40000, 2023-12-14: 40000},
emoney-5: {2023-12-11: 50000, 2023-12-12: 50000, 2023-12-13: 50000, 2023-12-14: 50000}}

*/

    //=======================//

    state = state.copyWith(
      bankPriceList: AsyncValue.data(bankPriceList),
      bankPriceListMap: AsyncValue.data(map2),
      bankPriceDatePadMap: AsyncValue.data(map3),
    );
  }
}
