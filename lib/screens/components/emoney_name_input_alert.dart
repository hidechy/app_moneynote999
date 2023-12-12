import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/extensions/extensions.dart';
import 'package:money_note/screens/components/parts/error_dialog.dart';

import '../../enums/deposit_type.dart';
import '../../models/emoney_name.dart';
import '../../repository/emoney_name_repository.dart';

// ignore: must_be_immutable
class EmoneyNameInputAlert extends ConsumerStatefulWidget {
  EmoneyNameInputAlert({super.key, required this.depositType, this.emoneyName});

  final DepositType depositType;
  EmoneyName? emoneyName;

  @override
  ConsumerState<EmoneyNameInputAlert> createState() => _EmoneyNameInputAlertState();
}

class _EmoneyNameInputAlertState extends ConsumerState<EmoneyNameInputAlert> {
  TextEditingController emoneyNameEditingController = TextEditingController();

  late BuildContext _context;

  ///
  @override
  void initState() {
    super.initState();

    if (widget.emoneyName != null) {
      emoneyNameEditingController.text = widget.emoneyName!.emoneyName;
    }
  }

  ///
  @override
  Widget build(BuildContext context) {
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
          style: GoogleFonts.kiwiMaru(fontSize: 12),
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
                  (widget.emoneyName != null)
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: _updateEmoneyName,
                              child: Text('電子マネーを更新する',
                                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary)),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: _deleteEmoneyName,
                              child: Text('電子マネーを削除する',
                                  style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary)),
                            ),
                          ],
                        )
                      : TextButton(
                          onPressed: _inputEmoneyName,
                          child: const Text('電子マネーを追加する', style: TextStyle(fontSize: 12)),
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
      depositType: widget.depositType.japanName,
    );

    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName).then((value) {
      emoneyNameEditingController.clear();

      Navigator.pop(_context);
    });
  }

  ///
  Future<void> _updateEmoneyName() async {
    await EmoneyNameRepository.updateEmoneyName(
      emoneyName: EmoneyName(
        id: widget.emoneyName!.id,
        emoneyName: emoneyNameEditingController.text,
        depositType: widget.depositType.japanName,
      ),
      ref: ref,
    ).then((value) {
      emoneyNameEditingController.clear();

      Navigator.pop(_context);
    });
  }

  ///
  void _deleteEmoneyName() {
    EmoneyNameRepository.deleteEmoneyName(emoneyName: widget.emoneyName!, ref: ref).then((value) {
      Navigator.pop(_context);
    });
  }

  ///
  Future<void> _setDummyEmoney() async {
    final emoneyName1 = EmoneyName(emoneyName: 'Suica1', depositType: widget.depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName1);

    final emoneyName2 = EmoneyName(emoneyName: 'PayPay', depositType: widget.depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName2);

    final emoneyName3 = EmoneyName(emoneyName: 'PASMO', depositType: widget.depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName3);

    final emoneyName4 = EmoneyName(emoneyName: 'Suica2', depositType: widget.depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName4);

    final emoneyName5 = EmoneyName(emoneyName: 'メルカリ', depositType: widget.depositType.japanName);
    await EmoneyNameRepository.insertEmoneyName(emoneyName: emoneyName5);

    // ignore: use_build_context_synchronously
    Navigator.pop(_context);
  }
}
