import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_sharif/shaneNujulDetails.dart';
import 'package:quran_sharif/snData.dart';

class ShaneNujulList extends StatefulWidget {
  final dynamic snData;


  ShaneNujulList({required this.snData});

  @override
  _ShaneNujulListState createState() => _ShaneNujulListState();
}

class _ShaneNujulListState extends State<ShaneNujulList> {

  final String fontFrame = 'assets/images/font_side.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Row(
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
                          "🕋 শানে নুযূল 🕋",
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
          ],
        ),
      ),
      body:
      ListView.builder(
        itemCount: widget.snData.length,
        itemBuilder: (BuildContext context, int index) {
        var title= widget.snData[index]['title'];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(

                  color: Theme.of(context).brightness ==
                      Brightness.light
                      ? Colors.green.shade50
                      : Colors.white24),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                  Container(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Text('🕋'),
                        SizedBox(width: 10,),
                        Text(title,
                          style: TextStyle(fontSize: 17,fontFamily: "uthmani",),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShaneNujulDetails(snData: SnData.allshanenujuls[index],)));
                },
              ),
            ),
            Container(height: 1,color: Theme.of(context).brightness == Brightness.light
          ? Colors.white24
              : Colors.grey.shade800)
          ],
        );
      },

      ),
    );
  }
}
