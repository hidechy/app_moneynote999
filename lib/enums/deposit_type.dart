enum DepositType { bank, emoney }

extension on DepositType {
  // ignore: unused_element
  String? get value {
    switch (this) {
      case DepositType.bank:
        return '銀行';
      case DepositType.emoney:
        return '電子マネー';
    }
  }
}
