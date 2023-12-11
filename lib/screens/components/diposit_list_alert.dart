import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/diposit_type.dart';
import '../../extensions/extensions.dart';
import '../../repository/bank_name_repository.dart';
import '../../repository/emoney_name_repository.dart';
import '../../state/bank_names_setting/bank_names_setting_notifier.dart';
import '../../state/emoney_names_setting/emoney_names_setting_notifier.dart';
import '_money_dialog.dart';
import 'bank_name_input_alert.dart';
import 'emoney_name_input_alert.dart';

// ignore: must_be_immutable
class DipositListAlert extends ConsumerWidget {
  DipositListAlert({super.key});

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => BankNameRepository.getBankNames(ref: ref));
    Future(() => EmoneyNameRepository.getEmoneyNames(ref: ref));

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              const Text('銀行口座'),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: () =>
                        MoneyDialog(context: context, widget: BankNameInputAlert(dipositType: DipositType.bank)),
                    child: const Text('銀行口座を追加する', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              SizedBox(height: context.screenSize.height * 0.35, child: _displayBankList()),
              const SizedBox(height: 20),
              Container(width: context.screenSize.width),
              const Text('電子マネー'),
              Divider(color: Colors.white.withOpacity(0.4), thickness: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: () => MoneyDialog(context: context, widget: EmoneyNameInputAlert()),
                    child: const Text('電子マネーを追加する', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              SizedBox(
                height: context.screenSize.height * 0.25,
                child: _displayEmoneyList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _displayBankList() {
    return _ref.watch(bankNamesSettingProvider.select((value) => value.bankNameList)).when(
          data: (value) {
            final list = <Widget>[];

            value.forEach((element) {
              list.add(
                Container(
                  width: _context.screenSize.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${element.depositType}-${element.id}: ${element.bankName} (${element.bankNumber}) '),
                      Text('${element.branchName} (${element.branchNumber})'),
                      Text('${element.accountType} ${element.accountNumber}'),
                    ],
                  ),
                ),
              );
            });

            return SingleChildScrollView(child: Column(children: list));
          },
          error: (error, stackTrace) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }

  ///
  Widget _displayEmoneyList() {
    return _ref.watch(emoneyNamesSettingProvider.select((value) => value.emoneyNameList)).when(
          data: (value) {
            final list = <Widget>[];

            value.forEach((element) {
              list.add(
                Container(
                  width: _context.screenSize.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white.withOpacity(0.4))),
                  child: Text('${element.depositType}-${element.id}: ${element.emoneyName}'),
                ),
              );
            });

            return SingleChildScrollView(child: Column(children: list));
          },
          error: (error, stackTrace) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
