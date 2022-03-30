import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:quran_sharif/data/ayatData.dart';
import 'package:quran_sharif/backend/userData.dart';

import 'package:quran_sharif/snData.dart';

import 'package:quran_sharif/bodyDetails.dart';
import 'package:quran_sharif/settingPage.dart';

import 'drawerSlider.dart';

class StartPage extends StatefulWidget {
  final int lastIndex;
  final double aValue;
  final double bValue;
  final bool? fromSettings;

  final List<Ayat>? ayat;
  final List<String>? tafsir;

  const StartPage(
      {Key? key,
      required this.lastIndex,
      this.fromSettings,
      this.ayat,
      this.tafsir,
      required this.aValue,
      required this.bValue})
      : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _pos = 0;
  int _currentValue = 1;
  int _aya = 1;
  int _totalNumberOfAyats = 0;
  int _totalValue = 0;
  bool _checked = false;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  String surah = '';

  double _value = 15;
  double _bvalue = 15;
  List<Ayat> _ayat = [];
  List<String> _tafsir = [];
  List<int> totalAyatList = [
    7,
    286,
    200,
    176,
    120,
    165,
    206,
    75,
    129,
    109,
    123,
    111,
    43,
    52,
    99,
    128,
    111,
    110,
    98,
    135,
    112,
    78,
    118,
    64,
    77,
    227,
    93,
    88,
    69,
    60,
    34,
    30,
    73,
    54,
    45,
    83,
    182,
    88,
    75,
    85,
    54,
    53,
    89,
    59,
    37,
    35,
    38,
    29,
    18,
    45,
    60,
    49,
    62,
    55,
    78,
    96,
    29,
    22,
    24,
    13,
    14,
    11,
    11,
    18,
    12,
    12,
    30,
    52,
    52,
    44,
    28,
    28,
    20,
    56,
    40,
    31,
    50,
    40,
    46,
    42,
    29,
    19,
    36,
    25,
    22,
    17,
    19,
    26,
    30,
    20,
    15,
    21,
    11,
    8,
    8,
    19,
    5,
    8,
    8,
    11,
    11,
    8,
    3,
    9,
    5,
    4,
    7,
    3,
    6,
    3,
    5,
    4,
    5,
    6
  ];
  PageController _pageController = PageController();

  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.lastIndex, keepPage: true, viewportFraction: 1);
    initial();
    for (int i = 0; i < totalAyatList.length; i++) {
      _totalValue = _totalValue + totalAyatList[i];
    }
    print('yyyyy');
    print(_totalValue);
    super.initState();
  }

  initial() async {
    _value = widget.aValue;
    _bvalue = widget.bValue;
    _ayat = widget.ayat!;
    _tafsir = widget.tafsir!;
    print('zzzzzz');
    print(widget.ayat!);
    print(_tafsir.length);
    _pos = widget.lastIndex;
    print(_pos);
    surah = SnData.allshanenujuls[_ayat[widget.lastIndex].sura - 1]['title'];
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
            IconButton(
              icon: Icon(
                Icons.navigation,
                size: 30,
                color: Colors.grey,
              ),
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text('দ্রুত আয়াত খুঁজুন!'),
                        content: Container(
                          width: 300,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('সূরাঃ'),
                                  Container(
                                    height: 120,
                                    width: 165,
                                    child: CupertinoPicker.builder(
                                        squeeze: 1.5,
                                        diameterRatio: 1,
                                        useMagnifier: true,
                                        scrollController:
                                            new FixedExtentScrollController(
                                          initialItem: 0,
                                        ),
                                        itemExtent: 33.0,
                                        backgroundColor: Colors.transparent,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            _currentValue = index + 1;
                                            _aya = 1;
                                          });
                                        },
                                        childCount: totalAyatList.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${index + 1}. ',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black54
                                                      : Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${SnData.allshanenujuls[index]['title']}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black54
                                                      : Colors.white,
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('আয়াতঃ'),
                                  NumberPicker(
                                    value: _aya,
                                    itemWidth: 50,
                                    itemHeight: 40,
                                    minValue: 1,
                                    maxValue: totalAyatList[_currentValue - 1],
                                    onChanged: (value) =>
                                        setState(() => _aya = value),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'Go',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black54
                                    : Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                  },
                ).then((value) {
                  _totalNumberOfAyats = 0;
                  for (int i = 0; i < _currentValue - 1; i++) {
                    _totalNumberOfAyats =
                        totalAyatList[i] + _totalNumberOfAyats;
                  }
                  _totalNumberOfAyats = _totalNumberOfAyats + _aya - 1;
                  _pos = _totalNumberOfAyats;
                  surah =
                      SnData.allshanenujuls[_ayat[_totalNumberOfAyats].sura - 1]
                          ['title'];
                  UserData().updateLastPageIndex(i: _totalNumberOfAyats);
                  _pageController.animateToPage(_totalNumberOfAyats,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                  print(_totalNumberOfAyats);
                });
              },
            ),
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
      drawer: DrawerSlider(
        ayat: _ayat,
        tafsir: _tafsir,
        bvalue: _bvalue,
        value: _value,
      ),
      body: SafeArea(
        bottom: true,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: (i) {
            setState(() {
              _pos = i;
              surah = SnData.allshanenujuls[_ayat[i].sura - 1]['title'];
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
        ),
      ),
    );
  }
}
