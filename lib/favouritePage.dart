import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_sharif/startPage.dart';
import 'package:quran_sharif/data.dart';

import 'backend/userData.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final String fontFrame = 'assets/images/font_side.svg';
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
                    children: [Transform.rotate(
                      angle: pi/1,
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
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white),
                      ),
                      SvgPicture.asset(
                        fontFrame,
                        color:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.black54
                            : Colors.white60,
                      ),],
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
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    int i = snapshot.data.length - index - 1;
                    return Container(
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).brightness ==
                                    Brightness.light
                                    ? Colors.black.withOpacity(0.25)
                                    : Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 3.0,
                                offset: Offset(1, 1))
                          ],
                          color: Theme.of(context).brightness ==
                              Brightness.light
                              ? Colors.white
                              : Colors.white24),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [

                          Container(
                            padding: EdgeInsets.only(right: 30),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      Tafsir.fateha[snapshot.data[i]]["ayat"],
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "uthmani",),
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        Tafsir.fateha[snapshot.data[i]]["translate"],
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "Nikosh",),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              isThreeLine: true,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StartPage(lastIndex:i )));
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.favorite,color:Theme.of(context).brightness ==
                                Brightness.light
                                ? Colors.black.withOpacity(0.5)
                                : Colors.white.withOpacity(0.6),size: 40,),
                          ),

                        ],
                      ),
                    );
                  });
            }));
  }
}
