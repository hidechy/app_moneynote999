import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:money_note/models/emoney_name.dart';

import 'emoney_names_setting_response_state.dart';

final emoneyNamesSettingProvider =
    StateNotifierProvider.autoDispose<EmoneyNamesSettingNotifier, EmoneyNamesSettingResponseState>((ref) {
  return EmoneyNamesSettingNotifier(const EmoneyNamesSettingResponseState());
});

class EmoneyNamesSettingNotifier extends StateNotifier<EmoneyNamesSettingResponseState> {
  EmoneyNamesSettingNotifier(super.state);

  ///
  Future<void> setEmoneyNameList({required List<EmoneyName> emoneyNameList}) async =>
      state = state.copyWith(emoneyNameList: AsyncValue.data(emoneyNameList));

  ///
  Future<void> updateEmoneyNameList({required EmoneyName emoneyName}) async {
    final emoneyNameList = state.emoneyNameList.value!;

    final index = emoneyNameList.indexWhere((en) => en.id == emoneyName.id);

    if (index != -1) {
      emoneyNameList[index] = emoneyName;
    }

    state = state.copyWith(emoneyNameList: AsyncValue.data(emoneyNameList));
  }

  ///
  Future<void> deleteEmoneyNameList({required EmoneyName emoneyName}) async {
    final emoneyNameList = state.emoneyNameList.value!;

    final index = emoneyNameList.indexWhere((en) => en.id == emoneyName.id);

    emoneyNameList.removeAt(index);

    state = state.copyWith(emoneyNameList: AsyncValue.data(emoneyNameList));
  }
}
