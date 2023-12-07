import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/bank_name.dart';

part 'bank_names_response_state.freezed.dart';

@freezed
class BankNamesResponseState with _$BankNamesResponseState {
  const factory BankNamesResponseState({
    @Default(3) int addBankNum,
    @Default(AsyncValue<List<BankName>>.loading()) AsyncValue<List<BankName>> bankNameList,
    @Default([]) List<bool> checkBoxes,
    @Default([]) List<String> accountTypes,
    @Default([]) List<String> depositTypes,
  }) = _BankNamesResponseState;
}
