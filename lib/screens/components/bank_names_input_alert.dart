import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';

import '../../enums/account_type.dart';

// ignore: must_be_immutable
class BankNamesInputAlert extends ConsumerWidget {
  BankNamesInputAlert({super.key});

  TextEditingController bankNumberEditingController = TextEditingController();
  TextEditingController bankNameEditingController = TextEditingController();
  TextEditingController branchNumberEditingController = TextEditingController();
  TextEditingController branchNameEditingController = TextEditingController();
  TextEditingController accountNumberEditingController = TextEditingController();

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const Text('BankNamesInputAlert'),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Container(),
                        // Row(
                        //   children: [
                        //     const Text('変更'),
                        //     Checkbox(
                        //       value:
                        //           // ignore: avoid_bool_literals_in_conditional_expressions
                        //           (bankNamesSettingState.checkBoxes.isNotEmpty) ? bankNamesSettingState.checkBoxes[i] : false,
                        //       onChanged: (value) {
                        //         ref.read(bankNamesSettingProvider.notifier).setCheckBoxType(pos: i, value: value!);
                        //       },
                        //       checkColor: Colors.white.withOpacity(0.6),
                        //       activeColor: Colors.black.withOpacity(0.6),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: bankNumberEditingController,
                            decoration: const InputDecoration(labelText: '銀行番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: bankNameEditingController,
                            decoration: const InputDecoration(labelText: '銀行名'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: branchNumberEditingController,
                            decoration: const InputDecoration(labelText: '支店番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: branchNameEditingController,
                            decoration: const InputDecoration(labelText: '支店名'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton(
                            dropdownColor: Colors.pinkAccent.withOpacity(0.1),
                            iconEnabledColor: Colors.white,
                            items: AccountType.values.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e.japanName, style: const TextStyle(fontSize: 12)),
                              );
                            }).toList(),
                            // value: (bankNamesSettingState.accountTypes.isNotEmpty)
                            //     ? bankNamesSettingState.accountTypes[i]
                            //     : AccountType.blank,
                            // onChanged: (value) async {
                            //   await ref.read(bankNamesSettingProvider.notifier).setAccountType(pos: i, accountType: value!);
                            // },
                            //
                            //

                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: accountNumberEditingController,
                            decoration: const InputDecoration(labelText: '口座番号'),
                            style: const TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
