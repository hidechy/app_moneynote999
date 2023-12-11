class EmoneyName {
  EmoneyName({this.id, required this.emoneyName, required this.depositType});

  int? id;

  String emoneyName;

  String depositType;

  Map<String, dynamic> toMap() {
    return {'emoney_name': emoneyName, 'deposit_type': depositType};
  }
}
