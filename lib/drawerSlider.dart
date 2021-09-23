import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_sharif/data/ayatData.dart';
import 'package:quran_sharif/hadisList.dart';
import 'package:quran_sharif/favouritePage.dart';
import 'package:quran_sharif/shaneNujulList.dart';
import 'package:quran_sharif/snData.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerSlider extends StatefulWidget {
  final List<Ayat> ayat;
  final List<String> tafsir;

  final double value;
  final double bvalue;

  const DrawerSlider(
      {Key? key,
       required this.ayat,
       required this.tafsir,required this.value,required this.bvalue})
      : super(key: key);
  @override
  _DrawerSliderState createState() => _DrawerSliderState();
}

class _DrawerSliderState extends State<DrawerSlider> {
  final String upFrame = 'assets/images/up_frame.svg';

  final String downFrame = 'assets/images/down_frame.svg';

  final String fontDown = 'assets/images/font_down.svg';

  List<Map<String,dynamic>> alllist = [
    {  'id' : 0,
      'icon': Icons.mail,
      'text': "Contact Us",
    },
    { 'id' : 1,
      'icon': Icons.share,
      'text': "Share This App",

    },
    {
      'id' : 2,
      'icon': Icons.api,
      'text': "Our Other Projects",
    },
    { 'id' : 3,
      'icon': Icons.font_download,
      'text': "About App",
    },
    { 'id' : 4,
      'icon': Icons.facebook_rounded,
      'text': "Facebook Page",

    },
    { 'id' : 5,
      'icon': Icons.rate_review,
      'text': "Give Rating/Review",

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.5))),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white60
                  : Colors.white10,
            ),
            child: Container(
              child: Stack(
                children: [
                  Center(
                      child: Text(
                    "ওয়ান কোরআন",
                    style: TextStyle(
                      fontFamily: "sirajee",
                      fontSize: 30,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white,
                    ),
                  )),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SvgPicture.asset(
                            upFrame,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black54
                                    : Colors.white60,
                            width: 200,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          downFrame,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black54
                                  : Colors.white70,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(
                  '❤',
                  style: TextStyle(
                    fontSize: 30,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade700
                          : Colors.white,)
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'প্রিয় পৃষ্ঠা সমূহ',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Nikosh",
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey
                                  : Colors.white70),
                    ),
                  ],
                )),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoritePage(ayat: widget.ayat,tafsir: widget.tafsir,bvalue: widget.bvalue,value: widget.value,)));
            },
          ),
          ListTile(
            title: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                  Text(
                  '🕋',
                  style: TextStyle(
                    fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade700
                          : Colors.white,)
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'শানে নুযূল',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Nikosh",
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey
                                  : Colors.white70),
                    ),
                  ],
                )),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>ShaneNujulList(snData: SnData.allshanenujuls)));
            },
          ),
          ListTile(
            title: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                        '📚',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.grey.shade700
                              : Colors.white,)
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '৪০টি গুরুত্বপূর্ণ হাদিস',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Nikosh",
                          color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.grey
                              : Colors.white70),
                    ),
                  ],
                )),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HadisList()));
            },
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: alllist.map((e) => DrawerList(
                    icon: e['icon'],
                    text: e['text'],
                      action: (){
                        if(e['id']==0){ _sendMail();}
                        if(e['id']==1){
                          Share.share('check out my website https://www.facebook.com/Quranmaajid786');
                        }
                        if(e['id']==2){try {
                          launch("https://play.google.com/store/apps/developer?id=Aerobola");
                        } on PlatformException catch(e) {
                          launch("https://play.google.com/store/apps/developer?id=Aerobola");
                        } finally {
                          launch("https://play.google.com/store/apps/developer?id=Aerobola");
                        }
                        }
                        if(e['id']==4){
                          _launchURL();
                        }
                        if(e['id']==5){}
                        }
                  )).toList(),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
              child: Text("App Version: 1.0.0",
                  style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 20),)),
          SvgPicture.asset(
            fontDown,
            width: 200,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black54
                : Colors.white60,
          ),
        ],
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final icon, text;
  final VoidCallback action;

  const DrawerList({Key? key, this.icon, this.text, required this.action}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: this.action,
      child: Row(
        children: [
          Icon(this.icon,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade700
                  : Colors.white),
          SizedBox(width: 15),
          Text(
            this.text,
            style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w500,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey
                    : Colors.white70),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}



void _launchURL() async {
  await canLaunch('https://www.facebook.com/Quranmaajid786') ? await launch( 'https://www.facebook.com/Quranmaajid786') : throw 'Could not launch ';
}

_sendMail() async {
  // Android and iOS
  const uri =
      'mailto:Team.aerobola@gmail.com?subject=Greetings&body=Hello%20Team';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}