import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_sharif/backend/userData.dart';
import 'package:quran_sharif/settingPage.dart';

class ShaneNujulDetails extends StatefulWidget {
  final dynamic snData;


  ShaneNujulDetails({required this.snData});

  @override
  _ShaneNujulDetailsState createState() => _ShaneNujulDetailsState();
}

class _ShaneNujulDetailsState extends State<ShaneNujulDetails> {
  double _bvalue = 12;
  final String fontDown = 'assets/images/font_down.svg';

  @override
  void initState() {
    // TODO: implement initState
    initial();
  }

  initial()async{
    _bvalue = await UserData().getBanglaFontSize()??12;
    setState(() {

    });
  }

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
            Container(
              child: Row(
                children: [
                  Text("🕋"),
                  SizedBox(width: 10),
                  Text(
                    widget.snData['title'],
                    style: TextStyle(
                        fontFamily: "sirajee",
                        color:
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white),
                  ),
                  SizedBox(width: 10),
                  Text("🕋"),
                ],
              ),
            ),
            CupertinoButton(
                padding: EdgeInsets.only(right: 10),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage())).then((value) async {
                    _bvalue = await UserData().getBanglaFontSize();
                    setState(() {

                    });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(

            child: Column(
              children: [
                Text(widget.snData['details'],textAlign: TextAlign.justify,style: TextStyle(fontSize: _bvalue),),
                SizedBox(height: 50),
                SvgPicture.asset(
                  fontDown,
                  width: 200,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black54
                      : Colors.white60,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
