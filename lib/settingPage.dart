import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_sharif/backend/userData.dart';
import 'package:quran_sharif/startPage.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'main.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkMode =
      SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;


  double _value = 12;
  double _bvalue = 12;
  String dropdownValue = 'Uthmanic';
  String nextdropdownValue = 'Avro';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTheme();
    initial();
  }

  initial() async {
    _bvalue = await UserData().getBanglaFontSize() ?? 12;
    _value = await UserData().getArabicFontSize() ?? 12;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white70
            : Colors.black12,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  gotoStartPage();
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey
                      : Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                "Setting",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey
                      : Colors.white,
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
      body: Container(
        height: double.maxFinite,
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white54
            : Colors.black26,
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<dynamic>(
                  future: getTheme(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return CircularProgressIndicator();
                    } else {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Container(
                              height: 114,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.grey
                                          : Colors.black54,
                                      spreadRadius: 0.1,
                                      blurRadius: 0.1,
                                      offset: Offset(0.1, 0.1))
                                ],
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.white24,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Text('Choose your theme:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(17),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              "🔆 Dark Mode 🌙",
                                            ),
                                          ),
                                        ),
                                        FlutterSwitch(
                                          duration: Duration(milliseconds: 100),
                                          width: 70.0,
                                          height: 32.0,
                                          toggleSize: 25.0,
                                          value: isDarkMode,
                                          borderRadius: 30.0,
                                          padding: 1.0,
                                          activeToggleColor: Color(0xFF6E40C9),
                                          inactiveToggleColor:
                                              Color(0xFF2F363D),
                                          activeSwitchBorder: Border.all(
                                            color: Color(0xFF3C1E70),
                                            width: 3.0,
                                          ),
                                          inactiveSwitchBorder: Border.all(
                                            color: Color(0xFFD1D5DA),
                                            width: 3.0,
                                          ),
                                          activeColor: Color(0xFF271052),
                                          inactiveColor: Colors.white,
                                          activeIcon: Icon(
                                            Icons.nightlight_round,
                                            color: Color(0xFFF8E3A1),
                                          ),
                                          inactiveIcon: Icon(
                                            Icons.wb_sunny,
                                            color: Color(0xFFFFDF5D),
                                          ),
                                          onToggle: (val) {
                                            setTheme(val);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey
                                  : Colors.black54,
                          spreadRadius: 0.1,
                          blurRadius: 0.1,
                          offset: Offset(0.1, 0.1))
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.white24,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Font Setting',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(height: 10),
                          Text('Select Arabic Font'),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.grey),
                            underline: Container(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Uthmanic', 'Noorehuda', 'Indopak']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          Text("Arobic Font Size"),
                          Row(
                            children: [
                              Expanded(
                                child: SfSlider(
                                  min: 12,
                                  max: 40,
                                  inactiveColor: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black12
                                      : Colors.black45,
                                  activeColor: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.blueGrey
                                      : Colors.white,
                                  value: _value,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: false,
                                  minorTicksPerInterval: 0,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _value = value;
                                    });
                                    UserData().updateArabicFontSize(i: _value);
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  _value.toInt().toString(),
                                  style: TextStyle(fontSize: _value),
                                ),
                              )
                            ],
                          ),
                          Text('Select Bangla Font'),
                          DropdownButton<String>(
                            value: nextdropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.grey),
                            underline: Container(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                nextdropdownValue = newValue!;
                              });
                            },
                            items: <String>['Avro', 'Nikosh', 'Sirajee']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          Text("Bangla Font Size"),
                          Row(
                            children: [
                              Expanded(
                                child: SfSlider(
                                  min: 12,
                                  max: 40,
                                  inactiveColor: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black12
                                      : Colors.black45,
                                  activeColor: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.blueGrey
                                      : Colors.white,
                                  value: _bvalue,
                                  showTicks: false,
                                  showLabels: false,
                                  enableTooltip: false,
                                  minorTicksPerInterval: 0,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _bvalue = value;
                                    });
                                    UserData().updateBanglaFontSize(i: _bvalue);
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  _bvalue.toInt().toString(),
                                  style: TextStyle(fontSize: _bvalue),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }

  getTheme() async {
    var themeBox = await Hive.openBox('themeBox');

    isDarkMode = await themeBox.get('darkMode');

    setState(() {});
    return true;
  }

  setTheme(b) async {
    var themeBox = await Hive.openBox('themeBox');
    await themeBox.put('darkMode', b);

    isDarkMode = !isDarkMode;
    await MyApp.of(context)!
        .changeTheme(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    setState(() {});
  }

  Future<void> gotoStartPage() async {
    Navigator.pop(context, true);
  }
}
