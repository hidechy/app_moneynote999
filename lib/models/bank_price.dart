class BankPrice {
  BankPrice({this.id, required this.date, required this.depositType, required this.bankId, required this.price});

  int? id;

  String date;

  String depositType;

  int bankId;

  int price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'deposit_type': depositType, 'bank_id': bankId, 'price': price};
  }
}
