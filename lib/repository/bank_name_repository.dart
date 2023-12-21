import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/bank_name.dart';
import '../state/bank_names/bank_names_notifier.dart';
import '_repository.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class BankNameRepository implements Repository {
  ///
  @override
  Future<void> getList({required WidgetRef ref}) async {
    try {
      final db = await MoneyRepository.database();
      final List<Map<String, dynamic>> maps = await db.query('bank_names');
      final bankNameList = List.generate(maps.length, (index) => BankName.fromJson(maps[index]));
      await ref.read(bankNamesProvider.notifier).setBankNameList(bankNameList: bankNameList);
    } catch (e) {}
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    try {
      final db = await MoneyRepository.database();
      final bankName = param as BankName;
      await db.insert('bank_names', bankName.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {}
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {
    try {
      final db = await MoneyRepository.database();
      final bankName = param as BankName;
      await db.update('bank_names', bankName.toMap(), where: 'id = ?', whereArgs: [bankName.id]);
      await ref.read(bankNamesProvider.notifier).updateBankNameList(bankName: bankName);
    } catch (e) {}
  }

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {
    try {
      final db = await MoneyRepository.database();
      final bankName = param as BankName;
      await db.delete('bank_names', where: 'id = ?', whereArgs: [bankName.id]);
      await ref.read(bankNamesProvider.notifier).deleteBankNameList(bankName: bankName);
    } catch (e) {}
  }
}
