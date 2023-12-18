class Income {
  Income({this.id, required this.date, required this.sourceName, required this.price});

  factory Income.fromJson(Map<String, dynamic> map) => Income(
        id: map['id'],
        date: map['date'],
        sourceName: map['source_name'],
        price: map['price'],
      );

  int? id;

  String date;

  String sourceName;

  int price;

  Map<String, dynamic> toMap() => {'date': date, 'source_name': sourceName, 'price': price};
}
