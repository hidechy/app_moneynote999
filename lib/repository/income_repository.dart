// ignore_for_file: avoid_catches_without_on_clauses, empty_catches

import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../extensions/extensions.dart';
import '../models/income.dart';
import '../state/incomes/incomes_notifier.dart';
import '_repository.dart';
import 'money_repository.dart';

class IncomeRepository implements Repository {
  ///
  @override
  Future<void> getList({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('incomes');

    final incomeList = List.generate(maps.length, (index) => Income.fromJson(maps[index]));
    await ref.read(incomeProvider.notifier).setIncomeList(incomeList: incomeList);
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    final db = await MoneyRepository.database();
    final income = param as Income;

    await db.transaction((txn) async {
      await txn.insert('incomes', income.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {}

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {}

  ///
  Future<void> deleteByYearMonth({required Income income, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final exDate = income.date.split('-');
    final yearmonth = '${exDate[0]}-${exDate[1]}';

    await db.transaction((txn) async {
      await txn.rawQuery('delete FROM incomes WHERE date LIKE ?;', ['$yearmonth%']);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });
  }

  ///
  Future<void> selectByYear({required String year, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM incomes WHERE date LIKE ?;', ['$year%']);

    final incomeList = List.generate(maps.length, (index) => Income.fromJson(maps[index]));
    await ref.read(incomeProvider.notifier).setIncomeList(incomeList: incomeList);
  }

  Future<void> getIncomeMinYear({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('incomes');

    final incomeList = List.generate(maps.length, (index) => Income.fromJson(maps[index]));
    final yearList = <int>[];
    incomeList.forEach((element) => yearList.add(element.date.split('-')[0].toInt()));
    final minValue = yearList.reduce(min);
    await ref.read(incomeProvider.notifier).setIncomeMinYear(year: minValue);
  }
}
