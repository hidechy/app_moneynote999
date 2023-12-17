import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../enums/get_single_money_from.dart';
import '../enums/get_single_money_when.dart';
import '../models/money.dart';
import '../state/money/money_notifier.dart';

// ignore: avoid_classes_with_only_static_members
class MoneyRepository {
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
          'CREATE TABLE if not exists bank_price('
          'id integer PRIMARY KEY,'
          'deposit_type TEXT,'
          'date TEXT,'
          'bank_id integer,'
          'price integer'
          ')',
        );

        // await db.execute(
        //   'CREATE TABLE if not exists spend('
        //   'id integer PRIMARY KEY,'
        //   'date TEXT,'
        //   'spend_type TEXT,'
        //   'price TEXT'
        //   ')',
        // );
        //
        // await db.execute(
        //   'CREATE TABLE if not exists time_place(id integer PRIMARY KEY, date TEXT, time TEXT, place TEXT, price integer)',
        // );
        //
        //
        //




        await db.execute(
          'CREATE TABLE if not exists incomes('
          'id integer PRIMARY KEY,'
          'date TEXT,'
          'source_name TEXT,'
          'price integer'
          ')',
        );

        await db.execute(
          'CREATE TABLE if not exists spend_time_place('
          'id integer PRIMARY KEY,'
          'date TEXT,'
          'spend_type TEXT,'
          'time TEXT,'
          'place TEXT,'
          'price integer'
          ')',
        );
      },
      version: 1,
    );

    return database;
  }

  ///
  static Future<void> insertMoney({required Money money}) async {
    final db = await database();
    await db.insert('moneies', money.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  static Future<void> getSingleMoney(
      {required String date,
      required WidgetRef ref,
      required GetSingleMoneyFrom from,
      required GetSingleMoneyWhen when}) async {
    final db = await database();

    final List<Map<String, dynamic>> maps = await db.query('moneies', where: 'date = ?', whereArgs: [date]);

    if (maps.isNotEmpty) {
      final money = Money(
        id: maps[0]['id'],
        date: date,
        yen_10000: maps[0]['yen_10000'],
        yen_5000: maps[0]['yen_5000'],
        yen_2000: maps[0]['yen_2000'],
        yen_1000: maps[0]['yen_1000'],
        yen_500: maps[0]['yen_500'],
        yen_100: maps[0]['yen_100'],
        yen_50: maps[0]['yen_50'],
        yen_10: maps[0]['yen_10'],
        yen_5: maps[0]['yen_5'],
        yen_1: maps[0]['yen_1'],
      );

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
  static Future<void> updateMoney({required Money money, required WidgetRef ref}) async {
    final db = await database();
    await db.update('moneies', money.toMap(), where: 'id = ?', whereArgs: [money.id]);
    await ref.read(moneySingleProvider.notifier).setMoney(money: money);
  }
}
