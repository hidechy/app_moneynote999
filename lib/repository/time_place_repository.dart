import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/timeplace.dart';
import '../state/time_place/time_place_notifier.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class TimePlaceRepository {
  ///
  static Future<void> deleteTimePlace({required String date, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    await db.delete('time_place', where: 'date = ?', whereArgs: [date]);
    await ref.read(timePlaceProvider.notifier).deleteTimePlaceList(date: date);
  }

  ///
  static Future<void> insertTimePlace({required TimePlace timePlace}) async {
    final db = await MoneyRepository.database();
    await db.insert('time_place', timePlace.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
