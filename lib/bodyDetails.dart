import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_sharif/data/ayatData.dart';
import 'package:quran_sharif/backend/userData.dart';
import 'package:quran_sharif/utility/convert_number.dart';

class BodyDetails extends StatefulWidget {
  final Ayat data;
  final String tafsir;
  final double value;
  final double bvalue;
  final int? pagePosition;
  BodyDetails(
      {required this.data,
      required this.tafsir,
      required this.value,
      required this.bvalue,
      this.pagePosition});

  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  final String horiAsset = 'assets/images/corner_side.svg';

  final String vertAsset = 'assets/images/center_both.svg';

  final String titleAsset = 'assets/images/title_frame.svg';
  final String fontDown = 'assets/images/font_down.svg';

  var _c = ScrollController();

  bool _showButton = false;

  String text = '';

  late List<String> parts;
  ConvertNumber convertNumber = ConvertNumber();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.tafsir.contains('\n\n')) {
      int idx = widget.tafsir.indexOf("\n\n");
      parts = [
        widget.tafsir.substring(0, idx).trim(),
        widget.tafsir.substring(idx + 1).trim()
      ];
    } else {
      parts = [widget.tafsir, widget.tafsir];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener(
          onNotification: (t) {
            if (_c.position.maxScrollExtent - _c.position.pixels < 50) {
              setState(() {
                _showButton = true;
              });
            } else {
              setState(() {
                _showButton = false;
              });
            }
            return true;
          },
          child: ListView(
            controller: _c,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "সূরাঃ " +
                              convertNumber.convertNumber(widget.data.sura) +
                              ", আয়াতঃ " +
                              convertNumber.convertNumber(widget.data.aya) +
                              "\n" +
                              widget.data.type +
                              " অবতীর্ণ" +
                              "\nপৃষ্ঠাঃ " +
                              convertNumber.convertNumber(widget.data.page) +
                              ", পারাঃ " +
                              convertNumber.convertNumber(widget.data.juzz),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: 'Nikosh',
                          ),
                        ),
                        if (widget.data.sajdah == null)
                          Text(
                            "*সিজদাহর আয়াত*",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontFamily: 'Nikosh',
                            ),
                          ),
                      ],
                    ),
                    Container(
                      height: 300,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            horiAsset,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black54
                                    : Colors.white60,
                            height: 288,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  vertAsset,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black54
                                      : Colors.white70,
                                  width: 200,
                                ),
                                Spacer(),
                                Transform.rotate(
                                  angle: pi / 1,
                                  child: SvgPicture.asset(
                                    vertAsset,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black54
                                        : Colors.white70,
                                    width: 200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.rotate(
                            angle: pi / 1,
                            child: SvgPicture.asset(
                              horiAsset,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black54
                                  : Colors.white60,
                              height: 288,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 19),
                child: Column(
                  children: [
                    SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Text(
                              this.widget.data.text,
                              style: TextStyle(
                                  fontSize: widget.value,
                                  fontFamily: 'uthmani'),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        )),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "অর্থঃ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sirajee',
                                fontSize: 20),
                          ),
                        ),
                        SvgPicture.asset(
                          titleAsset,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white70,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(parts[0],
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.hindSiliguri(
                            textStyle: TextStyle(
                          fontSize: widget.bvalue,
                        ))),
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "তাফসিরঃ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sirajee',
                                fontSize: 20),
                          ),
                        ),
                        SvgPicture.asset(
                          titleAsset,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white70,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(parts[1],
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: widget.bvalue)),
                    SizedBox(height: 70),
                    SvgPicture.asset(
                      fontDown,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white60,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: _showButton && widget.pagePosition != null
            ? FutureBuilder(
                future: UserData().getCheckPage(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  var snapData = snapshot.data;
                  if (snapData == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var _checkPage = snapData;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: FloatingActionButton(
                      backgroundColor: _checkPage.contains(widget.pagePosition)
                          ? Colors.green
                          : Colors.grey,
                      onPressed: () {
                        setState(() {
                          if (!_checkPage.contains(widget.pagePosition)) {
                            UserData().updateCheckPage(i: widget.pagePosition!);
                          } else {
                            UserData().removeCheckPage(i: widget.pagePosition!);
                          }
                        });
                      },
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  );
                },
              )
            : SizedBox());
  }
}
