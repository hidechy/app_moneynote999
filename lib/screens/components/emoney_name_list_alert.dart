import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/deposit_type.dart';
import '../../extensions/extensions.dart';
import '../../repository/emoney_name_repository.dart';
import '../../state/emoney_names_setting/emoney_names_setting_notifier.dart';
import '_money_dialog.dart';
import 'emoney_name_input_alert.dart';

// ignore: must_be_immutable
class EmoneyNameListAlert extends ConsumerWidget {
  EmoneyNameListAlert({super.key});

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

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
              Container(width: context.screenSize.width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: () =>
                        MoneyDialog(context: context, widget: EmoneyNameInputAlert(depositType: DepositType.emoney)),
                    child: const Text('電子マネーを追加する', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              Expanded(child: _displayEmoneyList()),
            ],
          ),
        ),
      ),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text('${element.depositType}-${element.id}: ${element.emoneyName}'),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              MoneyDialog(
                                context: _context,
                                widget: EmoneyNameInputAlert(depositType: DepositType.emoney, emoneyName: element),
                              );
                            },
                            child: Icon(Icons.edit, size: 16, color: Colors.white.withOpacity(0.4)),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              EmoneyNameRepository.deleteEmoneyName(emoneyName: element, ref: _ref);
                            },
                            child: Icon(Icons.delete, size: 16, color: Colors.white.withOpacity(0.4)),
                          ),
                        ],
                      ),
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
}
