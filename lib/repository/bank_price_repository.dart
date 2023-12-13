import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/bank_price.dart';
import '../state/bank_price/bank_price_notifier.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class BankPriceRepository {
  ///
  static Future<void> insertBankPrice({required BankPrice bankPrice}) async {
    final db = await MoneyRepository.database();
    await db.insert('bank_price', bankPrice.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  static Future<void> getBankPriceList({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('bank_price', orderBy: 'date asc');

    final bankPriceList = List.generate(maps.length, (index) {
      return BankPrice(
        id: maps[index]['id'] as int,
        date: maps[index]['date'] as String,
        depositType: maps[index]['deposit_type'] as String,
        bankId: maps[index]['bank_id'] as int,
        price: maps[index]['price'] as int,
      );
    });

    await ref.read(bankPriceProvider.notifier).setBankPriceList(bankPriceList: bankPriceList);
  }
}
