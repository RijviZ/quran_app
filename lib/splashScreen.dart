
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

   List<Ayat> _ayat = [];
   List<String> _tafsir = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTheme();
    Future(() async {
      AyatDataSourceImpl.loadAyats().then((ayat) {
        setState(() {
          _ayat = ayat;
        });
      });

    });
    Future(() async {
      AyatDataSourceImpl.loadTafsir().then((tafsir) {
        setState(() {
          _tafsir = tafsir;
        });
      });

    });
    //gotoStartPage();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white.withOpacity(0.95)
          : Colors.white.withOpacity(0.18),
      splash: 'assets/images/al_quran.png',splashIconSize:220,
      nextScreen: StartPage(lastIndex: lastPageIndex, ayat: _ayat,tafsir: _tafsir,),
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
setState(() {

  print(lastPageIndex);
});
  }
}
