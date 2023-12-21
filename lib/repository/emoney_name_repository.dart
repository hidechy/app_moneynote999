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
    try {
      final db = await MoneyRepository.database();
      final List<Map<String, dynamic>> maps = await db.query('emoney_names');
      final emoneyNameList = List.generate(maps.length, (index) => EmoneyName.fromJson(maps[index]));
      await ref.read(emoneyNamesProvider.notifier).setEmoneyNameList(emoneyNameList: emoneyNameList);
    } catch (e) {}
  }

  ///
  @override
  Future<void> insert({required dynamic param}) async {
    try {
      final db = await MoneyRepository.database();
      final emoneyName = param as EmoneyName;
      await db.insert('emoney_names', emoneyName.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {}
  }

  ///
  @override
  Future<void> update({required dynamic param, required WidgetRef ref}) async {
    try {
      final db = await MoneyRepository.database();
      final emoneyName = param as EmoneyName;
      await db.update('emoney_names', emoneyName.toMap(), where: 'id = ?', whereArgs: [emoneyName.id]);
      await ref.read(emoneyNamesProvider.notifier).updateEmoneyNameList(emoneyName: emoneyName);
    } catch (e) {}
  }

  ///
  @override
  Future<void> delete({required dynamic param, required WidgetRef ref}) async {
    try {
      final db = await MoneyRepository.database();
      final emoneyName = param as EmoneyName;
      await db.delete('emoney_names', where: 'id = ?', whereArgs: [emoneyName.id]);
      await ref.read(emoneyNamesProvider.notifier).deleteEmoneyNameList(emoneyName: emoneyName);
    } catch (e) {}
  }
}
