class Bank {
  Bank({this.id, required this.date, required this.bankId, required this.price});

  int? id;

  String date;

  int bankId;

  int price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'bankId': bankId, 'price': price};
  }
}
