import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/emoney_name.dart';

part 'emoney_names_setting_response_state.freezed.dart';

@freezed
class EmoneyNamesSettingResponseState with _$EmoneyNamesSettingResponseState {
  const factory EmoneyNamesSettingResponseState({
    @Default(AsyncValue<List<EmoneyName>>.loading()) AsyncValue<List<EmoneyName>> emoneyNameList,
  }) = _EmoneyNamesSettingResponseState;
}
