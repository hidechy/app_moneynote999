import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/spend.dart';
import '../state/spend/spend_notifier.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class SpendRepository {
  ///
  static Future<void> insertSpend({required Spend spend}) async {
    final db = await MoneyRepository.database();
    await db.insert('spend', spend.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  static Future<void> getSingleSpend({required String date, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('spend', where: 'date = ?', whereArgs: [date]);

    final spendList = List.generate(maps.length, (index) {
      return Spend(
        id: maps[index]['id'] as int,
        date: maps[index]['date'] as String,
        spendType: maps[index]['spend_type'] as String,
        price: maps[index]['price'],
      );
    });

    await ref.read(spendProvider.notifier).setSpendList(spendList: spendList);
  }
}
