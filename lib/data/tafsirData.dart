// // To parse this JSON data, do
// //
// //     final tafsir = tafsirFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Tafsir> tafsirFromJson(String str) =>
//     List<Tafsir>.from(json.decode(str).map((x) => Tafsir.fromJson(x)));
//
//
// class Tafsir {
//   String? tafsir;
//   Tafsir({
//     this.tafsir
//   });
//
//   factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
//         tafsir: json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "sura": sura,
//         "aya": aya,
//         "text": text,
//       };
// }
