import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/account_type.dart';
import '../../models/bank_name.dart';

part 'bank_names_response_state.freezed.dart';

@freezed
class BankNamesResponseState with _$BankNamesResponseState {
  const factory BankNamesResponseState({
    @Default(AccountType.blank) AccountType accountType,
    @Default(AsyncValue<List<BankName>>.loading()) AsyncValue<List<BankName>> bankNameList,
  }) = _BankNamesResponseState;
}
