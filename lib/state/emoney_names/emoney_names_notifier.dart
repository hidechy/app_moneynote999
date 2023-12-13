import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/emoney_name.dart';

import 'emoney_names_response_state.dart';

final emoneyNamesProvider =
    StateNotifierProvider.autoDispose<EmoneyNamesSettingNotifier, EmoneyNamesResponseState>((ref) {
  return EmoneyNamesSettingNotifier(const EmoneyNamesResponseState());
});

class EmoneyNamesSettingNotifier extends StateNotifier<EmoneyNamesResponseState> {
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
