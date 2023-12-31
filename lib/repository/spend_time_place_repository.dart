// ignore_for_file: avoid_catches_without_on_clauses, empty_catches

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../enums/get_monthly_stp_from.dart';
import '../enums/get_monthly_stp_usage.dart';
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
  Future<void> getMonthRecord({
    required String yearmonth,
    required WidgetRef ref,
    required GetMonthlyStpFrom from,
    required GetMonthlyStpUsage usage,
  }) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM spend_time_places WHERE date LIKE ? order by date, time;',
      ['$yearmonth%'],
    );

    final spendTimePlaceList = List.generate(maps.length, (index) => SpendTimePlace.fromJson(maps[index]));

    switch (from) {
      case GetMonthlyStpFrom.homeScreen:
        switch (usage) {
          case GetMonthlyStpUsage.sum:
            await ref
                .read(spendTimePlaceProvider.notifier)
                .setMonthlySpendItemSumMap(spendTimePlaceList: spendTimePlaceList);
            break;
          case GetMonthlyStpUsage.stpItemList:
            await ref
                .read(spendTimePlaceProvider.notifier)
                .setSpendTimePlaceList(spendTimePlaceList: spendTimePlaceList);
            break;
        }
        break;
      case GetMonthlyStpFrom.spendTimePlaceListAlert:
        switch (usage) {
          case GetMonthlyStpUsage.sum:
            break;
          case GetMonthlyStpUsage.stpItemList:
            await ref
                .read(spendTimePlaceProvider.notifier)
                .setSpendTimePlaceList(spendTimePlaceList: spendTimePlaceList);
            break;
        }
        break;
    }
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

    await db.transaction((txn) async {
      await txn.insert('spend_time_places', spendTimePlace.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });
  }

  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {}

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final spendTimePlace = param as SpendTimePlace;

    await db.transaction((txn) async {
      await txn.delete('spend_time_places', where: 'date = ?', whereArgs: [spendTimePlace.date]);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });

    await ref.read(spendTimePlaceProvider.notifier).deleteSpendTimePlaceList(date: spendTimePlace.date);
  }
}
