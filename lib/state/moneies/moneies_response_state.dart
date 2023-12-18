import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/money.dart';

part 'moneies_response_state.freezed.dart';

@freezed
class MoneiesResponseState with _$MoneiesResponseState {
  const factory MoneiesResponseState({
    Money? singleMoney,
    Money? beforeDateMoney,
    Money? beforeDateMoneyForSum,
  }) = _MoneiesResponseState;
}
