// ignore_for_file: avoid_catches_without_on_clauses, empty_catches

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../models/emoney_name.dart';
import '../state/emoney_names/emoney_names_notifier.dart';
import '_repository.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class EmoneyNameRepository implements Repository {
  ///
  @override
  Future<void> getList({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('emoney_names');

    final emoneyNameList = List.generate(maps.length, (index) => EmoneyName.fromJson(maps[index]));
    await ref.read(emoneyNamesProvider.notifier).setEmoneyNameList(emoneyNameList: emoneyNameList);
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    final db = await MoneyRepository.database();
    final emoneyName = param as EmoneyName;

    await db.transaction((txn) async {
      await txn.insert('emoney_names', emoneyName.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final emoneyName = param as EmoneyName;

    await db.transaction((txn) async {
      await txn.update('emoney_names', emoneyName.toMap(), where: 'id = ?', whereArgs: [emoneyName.id]);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });

    await ref.read(emoneyNamesProvider.notifier).updateEmoneyNameList(emoneyName: emoneyName);
  }

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    final emoneyName = param as EmoneyName;

    await db.transaction((txn) async {
      await txn.delete('emoney_names', where: 'id = ?', whereArgs: [emoneyName.id]);

      try {
        await txn.batch().commit(continueOnError: true);
      } catch (e) {}
    });

    await ref.read(emoneyNamesProvider.notifier).deleteEmoneyNameList(emoneyName: emoneyName);
  }
}
