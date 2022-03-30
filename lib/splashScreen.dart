
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_sharif/backend/userData.dart';
import 'package:quran_sharif/data/ayatData.dart';
import 'package:quran_sharif/data/ayat_datasource.dart';
import 'package:quran_sharif/startPage.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   late int lastPageIndex =0;
   double aValue = 20.0;
   double bValue = 20.0;

   List<Ayat> _ayat = [];
   List<String> _tafsir = [];
  @override

  Future<void> initial() async {
    Future(() async {
     await AyatDataSourceImpl.loadAyats().then((ayat) {
        setState(() {
          _ayat = ayat;
        });
      });
    });
    Future(() async {
     await AyatDataSourceImpl.loadTafsir().then((tafsir) {
        setState(() {
          _tafsir = tafsir;
        });
      });
    });
    Future(() async {
     await AyatDataSourceImpl.loadAya().then((tafsir) {
        List<int> ayats = [];
        for(int i=0; i<tafsir.length;i++){
          ayats.add(int.parse(tafsir[i].ayas!));
        }
        setState(() {
        });
      });
    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
    getTheme();

    //gotoStartPage();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white.withOpacity(0.95)
          : Colors.white.withOpacity(0.18),
      duration: 5000,
      splash: 'assets/images/al_quran.png',splashIconSize:220,
      nextScreen: StartPage(lastIndex: lastPageIndex, ayat: _ayat,tafsir: _tafsir,aValue: aValue,bValue: bValue,),
      splashTransition: SplashTransition.scaleTransition,
    );
  }

  getTheme() async {
    await Hive.initFlutter();

    var themeBox = await Hive.openBox('themeBox');

    var darkMode= await  themeBox.get('darkMode');

    if(darkMode==null){
      themeBox.put('darkMode', false);
    }else{

      MyApp.of(context)!.changeTheme(darkMode?ThemeMode.dark:ThemeMode.light);
    }



  lastPageIndex = await UserData().getLastPageIndex();
  aValue = await UserData().getArabicFontSize();
  bValue = await UserData().getBanglaFontSize();
setState(() {

  print(lastPageIndex);
  print(aValue);
  print(bValue);
});
  }
}
