import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:quran_sharif/data/ayat.dart';
import 'package:quran_sharif/data/ayatData.dart';

class AyatDataSourceImpl {
  static const String urlAyat = 'assets/data/arabic_ayat.json';
  static const String urlAyatbn = 'assets/data/ayats_bn.json';
  static const String tafsir = 'assets/data/tafsir.json';

  AyatDataSourceImpl();

  static Future<List<Ayat>> loadAyats() async {
    return ayatFromJson(await rootBundle.loadString(urlAyat));
  }
  static Future<List<String>> loadTafsir() async {
    return List<String>.from(json.decode(await rootBundle.loadString(tafsir)));
  }
  static Future<List<Welcome>> loadAya() async {
    return welcomeFromJson(await rootBundle.loadString(urlAyatbn));
  }
}
