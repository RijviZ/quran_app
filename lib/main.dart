
import 'package:flutter/material.dart';
import 'package:quran_sharif/splashScreen.dart';


import 'startPage.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final String horiAsset = 'assets/images/corner_side.svg';
  final String vertAsset = 'assets/images/center_both.svg';
  final String titleAsset = 'assets/images/title_frame.svg';


  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();



  /// ↓↓ ADDED
  /// InheritedWidget style accessor to our State object.
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  /// 1) our themeMode "state" field
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quran Sharif',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(
      ),
      themeMode: _themeMode, // 2) ← ← ← use "state" field here //////////////  // Provide dark theme
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
    );
  }

  changeTheme(ThemeMode themeMode) {

    setState(() {
      _themeMode = themeMode;
    });
  }
}
