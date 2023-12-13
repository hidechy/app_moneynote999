import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/bank_name.dart';
import '../../models/bank_price.dart';
import '../../repository/bank_price_repository.dart';
import 'parts/error_dialog.dart';

class BankPriceInputAlert extends ConsumerStatefulWidget {
  const BankPriceInputAlert({super.key, required this.date, required this.bankName});

  final DateTime date;
  final BankName bankName;

  @override
  ConsumerState<BankPriceInputAlert> createState() => _BankPriceInputAlertState();
}

class _BankPriceInputAlertState extends ConsumerState<BankPriceInputAlert> {
  TextEditingController bankPriceEditingController = TextEditingController();

  late List<int> yearOption;

  List<int> monthOption = List.generate(12, (index) => index + 1);

  late List<int>? dayOption;

  DateTime? selectedDate;

  late BuildContext _context;

  ///
  @override
  Widget build(BuildContext context) {
    _context = context;

    final now = widget.date;

    yearOption = [now.year, now.year + 1];

    dayOption = List.generate(31, (index) => index + 1);

    selectedDate = now;

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

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.bankName.bankName} ${widget.bankName.branchName}'),
                        Text('${widget.bankName.accountType} ${widget.bankName.accountNumber}'),
                      ],
                    ),
                  ),
                  Container(),
                ],
              ),

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
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 35,
                              onSelectedItemChanged: (int index) {
                                selectedDate = DateTime(yearOption[index], selectedDate!.month, selectedDate!.day);
                              },
                              scrollController:
                                  FixedExtentScrollController(initialItem: yearOption.indexOf(selectedDate!.year)),
                              children: yearOption.map((e) {
                                return Container(
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Text(
                                    e.toString(),
                                    style: GoogleFonts.kiwiMaru(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 35,
                              onSelectedItemChanged: (int index) {
                                selectedDate = DateTime(selectedDate!.year, monthOption[index], selectedDate!.day);
                              },
                              scrollController:
                                  FixedExtentScrollController(initialItem: monthOption.indexOf(selectedDate!.month)),
                              children: monthOption.map((e) {
                                return Container(
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Text(
                                    e.toString().padLeft(2, '0'),
                                    style: GoogleFonts.kiwiMaru(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 35,
                              onSelectedItemChanged: (int index) {
                                selectedDate = DateTime(selectedDate!.year, selectedDate!.month, dayOption![index]);
                              },
                              scrollController:
                                  FixedExtentScrollController(initialItem: dayOption!.indexOf(selectedDate!.day)),
                              children: dayOption!.map((e) {
                                return Container(
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Text(
                                    e.toString().padLeft(2, '0'),
                                    style: GoogleFonts.kiwiMaru(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: bankPriceEditingController,
                      decoration: const InputDecoration(labelText: '金額'),
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    )
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  TextButton(
                    onPressed: _insertBankMoney,
                    child: const Text('金額を入力する'),
                  ),
                ],
              ),

              // ///
              //
              // IconButton(
              //   onPressed: _setDummyBank,
              //   icon: const Icon(Icons.ac_unit),
              // ),
              //
              // ///
              //
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              //   decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Expanded(
              //             child: TextField(
              //               keyboardType: TextInputType.number,
              //               controller: bankNumberEditingController,
              //               decoration: const InputDecoration(labelText: '金融機関番号'),
              //               style: const TextStyle(fontSize: 13, color: Colors.white),
              //             ),
              //           ),
              //           const SizedBox(width: 10),
              //           Expanded(
              //             flex: 2,
              //             child: TextField(
              //               keyboardType: TextInputType.number,
              //               controller: bankNameEditingController,
              //               decoration: const InputDecoration(labelText: '金融機関名'),
              //               style: const TextStyle(fontSize: 13, color: Colors.white),
              //             ),
              //           )
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: TextField(
              //               keyboardType: TextInputType.number,
              //               controller: branchNumberEditingController,
              //               decoration: const InputDecoration(labelText: '支店番号'),
              //               style: const TextStyle(fontSize: 13, color: Colors.white),
              //             ),
              //           ),
              //           const SizedBox(width: 10),
              //           Expanded(
              //             flex: 2,
              //             child: TextField(
              //               keyboardType: TextInputType.number,
              //               controller: branchNameEditingController,
              //               decoration: const InputDecoration(labelText: '支店名'),
              //               style: const TextStyle(fontSize: 13, color: Colors.white),
              //             ),
              //           )
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: DropdownButton(
              //               dropdownColor: Colors.pinkAccent.withOpacity(0.1),
              //               iconEnabledColor: Colors.white,
              //               items: AccountType.values.map((e) {
              //                 return DropdownMenuItem(
              //                   value: e,
              //                   child: Text(e.japanName, style: const TextStyle(fontSize: 12)),
              //                 );
              //               }).toList(),
              //               value: (selectedAccountType != AccountType.blank)
              //                   ? selectedAccountType
              //                   : bankNamesSettingState.accountType,
              //               onChanged: (value) {
              //                 ref.read(bankNamesSettingProvider.notifier).setAccountType(accountType: value!);
              //               },
              //             ),
              //           ),
              //           const SizedBox(width: 10),
              //           Expanded(
              //             flex: 2,
              //             child: TextField(
              //               keyboardType: TextInputType.number,
              //               controller: accountNumberEditingController,
              //               decoration: const InputDecoration(labelText: '口座番号'),
              //               style: const TextStyle(fontSize: 13, color: Colors.white),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(),
              //     (widget.bankName != null)
              //         ? Column(
              //       children: [
              //         GestureDetector(
              //           onTap: _updateBankName,
              //           child: Text(
              //             '金融機関を更新する',
              //             style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary),
              //           ),
              //         ),
              //         const SizedBox(height: 10),
              //         GestureDetector(
              //           onTap: _deleteBankName,
              //           child: Text('金融機関を削除する',
              //               style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary)),
              //         ),
              //       ],
              //     )
              //         : TextButton(
              //       onPressed: _inputBankName,
              //       child: const Text('金融機関を追加する', style: TextStyle(fontSize: 12)),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  Future<void> _insertBankMoney() async {
    if (bankPriceEditingController.text == '') {
      Future.delayed(
        Duration.zero,
        () => error_dialog(context: _context, title: '不完全データあり', content: '入力値に不備があります。'),
      );

      return;
    }

    final bankPrice = BankPrice(
      date: selectedDate!.yyyymmdd,
      depositType: widget.bankName.depositType,
      bankId: widget.bankName.id!,
      price: bankPriceEditingController.text.toInt(),
    );

    await BankPriceRepository.insertBankPrice(bankPrice: bankPrice).then((value) {
      Navigator.pop(context);
    });
  }
}
