import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../enums/get_single_money_from.dart';
import '../enums/get_single_money_when.dart';
import '../models/money.dart';
import '../state/money/money_notifier.dart';
import '_repository.dart';

// ignore: avoid_classes_with_only_static_members
class MoneyRepository implements Repository {
  static const _dbName = 'money_data.db';

  ///
  static Future<Database> database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE if not exists moneies('
          'id integer PRIMARY KEY,'
          'date TEXT,'
          'yen_10000 integer,'
          'yen_5000 integer,'
          'yen_2000 integer,'
          'yen_1000 integer,'
          'yen_500 integer,'
          'yen_100 integer,'
          'yen_50 integer,'
          'yen_10 integer,'
          'yen_5 integer,'
          'yen_1 integer'
          ')',
        );

        await db.execute(
          'CREATE TABLE if not exists bank_names('
          'id integer PRIMARY KEY,'
          'bank_number TEXT,'
          'bank_name TEXT,'
          'branch_number TEXT,'
          'branch_name TEXT,'
          'account_type TEXT,'
          'account_number TEXT,'
          'deposit_type TEXT'
          ')',
        );

        await db.execute(
          'CREATE TABLE if not exists emoney_names('
          'id integer PRIMARY KEY,'
          'deposit_type TEXT,'
          'emoney_name TEXT'
          ')',
        );

        await db.execute(
          'CREATE TABLE if not exists bank_prices('
          'id integer PRIMARY KEY,'
          'deposit_type TEXT,'
          'date TEXT,'
          'bank_id integer,'
          'price integer'
          ')',
        );

        await db.execute(
          'CREATE TABLE if not exists spend_time_places('
          'id integer PRIMARY KEY,'
          'date TEXT,'
          'spend_type TEXT,'
          'time TEXT,'
          'place TEXT,'
          'price integer'
          ')',
        );

        await db.execute(
          'CREATE TABLE if not exists incomes('
          'id integer PRIMARY KEY,'
          'date TEXT,'
          'source_name TEXT,'
          'price integer'
          ')',
        );
      },
      version: 1,
    );

    return database;
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    final db = await database();
    final money = param as Money;
    await db.insert('moneies', money.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {
    final db = await database();
    final money = param as Money;
    await db.update('moneies', money.toMap(), where: 'id = ?', whereArgs: [money.id]);
    await ref.read(moneySingleProvider.notifier).setMoney(money: money);
  }

  ///
  Future<void> getSingle(
      {required String date,
      required WidgetRef ref,
      required GetSingleMoneyFrom from,
      required GetSingleMoneyWhen when}) async {
    final db = await database();

    final List<Map<String, dynamic>> maps = await db.query('moneies', where: 'date = ?', whereArgs: [date]);

    if (maps.isNotEmpty) {
      final money = Money.fromJson(maps[0]);

      switch (from) {
        case GetSingleMoneyFrom.dailyMoneyDisplayAlert:
          switch (when) {
            case GetSingleMoneyWhen.today:
              await ref.read(moneySingleProvider.notifier).setMoney(money: money);
              break;
            case GetSingleMoneyWhen.yesterday:
              await ref.read(moneySingleProvider.notifier).setBeforeDateMoneyForSum(money: money);
              break;
          }
          break;

        case GetSingleMoneyFrom.moneyInputAlert:
          switch (when) {
            case GetSingleMoneyWhen.today:
              break;
            case GetSingleMoneyWhen.yesterday:
              await ref.read(moneySingleProvider.notifier).setBeforeDateMoney(money: money);
              break;
          }
          break;
      }
    }
  }

  ///
  @override
  Future<void> getList({required WidgetRef ref}) async {}

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {}
}
