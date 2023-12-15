class Spend {
  Spend({this.id, required this.date, required this.spendType, required this.price});

  int? id;

  String date;

  String spendType;

  String price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'spend_type': spendType, 'price': price};
  }
}
