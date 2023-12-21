import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/bank_price.dart';
import '../state/bank_prices/bank_prices_notifier.dart';
import '_repository.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class BankPriceRepository implements Repository {
  ///
  @override
  Future<void> getList({required WidgetRef ref}) async {
    try {
      final db = await MoneyRepository.database();
      final List<Map<String, dynamic>> maps = await db.query('bank_prices', orderBy: 'date asc');
      final bankPriceList = List.generate(maps.length, (index) => BankPrice.fromJson(maps[index]));
      await ref.read(bankPriceProvider.notifier).setBankPriceList(bankPriceList: bankPriceList);
    } catch (e) {}
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    try {
      final db = await MoneyRepository.database();
      final bankPrice = param as BankPrice;
      await db.delete(
        'bank_prices',
        where: 'deposit_type = ? and bank_id = ? and date = ?',
        whereArgs: [bankPrice.depositType, bankPrice.bankId, bankPrice.date],
      );
      await db.insert('bank_prices', bankPrice.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {}
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {}

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {}
}
