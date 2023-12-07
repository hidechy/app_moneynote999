class Income {
  Income({this.id, required this.date, required this.sourceName, required this.price});

  int? id;

  String date;

  String sourceName;

  int price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'sourceName': sourceName, 'price': price};
  }
}
