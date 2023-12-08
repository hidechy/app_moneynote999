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
      'bank_number': bankNumber,
      'bank_name': bankName,
      'branch_number': branchNumber,
      'branch_name': branchName,
      'account_type': accountType,
      'account_number': accountNumber,
      'deposit_type': depositType,
    };
  }
}
