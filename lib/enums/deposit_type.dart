enum DepositType { blank, bank, emoney }

extension DepositTypeExtension on DepositType {
  // ignore: unused_element
  String get japanName {
    switch (this) {
      case DepositType.blank:
        return '';
      case DepositType.bank:
        return '銀行';
      case DepositType.emoney:
        return '電子マネー';
    }
  }
}
