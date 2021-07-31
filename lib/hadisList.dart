import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_sharif/backend/userData.dart';
import 'package:quran_sharif/settingPage.dart';

class HadisList extends StatefulWidget {
  @override
  _HadisListState createState() => _HadisListState();
}

class _HadisListState extends State<HadisList> {
  double _bvalue = 12;
  final String fontDown = 'assets/images/font_down.svg';

  @override
  void initState() {
    // TODO: implement initState
    initial();
  }

  initial() async {
    _bvalue = await UserData().getBanglaFontSize() ?? 12;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black54
                  : Colors.white54,
            )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "📚 ৪০টি গুরুত্বপূর্ণ হাদিস 📚",
              style: TextStyle(
                  fontFamily: "sirajee",
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white),
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
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "১। আমার কথা (অন্যদের কাছে) পৌছিয়ে দাও, তা যদি একটি আয়াতও হয়।(সহীহ বুখারীঃ ৩২১৫)\n\n"
                      "২। রাসূল (সাঃ) বলেছেন, কোন ব্যক্তির মিথ্যাবাদী হওয়ার জন্য এতটকুই যথেষ্ঠ যে, সে যা শোনে (যাচাই ব্যতীত) তাই বলে বেড়ায়।(সহীহ মুসলিম, মুকাদ্দামা, অনুচ্ছেদ -৩)\n\n"
                      "৩। রাসূল (সাঃ) বলেছেনঃ যে ব্যক্তি আমার প্রতি মিথ্যা আরোপ করবে সে জাহান্নামে যাবে।(দেখুন সহীহ বুখারীঃ ১০৭,১০৯,১০৯,১১০,১১১ সহীহ মুসলিম,মুকাদ্দামা)\n\n"
                      "৪। পিতা-মাতার সন্তুষ্টিতে আল্লাহ্ সন্তুষ্ট আর পিতা-মাতার অসন্তুষ্টে আল্লাহ্ অসন্তুষ্ট।(তিরমিযী, সনদ হাসান, মিশকাত হা/৪৭১০)\n\n"
                      "৫। পাঁচ ওয়াক্ত সলাত আদায় করলে পঞ্চাশ ওয়াক্ত সলাতের সওয়াব পাওয়া যায়।(সহীহ বুখায়, মুসলিম ও তিরমিযীঃ ২১৩)\n\n"
                      "৬। ব্যক্তি এবং শিরক ও কুফরের মাঝখানে সলাত ছেড়ে দেওয়াই হচ্ছে ব্যবধান।(সহীহ মুসলিমঃ ১৫৪,১৫৫, মিশকাত)\n\n"
                      "৭। ক্বিয়ামতের দিন বান্দার কাজসমূহের মধ্যে সর্বপ্রথম সলাতের হিসাব নেওয়া হবে।(সহীহ তিরমিযীঃ ৪১৩, ইবনু মাযাহঃ ১৪২৫,১৪২৬)\n\n"
                      "৮। যে ব্যক্তি ফজর ও আসরের নামায আদায় করবে সে জান্নাতে যাবে।(সহীহ বুখারীঃ ৫৪৬)\n\n"
                      "৯। আল্লাহ্ তা’আলার নিকট প্রিয় ঐ আমল যা নিয়মিত করা হয় যদিও তা অল্প হয়।(সহীহ বুখারীঃ ৪১,৬০২০)\n\n"
                      "১০। যে ব্যক্তি (পুরুষ) পায়ের টাখনুর নিচে কাপড় ঝুলিয়ে পরবে, সে জাহান্নামী।(সহীহ বুখারীঃ৫৩৭১, মিশকাত, হা/৪১২৫)\n\n"
                      "১১। কালিজিরায় মৃত্যু ছাড়া আর সকল রোগের চিকিৎসা রয়েছে।(বুখারী, হা/৫২৮৬ ও মুসলিম)\n\n"
                      "১২। নবী করীম (সাঃ) মিষ্টি ও মধু খুব ভালো বাসতেন।(বুখারী, হা:৫২৮০)\n\n"
                      "১৩। যারা আমার সুন্নতের প্রতি বিরাগ পোষন (অনিহা প্রকাশ) করবে, তারা আমার উম্মতের অন্তর্ভূক্ত নয়।(সহীহ বুখারীঃ ৪৬৯৭)\n\n"
                      "১৪। যে ব্যক্তি বিদআত সৃষ্টি করবে ও আশ্রয় দিবে তার উপর আল্লাহ্ তা’আলার, ফেরেশতা ও সকল মানব সম্প্রদায়ের লানত ।(সহীহ বুখারীঃ ৬৮০৮)\n\n"
                      "১৫। যার অন্তরে সরিষা সমপরিমাণ ঈমান আছে, সে জাহান্নামে যাবে না। আর যার অন্তরে সরিষা সমপরিমাণ অহংকার আছে সেজান্নাতে যাবে না।(মুসলিম, মিশকাত হা/৫১০৮)\n\n"
                      "১৬। যে ঘরে কুকুর ও (প্রাণীর) ছবি থাকে,সে ঘরে রহমতের ফেরেশতা প্রবেশ করে না।(সহীহ বুখারীঃ ২৯৯৮, ৫৫২৫, মিশকাত হাঃ৪২৯৮)\n\n"
                      "১৭। তিন ব্যক্তির দিকে কিয়ামতের দিন আল্লাহ্ তাদের দিকে করুণার দৃষ্টি দিবেন না ও তাদের জন্য কঠিন শাস্তি–\n(ক) গাটের নিচে কাপড় পরিধানকারী পুরুষ\n(খ) খোটাদানকারী\n(গ) মিথ্যা কসমে পণ্য বিক্রয়কারী।\n(মুসলিম, মিশকাত হা/২৬৭৩)\n\n"
                      "১৮। “যে ব্যক্তি মারা গেল অথচ জিহাদ করেনি এমনকি জিহাদের আকাঙ্ক্ষাও ব্যক্ত করেনি, সে মুনাফিকের ন্যায় মৃত্যুবরণ করল। ”(সহীহ মুসলিমঃ ৪৭৭৯, নাসায়ীঃ ৩০৯৯)\n\n"
                      "১৯। আত্নীয়ের সাথে ভালো ব্যবহার করলে রিযিক ও হায়াত বৃদ্ধি পায়।(সহীহ বুখারীঃ ৫৫৫৯,৫৫৬০)\n\n"
                      "২০। কেউ সওয়াল থেকে পবিত্র থাকতে চাইলে আল্লাহ্ তাকে পবিত্র রাখেন। যে অমুখাপেক্ষী থাকতে চায়, আল্লাহ্ তাকে অমুখাপেক্ষী রাখেন এবং যে ধৈর্য ধারণ করতে চায়, আল্লাহ্ তাকে তাই দান করেন।ধৈর্যের চায়ে অধিক ব্যাপক কিছু দান করা হয়নি।(সহীহ বুখারী, হা/১৪৬৯, সহীহ মুসলিম , সহীহ আবু দাউদ, হা/১৬৪৪)\n\n"
                      "২১। বিনা হিসেবে জান্নাতে যাবে (সত্তর হাজার) ওসব লোক যারা অশুভ অমঙ্গল চিহ্ন মানে না,যারা ঝাড়-ফুক করায় না, যারা মন্ত্রতন্ত্রের ধার ধারে না এবং আগুনে পোড়া লোহার দাগ লাগায় না ; বরং সদা সর্বদা তাদের পরোয়ারদেগারের উপর পূর্ণ ভরসা রাখে।(সহীহ বুখারী, হাদিস ৫৩৪১,৬২৮,৬০৯৯)\n\n"
                      "২২। যে ব্যক্তি নিষ্ঠার সাথে শহীদি মৃত্যু কামনা করে, আল্লাহ্ তাকে শহীদদের মর্যাদায় পৌছিয়ে দিবেন, যদিও সে তার বিছানায় মৃত্যুবরণ করে।(সহীহ মুসলিমঃ ৪৭৭৮)\n\n"
                      "২৩। যখন কোন ব্যক্তি তার ভাইয়ের অনুপস্থিতিতে তার জন্য দু’আ করে, তখন ফেরেশতাগণ বলেন, আমীন, এবং তোমার জন্যও অনুরুপ হবে।(সহীহ মুসলিম ও আবু দাউদ,হাঃ১৫৩৪)\n\n"
                      "২৪। কোন ব্যক্তির মন্দ হওয়ার জন্য অশ্লীল বাকচারী ও কৃপণ হওয়াই যথেষ্ট।(আহমাদ, মিশকাত হা/৪৬৯৩)\n\n"
                      "২৫। রাসূল বলেছেন: “যে ব্যক্তি প্রতি ফরয নামায শেষে আয়াতুল কুরসী পড়ে, তার জান্নাতে প্রবেশ করতে মৃত্যু ছাড়া কোন কিছু বাধা হবে না।(সহীহ আল্ জামে :৬৪৬৪, নাসায়ী, ইবনে হিব্বান, ত্বাবরানী, আল্লামা আলবানী রহ. এর সিলসিলাতুল আহাদিস আস-সহীহা খণ্ড দুই হাদিস নং-৯৭২)\n\n"
                      "২৬। যে ব্যক্তি উযূ করে এবং উযূকে পূরণাংগরুপে সম্পন্ন করে,তারপর কালেমা শাহাদাত পাঠ করে,তার জন্য জান্নাতের ৮(আট)টি দরজা খুলে যায় । সে যে দরজা দিয়ে ইচ্ছা জান্নাতে প্রবেশ করতে পারবে ।(সহিহ মুসলিমঃ ৪৬০, তিরমিযীঃ৫৫, ইবনু মাযাহঃ ৪৭০)\n\n"
                      "২৭। যে ব্যক্তি দিবসে ১ বার ও রাতে ১ বার আন্তরিকতার সাথে সােয়্যদুল ইস্তেগফার পাঠ করে যদি সে দিন বা রাতে মারা যায়, তাহলে ওই ব্যক্তি জান্নাতি ।(সহিহ বুখারী-৫৮৬৭)\n\n"
                      "২৮। ওযু করার সময় কেউ যদি উত্তমরূপে ওযু করে তাহলে তার শরীরের সব গুণাহ বের হয়ে যায়। এমনকি তার নখের নিচের গুণাহও বের হয়ে যায়।(সহীহ মুসলিমঃ ৪৮৪,৪৮৫)\n\n"
                      "২৯। রাসূল (সাঃ) ইরশাদ করেছেন, তোমাদের মধ্যে সে ব্যক্তি সর্বোত্তম যে কুরান শিখে এবং অন্যকে শিক্ষা দেয়।(সহীহ বুখারীঃ ৪৬৬১,৪৬৬২)\n\n"
                      "৩০। কুরআন পাঠে দক্ষ ব্যক্তি উচ্চ মর্যাদা ফিরিশতাদের সঙ্গী হবে। আর যে ব্যক্তি কুরাআন পড়ার সময় আটকে যায় এবং কষ্ট করে তিলাওয়াত করে তার জন্য রয়েছে দ্বিগুণ সওয়াব।(সহীহ বুখারী-৪৯৩৭, মুসলিম আবু দাউদ -১৪৫৪ ক্বাতাদাহ হতে)\n\n"
                      "৩১। রাসূল্লাহ (সাঃ) বলেছেন, যখন তোমাদের কেউ মসজিদে প্রবেশ করবে, তখন সে যেন দু’রাকাত সালাত আদায় করা ব্যতীত না বসে।(বুখারী হা/৪৪৪ , ১১৬৭ ; মুসলিম হা/ ৭১৪ ; তিরমিযী হা/ ৩১৬ ; নাসাঈ হা/ ৭৩০ ;আবু দাউদ হা/ ৪৬৭ ; ইবনু মাজাহ হা/ ১১২৩ ; আহমাদ হা/ ২২০১৭ , ২২০৭২ , ২২০৮৮ , ২২১৪৬ ;দারেমী হা/ ১৩৯৩)\n\n"
                      "৩২। রাসূল (সাঃ) বলেছেনঃ আমার প্রত্যেক উম্মতের গুণাহ মাফ হবে, তবে যে গুণাহ করে বলে বেড়ায়, তার গুনাহ মাফ হবে না।(সহীহ বুখারীঃ ৫৬৪৩, সহীহ মুসলিমঃ ৭২৬৭)\n\n"
                      "৩৩। ইউসায়রাহ (রাঃ) সূত্রে বর্ণিত। নবী (সাঃ) তাদেরকে নির্দেশ দিয়েছেনঃ তোমরা তাকবীর, তাকদীস এবং তাহলীল এগুলো খুব ভালভাবে স্মরণে রাখবে এবং এগুলোকে আঙ্গুলে গুনে রাখবে।কেননা আঙ্গুলগুলোকে জিজ্ঞাসা করা হবে এবং এগুলোও সেদিন (ক্বিয়ামতে) কথা বলবে।[(আবু দাউদ, হা/১৫০১, আলবানীর মতে হাসান, তিরমিযী, হা/৩৫৮৫, তিরমিযীর মতে গরীব, আহমাদ,৬/৩৭০)]\n\n"
                      "৩৪। যে ব্যক্তি দুনিয়াতে কোন ব্যক্তির দোষ-ত্রুটি গোপন রাখবে কিয়ামতের দিন আল্লাহ্ তা’আলাও তার ত্রুটি গোপন রাখবেন।(সহীহ মুসলিমঃ ৬৩৯২,৬৪০৮,৬৩০৯)\n\n"
                      "৩৫। বিদাতী হাউজে কাওছারের পানি পাবে না।(সহীহ বুখারীঃ ৬১২৭,৬৫৭৩, মুসলিমঃ ৫৭৯৯, ৫৮০২, ৫৮০৩)\n\n"
                      "৩৬। যে ব্যক্তি নম্রতা ও সহনশীলতার বৈশিষ্ট্য থেকে বঞ্চিত সে কল্যান থেকে বঞ্চিত।(সহীহ মুসলিমঃ ৬৪১২,৬৪১৩,৬৪১৪)\n\n"
                      "৩৭। মানুষের মধ্যে সর্বাপেক্ষা নিকৃষ্ট হল ‘দ্বিমুখী ব্যক্তি’। তারা এদের কাছে বলে এক কথা আর ওদের কাছে বলে আর এক কথা।(সহীহ বুখারীঃ ৬৬৯০)\n\n"
                      "৩৮। নেশা সৃষ্টি করে এমন যে কোন পানীয় হারাম।[সহীহ বুখারীঃ ৫২৫৮, সহীহ মুসলিমঃ ৫০৫১, ৫০৫২, ৫০৫৩, ৫০৫৪]\n\n"
                      "৩৯। রাসূল (সাঃ) বলেছেন যে ব্যক্তি তার দু’চোয়ালের মাঝখান (অর্থাৎ জিহ্ববা) এবং দু’পায়ের মাঝখান (অর্থাৎ লজ্জাস্থান)- এর জামানত আমাকে দিবে, আমি তার জান্নাতের জামিন হব।[সহীহ বুখারীঃ ৬০৩০, মিশকাত হাঃ৪৬০১]\n\n"
                      "৪০। ঈমানের সত্তরের কিছু বেশী শাখার মধ্যে সর্বোত্তম শাখা হচ্ছে ‘লা-ইলাহা ইল্লাল্লাহু’ বলা এবং সাধারণ শাখা হচ্ছে চলার পথ থেকে কষ্টদায়ক বস্তু সরিয়ে দেয়া। আর লজ্জা হচ্ছে ঈমানের একটি বিশেষ শাখা।[সহীহ মুসলিমঃ ৬১]",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: _bvalue),
                    ),
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
          );
  }


}
