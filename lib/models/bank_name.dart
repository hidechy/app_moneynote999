class BankName {
  BankName({
    this.id,
    required this.bankNumber,
    required this.bankName,
    required this.branchNumber,
    required this.branchName,
    required this.accountType,
    required this.accountNumber,
    required this.depositType,
  });

  int? id;

  String bankNumber;
  String bankName;

  String branchNumber;
  String branchName;

  String accountType;
  String accountNumber;

  String depositType;

  Map<String, dynamic> toMap() {
    return {
      'bankNumber': bankNumber,
      'bankName': bankName,
      'branchNumber': branchNumber,
      'branchName': branchName,
      'accountType': accountType,
      'accountNumber': accountNumber,
      'deposit': depositType,
    };
  }
}
