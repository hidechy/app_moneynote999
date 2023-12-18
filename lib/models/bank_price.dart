class BankPrice {
  BankPrice({this.id, required this.date, required this.depositType, required this.bankId, required this.price});

  factory BankPrice.fromJson(Map<String, dynamic> map) => BankPrice(
        id: map['id'],
        date: map['date'],
        depositType: map['deposit_type'],
        bankId: map['bank_id'],
        price: map['price'],
      );

  int? id;

  String date;

  String depositType;

  int bankId;

  int price;

  Map<String, dynamic> toMap() => {'date': date, 'deposit_type': depositType, 'bank_id': bankId, 'price': price};
}
