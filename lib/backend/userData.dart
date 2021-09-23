import 'package:hive_flutter/hive_flutter.dart';

class UserData {
  updateLastPageIndex({required int i}) async {
    var userData = await Hive.openBox('userData');
    await userData.put('lastPageIndex', i);
  }

  Future<dynamic> getLastPageIndex() async {
    var userData = await Hive.openBox('userData');
    var lastPageIndex = await userData.get('lastPageIndex');
    if (lastPageIndex == null) {
      lastPageIndex = 0;
    }

    return lastPageIndex;
  }

  addCompletedPos({required int i}) async {
    var userData = await Hive.openBox('userData');
    var completed = await userData.get('completed');
    if (completed == null) {
      await userData.put('completed', []);
      completed = [];
    }
    completed.add(i);
    await userData.put('completed', completed);
  }

  removeCompletedPos({required int i}) async {
    var userData = await Hive.openBox('userData');
    var completed = await userData.get('completed');
    if (completed == null) {
      await userData.put('completed', []);
      completed = [];
    }
    completed.remove(i);
    await userData.put('completed', completed);
  }

  Future<dynamic> getCompletedPos() async {
    var userData = await Hive.openBox('userData');
    var completed = await userData.get('completed');
    if (completed == null) {
      await userData.put('completed', []);
      completed = [];
    }
    return completed;
  }

  Future<dynamic> updateArabicFontSize({required double i}) async {
    var userData = await Hive.openBox('userData');
    await userData.put('fontSizeArabic', i);
  }

  Future<dynamic> getArabicFontSize() async {
    var userData = await Hive.openBox('userData');
    double fontSize = await userData.get('fontSizeArabic') ?? 20.0;
    return fontSize;
  }

  Future<dynamic> updateBanglaFontSize({required double i}) async {
    var userData = await Hive.openBox('userData');
    await userData.put('fontSizeBangla', i);
  }

  Future<dynamic> getBanglaFontSize() async {
    var userData = await Hive.openBox('userData');
    double fontSize = await userData.get('fontSizeBangla') ?? 20.0;
    return fontSize;
  }

  removeCheckPage({required int i}) async {
    var userData = await Hive.openBox('userData');
    var checkPage = await userData.get('checkPage');

    checkPage.remove(i);
    await userData.put('checkPage', checkPage);
  }

  Future<dynamic> updateCheckPage({required int i}) async {
    var userData = await Hive.openBox('userData');
    List checkPage = userData.get('checkPage');
    checkPage.add(i);
    await userData.put('checkPage', checkPage);
  }

  Future<dynamic> getCheckPage() async {
    var userData = await Hive.openBox('userData');
    var checkPage = await userData.get('checkPage');
    if (checkPage == null) {
      await userData.put('checkPage', []);
      checkPage = [];
    }
    return checkPage;
  }
}
