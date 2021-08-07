import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_sharif/data/ayatData.dart';
import 'package:quran_sharif/backend/userData.dart';

import 'package:quran_sharif/data.dart';
import 'package:quran_sharif/data/ayat_datasource.dart';
import 'package:quran_sharif/snData.dart';
import 'data.dart';

import 'package:quran_sharif/bodyDetails.dart';
import 'package:quran_sharif/settingPage.dart';

import 'drawerSlider.dart';

class StartPage extends StatefulWidget {
  final int lastIndex;
  final bool? fromSettings;

  final List<Ayat>? ayat;
  final List<String>? tafsir;

  const StartPage(
      {Key? key,
      required this.lastIndex,
      this.fromSettings,
      this.ayat,
      this.tafsir})
      : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _pos = 0;
  bool _checked = false;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  String surah = '';

  double _value = 12;
  double _bvalue = 12;
  List<Ayat> _ayat = [];
  List<String> _tafsir = [];

  @override
  void initState() {
    initial();

    super.initState();
  }

  initial() async {
    _value = await UserData().getArabicFontSize();
    _bvalue = await UserData().getBanglaFontSize();
    _ayat = widget.ayat!;
    _tafsir = widget.tafsir!;
    _pos = widget.lastIndex;
    print(_pos);
    surah =
        SnData.allshanenujuls[_ayat[widget.lastIndex].surahNumber - 1]['title'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.grey,
          ), // change this size and style
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Spacer(),
            Text(
              surah,
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black54
                      : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sirajee'),
            ),
            Spacer(),
            FutureBuilder(
              future: UserData().getCompletedPos(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.data == null) {
                  return Container();
                }
                var completed = snapshot.data;
                return CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      _checked = !_checked;

                      if (!completed.contains(_pos)) {
                        UserData().addCompletedPos(i: _pos);
                      } else {
                        UserData().removeCompletedPos(i: _pos);
                      }
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: completed.contains(_pos) ? Colors.red : Colors.grey,
                    size: 30,
                  ),
                );
              },
            ),
            CupertinoButton(
                padding: EdgeInsets.only(right: 10),
                onPressed: () async {
                  await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPage()))
                      .then((value) async {
                    _bvalue = await UserData().getBanglaFontSize();
                    _value = await UserData().getArabicFontSize();
                    setState(() {});
                  });
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.grey,
                  size: 30,
                )),
          ],
        ),
      ),
      drawer: DrawerSlider(),
      body: SafeArea(
          bottom: true,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: PageController(initialPage: widget.lastIndex, keepPage: true, viewportFraction: 1),
            onPageChanged: (i) {
              setState(() {
                _pos = i;
                surah =
                    SnData.allshanenujuls[_ayat[i].surahNumber - 1]['title'];
                print('Pos: $i');
                //surah = Tafsir.fateha[i]['appbartitle'];
                UserData().updateLastPageIndex(i: i);
              });
            },
            itemCount: _ayat.length,
            itemBuilder: (BuildContext context, int item) {
              return BodyDetails(
                data: _ayat[item],
                tafsir: _tafsir[item],
                bvalue: _bvalue,
                value: _value,
                pagePosition: _pos,
              );
            },
          )),
    );
  }
}
