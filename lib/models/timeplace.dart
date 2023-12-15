class TimePlace {
  TimePlace({this.id, required this.date, required this.time, required this.place, required this.price});

  int? id;

  String date;

  String time;

  String place;

  int price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'time': time, 'place': price, 'price': price};
  }
}
