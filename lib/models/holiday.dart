// To parse this JSON data, do
//
//     final holiday = holidayFromJson(jsonString);

import 'dart:convert';

Map<String, String> holidayFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String holidayToJson(Map<String, String> data) => json.encode(
      Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
    );

class Holiday {
  Holiday({required this.date, required this.content});

  String date;
  String content;
}
