import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_sharif/bodyDetails.dart';
import 'package:quran_sharif/data/ayatData.dart';

import 'backend/userData.dart';

class FavoritePage extends StatefulWidget {
  final List<Ayat>? ayat;
  final List<String>? tafsir;

  final double value;
  final double bvalue;

  const FavoritePage({Key? key,required this.ayat,required this.tafsir,required this.value,required this.bvalue}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String fontFrame = 'assets/images/font_side.svg';
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black54
                        : Colors.white54),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Container(
                  child: Row(
                    children: [
                      Transform.rotate(
                        angle: pi / 1,
                        child: SvgPicture.asset(
                          fontFrame,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white60,
                        ),
                      ),
                      Text(
                        "❤ প্রিয় পৃষ্ঠা ❤",
                        style: TextStyle(
                            fontFamily: "sirajee",
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                      ),
                      SvgPicture.asset(
                        fontFrame,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black54
                            : Colors.white60,
                      ),
                    ],
                  ),
                ),
              ),
              Container()
            ],
          ),
        ),
        body: FutureBuilder(
            future: UserData().getCompletedPos(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return Container();
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    idx = widget.tafsir![snapshot.data[index]].indexOf("\n\n");
                    if(idx==-1){
                      idx = widget.tafsir![snapshot.data[index]].length;
                    }
                    return FavoriteTile(
                      ayat: widget.ayat![snapshot.data[index]].text,
                      aya: widget.ayat![snapshot.data[index]],
                      tafsir: widget.tafsir![snapshot.data[index]],
                      idx: idx,
                      value: widget.value,
                      bvalue: widget.bvalue,
                      pos: snapshot.data[index],
                    );
                  });
            }));
  }
}

class FavoriteTile extends StatefulWidget {
  final String ayat, tafsir;
  final Ayat aya;
  final int idx, pos;
  final double value;
  final double bvalue;

  const FavoriteTile(
      {Key? key, required this.ayat, required this.tafsir, required this.idx,required this.pos,required this.value,required this.bvalue,required this.aya})
      : super(key: key);

  @override
  _FavoriteTileState createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  bool isLiked = true;
  final String horiAsset = 'assets/images/corner_side.svg';

  final String vertAsset = 'assets/images/center_both.svg';

  final String titleAsset = 'assets/images/title_frame.svg';
  final String fontDown = 'assets/images/font_down.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.25)
                    : Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 3.0,
                offset: Offset(1, 1))
          ],
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.white24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: (){
                showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext,
                        Animation animation,
                        Animation secondaryAnimation) {
                      return Stack(
                        children: [
                          BodyDetails(data: widget.aya, tafsir: widget.tafsir, value: widget.value, bvalue: widget.bvalue, pagePosition: null),
                          Align(
                            alignment: Alignment.topRight,
                            child: CupertinoButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: Theme.of(context).brightness == Brightness.light
                                    ? Colors.black.withOpacity(0.7)
                                    : Colors.white.withOpacity(0.8),
                                child: Icon(
                                  Icons.close,
                                  color:Colors.red,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 70,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          widget.ayat,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.black.withOpacity(0.8)
                                : Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontFamily: "uthmani",
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.tafsir.substring(0, widget.idx).trim(),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 22,
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Colors.black.withOpacity(0.8)
                                  : Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nikosh",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
                isLiked = !isLiked;
                if (isLiked) {
                  UserData().addCompletedPos(i: widget.pos);
                } else {
                  UserData().removeCompletedPos(i: widget.pos);
                }
              setState(() {
              });
            },
            child: Container(
              child: Icon(
                Icons.favorite,
                color: isLiked
                    ? Colors.red
                    : Theme.of(context).brightness == Brightness.light
                        ? Colors.black.withOpacity(0.5)
                        : Colors.white.withOpacity(0.6),
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
