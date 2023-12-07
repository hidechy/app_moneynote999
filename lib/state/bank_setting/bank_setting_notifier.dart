import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bank_setting_response_state.dart';

final bankSettingProvider = StateNotifierProvider.autoDispose<BankSettingNotifier, BankSettingResponseState>((ref) {
  return BankSettingNotifier(const BankSettingResponseState());
});

class BankSettingNotifier extends StateNotifier<BankSettingResponseState> {
  BankSettingNotifier(super.state);

  ///
  Future<void> setBankNum({required int num}) async => state = state.copyWith(addBankNum: num);
}
