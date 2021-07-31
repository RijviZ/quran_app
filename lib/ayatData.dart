// To parse this JSON data, do
//
//     final ayat = ayatFromJson(jsonString);

import 'dart:convert';

List<Ayat> ayatFromJson(String str) =>
    List<Ayat>.from(json.decode(str).map((x) => Ayat.fromJson(x)));

String ayatToJson(List<Ayat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ayat {
  String? id;
  String? sura;
  String? aya;
  String? text;
  Ayat({
    this.id,
    this.sura,
    this.aya,
    this.text,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        sura: json["sura"],
        aya: json["aya"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sura": sura,
        "aya": aya,
        "text": text,
      };
}
