class EmoneyName {
  EmoneyName({this.id, required this.emoneyName, required this.depositType});

  factory EmoneyName.fromJson(Map<String, dynamic> map) =>
      EmoneyName(id: map['id'], emoneyName: map['emoney_name'], depositType: map['deposit_type']);

  int? id;

  String emoneyName;

  String depositType;

  Map<String, dynamic> toMap() => {'emoney_name': emoneyName, 'deposit_type': depositType};
}
