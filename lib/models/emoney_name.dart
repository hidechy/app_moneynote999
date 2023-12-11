class EmoneyName {
  EmoneyName({
    this.id,
    required this.emoneyName,
  });

  int? id;

  String emoneyName;

  Map<String, dynamic> toMap() {
    return {
      'emoney_name': emoneyName,
    };
  }
}
