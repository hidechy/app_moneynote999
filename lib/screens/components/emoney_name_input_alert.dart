import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/deposit_type.dart';
import '../../extensions/extensions.dart';
import '../../models/emoney_name.dart';
import '../../repository/emoney_name_repository.dart';
import 'parts/error_dialog.dart';

// ignore: must_be_immutable
class EmoneyNameInputAlert extends ConsumerWidget {
  EmoneyNameInputAlert({super.key, required this.depositType});

  final DepositType depositType;

  TextEditingController emoneyNameEditingController = TextEditingController();

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

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
              const Text('電子マネー追加'),
              Divider(
                color: Colors.white.withOpacity(0.4),
                thickness: 5,
              ),

              ///

              IconButton(
                onPressed: _setDummyEmoney,
                icon: const Icon(Icons.ac_unit),
              ),

              ///

              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: emoneyNameEditingController,
                      decoration: const InputDecoration(labelText: '電子マネー名称'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: _inputEmoneyName,
                    child: const Text(
                      '電子マネーを追加する',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _inputEmoneyName() async {
    if (emoneyNameEditingController.text == '') {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '不完全データあり', content: '入力値に不備があります。'),
      );

      return;
    }

    final emoneyName = EmoneyName(
      emoneyName: emoneyNameEditingController.text,
      depositType: depositType.japanName,
    );

    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName).then((value) {
      Navigator.pop(_context);
    });
  }

  ///
  Future<void> _setDummyEmoney() async {
    final emoneyName1 = EmoneyName(emoneyName: 'Suica1', depositType: depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName1);

    final emoneyName2 = EmoneyName(emoneyName: 'PayPay', depositType: depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName2);

    final emoneyName3 = EmoneyName(emoneyName: 'PASMO', depositType: depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName3);

    final emoneyName4 = EmoneyName(emoneyName: 'Suica2', depositType: depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName4);

    final emoneyName5 = EmoneyName(emoneyName: 'メルカリ', depositType: depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName5);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
