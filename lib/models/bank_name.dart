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

  factory BankName.fromJson(Map<String, dynamic> map) => BankName(
        id: map['id'],
        bankNumber: map['bank_number'],
        bankName: map['bank_name'],
        branchNumber: map['branch_number'],
        branchName: map['branch_name'],
        accountType: map['account_type'],
        accountNumber: map['account_number'],
        depositType: map['deposit_type'],
      );

  int? id;

  String bankNumber;
  String bankName;

  String branchNumber;
  String branchName;

  String accountType;
  String accountNumber;

  String depositType;

  Map<String, dynamic> toMap() => {
        'bank_number': bankNumber,
        'bank_name': bankName,
        'branch_number': branchNumber,
        'branch_name': branchName,
        'account_type': accountType,
        'account_number': accountNumber,
        'deposit_type': depositType,
      };
}
