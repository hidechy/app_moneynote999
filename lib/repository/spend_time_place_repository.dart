import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/spend_time_place.dart';
import '../state/spend_time_places/spend_time_places_notifier.dart';
import '_repository.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class SpendTimePlaceRepository implements Repository {
  ///
  Future<void> getSingle({required String date, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query(
      'spend_time_places',
      where: 'date = ?',
      whereArgs: [date],
      orderBy: 'id asc',
    );

    final spendTimePlaceList = List.generate(maps.length, (index) => SpendTimePlace.fromJson(maps[index]));

    await ref.read(spendTimePlaceProvider.notifier).setSpendTimePlaceList(spendTimePlaceList: spendTimePlaceList);
  }

  ///
  Future<void> getMonthRecord({required String date, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final exDate = date.split('-');
    final yearmonth = '${exDate[0]}-${exDate[1]}';
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM spend_time_places WHERE date LIKE ?;',
      ['$yearmonth%'],
    );
    final spendTimePlaceList = List.generate(maps.length, (index) => SpendTimePlace.fromJson(maps[index]));
    await ref.read(spendTimePlaceProvider.notifier).setMonthlySpendItemMap(spendTimePlaceList: spendTimePlaceList);
  }

  ///
  @override
  Future<void> getList({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final List<Map<String, dynamic>> maps = await db.query('spend_time_places');
    final spendTimePlaceList = List.generate(maps.length, (index) => SpendTimePlace.fromJson(maps[index]));
    await ref.read(spendTimePlaceProvider.notifier).setSpendTimePlaceList(spendTimePlaceList: spendTimePlaceList);
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    final db = await MoneyRepository.database();
    final spendTimePlace = param as SpendTimePlace;
    await db.insert('spend_time_places', spendTimePlace.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {}

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final spendTimePlace = param as SpendTimePlace;
    await db.delete('spend_time_places', where: 'date = ?', whereArgs: [spendTimePlace.date]);
    await ref.read(spendTimePlaceProvider.notifier).deleteSpendTimePlaceList(date: spendTimePlace.date);
  }
}
