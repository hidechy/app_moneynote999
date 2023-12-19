import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

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
    await db.insert('incomes', income.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {
    // final db = await MoneyRepository.database();
    // final income = param as Income;
    // await db.update('incomes', income.toMap(), where: 'id = ?', whereArgs: [income.id]);
    // await ref.read(incomeProvider.notifier).updateIncomeList(income: income);
  }

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {
    // final db = await MoneyRepository.database();
    // final income = param as Income;
    // await db.delete('incomes', where: 'id = ?', whereArgs: [income.id]);
    // await ref.read(incomeProvider.notifier).deleteIncomeList(income: income);
  }

  ///
  Future<void> deleteByYearMonth({required Income income, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final exDate = income.date.split('-');
    final yearmonth = '${exDate[0]}-${exDate[1]}';
    await db.rawQuery('delete FROM incomes WHERE date LIKE ?;', ['$yearmonth%']);
  }
}
