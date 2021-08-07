import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:quran_sharif/data/ayatData.dart';


class AyatDataSourceImpl {
  static const String urlAyat = 'assets/data/arabic.json';
  static const String tafsir = 'assets/data/tafsir.json';

  AyatDataSourceImpl();

  static Future<List<Ayat>> loadAyats() async {
    return ayatFromJson(await rootBundle.loadString(urlAyat));
  }
  static Future<List<String>> loadTafsir() async {
    return List<String>.from(json.decode(await rootBundle.loadString(tafsir)));
  }
}
