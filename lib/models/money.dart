class Money {
  Money({
    this.id,
    required this.date,
    required this.yen_10000,
    required this.yen_5000,
    required this.yen_2000,
    required this.yen_1000,
    required this.yen_500,
    required this.yen_100,
    required this.yen_50,
    required this.yen_10,
    required this.yen_5,
    required this.yen_1,
  });

  factory Money.fromJson(Map<String, dynamic> map) => Money(
        id: map['id'],
        date: map['date'],
        yen_10000: map['yen_10000'],
        yen_5000: map['yen_5000'],
        yen_2000: map['yen_2000'],
        yen_1000: map['yen_1000'],
        yen_500: map['yen_500'],
        yen_100: map['yen_100'],
        yen_50: map['yen_50'],
        yen_10: map['yen_10'],
        yen_5: map['yen_5'],
        yen_1: map['yen_1'],
      );

  int? id;

  String date;

  int yen_10000;
  int yen_5000;
  int yen_2000;
  int yen_1000;
  int yen_500;
  int yen_100;
  int yen_50;
  int yen_10;
  int yen_5;
  int yen_1;

  Map<String, dynamic> toMap() => {
        'date': date,
        'yen_10000': yen_10000,
        'yen_5000': yen_5000,
        'yen_2000': yen_2000,
        'yen_1000': yen_1000,
        'yen_500': yen_500,
        'yen_100': yen_100,
        'yen_50': yen_50,
        'yen_10': yen_10,
        'yen_5': yen_5,
        'yen_1': yen_1,
      };
}
