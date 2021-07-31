
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_sharif/startPage.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
    gotoStartPage();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white.withOpacity(0.95)
          : Colors.white.withOpacity(0.18),
      splash: 'assets/images/al_quran.png',splashIconSize:220,
      nextScreen: StartPage(lastIndex: 0),
      splashTransition: SplashTransition.scaleTransition,
    );
  }


  Future<void> gotoStartPage() async {
    await Future.delayed(Duration(milliseconds: 1300));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartPage(lastIndex: 0)));
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





  }
}
