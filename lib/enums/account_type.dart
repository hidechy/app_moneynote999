enum AccountType { normal, fixed }

extension on AccountType {
  // ignore: unused_element
  String? get value {
    switch (this) {
      case AccountType.normal:
        return '普通口座';
      case AccountType.fixed:
        return '定期口座';
    }
  }
}
