import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/emoney_name.dart';

part 'emoney_names_response_state.freezed.dart';

@freezed
class EmoneyNamesResponseState with _$EmoneyNamesResponseState {
  const factory EmoneyNamesResponseState({
    @Default(AsyncValue<List<EmoneyName>>.loading()) AsyncValue<List<EmoneyName>> emoneyNameList,
  }) = _EmoneyNamesResponseState;
}
