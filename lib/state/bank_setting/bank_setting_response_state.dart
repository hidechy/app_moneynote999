import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_setting_response_state.freezed.dart';

@freezed
class BankSettingResponseState with _$BankSettingResponseState {
  const factory BankSettingResponseState({
    @Default(3) int addBankNum,
  }) = _BankSettingResponseState;
}
