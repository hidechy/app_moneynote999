import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/state/emoney_names_setting/emoney_names_setting_notifier.dart';
import 'package:sqflite/sqflite.dart';

import '../models/emoney_name.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class EmoneyNameRepository {
  ///
  static Future<void> getEmoneyNames({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('emoney_names');

    final emoneyNameList = List.generate(maps.length, (index) {
      return EmoneyName(
        id: maps[index]['id'] as int,
        emoneyName: maps[index]['emoney_name'] as String,
        depositType: maps[index]['deposit_type'] as String,
      );
    });

    await ref.read(emoneyNamesSettingProvider.notifier).setEmoneyNameList(emoneyNameList: emoneyNameList);
  }

  ///
  static Future<void> insertEmoneyName({required EmoneyName emoneyName}) async {
    final db = await MoneyRepository.database();
    await db.insert('emoney_names', emoneyName.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  static Future<void> updateEmoneyName({required EmoneyName emoneyName, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    await db.update('emoney_names', emoneyName.toMap(), where: 'id = ?', whereArgs: [emoneyName.id]);
    await ref.read(emoneyNamesSettingProvider.notifier).updateEmoneyNameList(emoneyName: emoneyName);
  }

  ///
  static Future<void> deleteEmoneyName({required EmoneyName emoneyName, required WidgetRef ref}) async {
    final db = await MoneyRepository.database();
    await db.delete('emoney_names', where: 'id = ?', whereArgs: [emoneyName.id]);
    await ref.read(emoneyNamesSettingProvider.notifier).deleteEmoneyNameList(emoneyName: emoneyName);
  }
}