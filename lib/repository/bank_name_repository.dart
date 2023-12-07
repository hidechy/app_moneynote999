import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/bank_name.dart';
import '../state/bank_names_setting/bank_names_setting_notifier.dart';
import 'money_repository.dart';

// ignore: avoid_classes_with_only_static_members
class BankNameRepository {
  ///
  static Future<void> getBankNames({required WidgetRef ref}) async {
    final db = await MoneyRepository.database();

    final List<Map<String, dynamic>> maps = await db.query('bank_names');

    final bankNameList = List.generate(maps.length, (index) {
      return BankName(
        id: maps[index]['id'] as int,
        bankNumber: maps[index]['bank_number'] as String,
        bankName: maps[index]['bank_name'] as String,
        branchNumber: maps[index]['branch_number'] as String,
        branchName: maps[index]['branch_name'] as String,
        accountType: maps[index]['account_type'] as String,
        accountNumber: maps[index]['account_number'] as String,
        depositType: maps[index]['deposit_type'] as String,
      );
    });

    await ref.read(bankNamesSettingProvider.notifier).setBankNameList(bankNameList: bankNameList);
  }
}
