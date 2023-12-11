import '../enums/diposit_type.dart';

class Bank {
  Bank({this.id, required this.date, this.depositType, required this.bankId, required this.price});

  int? id;

  String date;

  DipositType? depositType;

  int bankId;

  int price;

  Map<String, dynamic> toMap() {
    return {'date': date, 'deposit_type': depositType, 'bankId': bankId, 'price': price};
  }
}
