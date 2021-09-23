// To parse this JSON data, do
//
//     final ayat = ayatFromJson(jsonString);

import 'dart:convert';

List<Ayat> ayatFromJson(String str) => List<Ayat>.from(json.decode(str).map((x) => Ayat.fromJson(x)));

String ayatToJson(List<Ayat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ayat {
  Ayat({
   required this.sura,
   required this.aya,
   required this.text,
   required this.juzz,
   required this.page,
   required this.sajdah,
   required this.type,
   required this.name,
  });

  int sura;
  int aya;
  String text;
  int juzz;
  int page;
  dynamic sajdah;
  String type;
  String name;

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
    sura: json["sura"],
    aya: json["aya"],
    text: json["text"],
    juzz: json["juzz"],
    page: json["page"],
    sajdah: json["sajdah"] == null ? null : json["sajdah"],
    type: json["type"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "sura": sura,
    "aya": aya,
    "text": text,
    "juzz": juzz,
    "page": page,
    "sajdah": sajdah == null ? null : sajdah,
    "type": type,
    "name": name,
  };
}
