class SpendTimePlace {
  SpendTimePlace(
      {this.id,
      required this.date,
      required this.spendType,
      required this.time,
      required this.place,
      required this.price});

  int? id;
  String date;
  String spendType;
  String time;
  String place;
  int price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'spend_type': spendType, 'time': time, 'place': place, 'price': price};
  }
}
