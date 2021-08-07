// To parse this JSON data, do
//
//     final ayat = ayatFromJson(jsonString);

import 'dart:convert';

List<Ayat> ayatFromJson(String str) => List<Ayat>.from(json.decode(str).map((x) => Ayat.fromJson(x)));

String ayatToJson(List<Ayat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ayat {
  Ayat({
   required this.surahNumber,
   required this.verseNumber,
   required this.content,
  });

  int surahNumber;
  int verseNumber;
  String content;

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
    surahNumber: json["surah_number"],
    verseNumber: json["verse_number"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "surah_number": surahNumber,
    "verse_number": verseNumber,
    "content": content,
  };
}
