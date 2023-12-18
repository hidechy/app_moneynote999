class SpendTimePlace {
  SpendTimePlace(
      {this.id,
      required this.date,
      required this.spendType,
      required this.time,
      required this.place,
      required this.price});

  factory SpendTimePlace.fromJson(Map<String, dynamic> map) => SpendTimePlace(
      id: map['id'],
      date: map['date'],
      spendType: map['spend_type'],
      time: map['time'],
      place: map['place'],
      price: map['price']);

  int? id;
  String date;
  String spendType;
  String time;
  String place;
  int price;

  Map<String, dynamic> toMap() => {'date': date, 'spend_type': spendType, 'time': time, 'place': place, 'price': price};
}
