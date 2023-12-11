import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/emoney_name.dart';
import '../../repository/emoney_name_repository.dart';

// ignore: must_be_immutable
class EmoneyNameInputAlert extends ConsumerWidget {
  EmoneyNameInputAlert({super.key});

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
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: setDummyData,
                  child: const Text('dummy'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _inputEmoneyName() async {
    final emoneyName = EmoneyName(emoneyName: emoneyNameEditingController.text);

    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName).then((value) {
      Navigator.pop(_context);
    });
  }

  ///
  void setDummyData() {
//    emoneyNameEditingController.text = 'Suica1';
//    emoneyNameEditingController.text = 'PayPay';
//    emoneyNameEditingController.text = 'PASMO';
//    emoneyNameEditingController.text = 'Suica2';
    emoneyNameEditingController.text = 'メルカリ';
  }
}
