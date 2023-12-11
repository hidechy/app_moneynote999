import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../enums/account_type.dart';
import '../../models/bank_name.dart';

part 'bank_names_setting_response_state.freezed.dart';

@freezed
class BankNamesSettingResponseState with _$BankNamesSettingResponseState {
  const factory BankNamesSettingResponseState({
    @Default(AccountType.blank) AccountType accountType,
    @Default(AsyncValue<List<BankName>>.loading()) AsyncValue<List<BankName>> bankNameList,
  }) = _BankNamesSettingResponseState;
}
