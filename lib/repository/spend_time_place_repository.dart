import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/spend_time_place.dart';

import '../state/spend_time_place/spend_time_place_notifier.dart';

import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class SpendTimePlaceRepository {
  ///
  static Future<void> deleteSpendTimePlace({required String date, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    await db.delete('spend_time_place', where: 'date = ?', whereArgs: [date]);
    await ref.read(spendTimePlaceProvider.notifier).deleteSpendTimePlaceList(date: date);
  }

  ///
  static Future<void> insertSpendTimePlace({required SpendTimePlace spendTimePlace}) async {
    final db = await MoneyRepository.database();
    await db.insert('spend_time_place', spendTimePlace.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  static Future<void> getSingleSpendTimePlace({required String date, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query(
      'spend_time_place',
      where: 'date = ?',
      whereArgs: [date],
      orderBy: 'id asc',
    );

    final spendTimePlaceList = List.generate(maps.length, (index) {
      return SpendTimePlace(
        id: maps[index]['id'] as int,
        date: maps[index]['date'] as String,
        spendType: maps[index]['spend_type'] as String,
        time: maps[index]['time'] as String,
        place: maps[index]['place'] as String,
        price: maps[index]['price'],
      );
    });

    await ref.read(spendTimePlaceProvider.notifier).setSpendTimePlaceList(spendTimePlaceList: spendTimePlaceList);
  }
}
