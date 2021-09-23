// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

class Welcome {
  Welcome({
    this.index,
    this.ayas,
    this.start,
    this.end,
    this.name,
    this.tname,
    this.ename,
    this.type,
    this.order,
    this.orderalphabet,
    this.orderquran,
    this.word,
    this.theletter,
    this.startjuz,
    this.endjuz,
    this.startpage,
    this.endpage,
  });

  String? index;
  String? ayas;
  String? start;
  dynamic end;
  String? name;
  String? tname;
  String? ename;
  String? type;
  String? order;
  dynamic orderalphabet;
  dynamic orderquran;
  String? word;
  String? theletter;
  String? startjuz;
  String? endjuz;
  String? startpage;
  String? endpage;

  factory Welcome.fromJson(Map<String, dynamic> json) =>
      Welcome(
        index: json["index"],
        ayas: json["ayas"],
        start: json["start"],
        end: json["end"],
        name: json["name"],
        tname: json["tname"],
        ename: json["ename"],
        type: json["type"],
        order: json["order"],
        orderalphabet: json["orderalphabet"],
        orderquran: json["orderquran"],
        word: json["word"],
        theletter: json["theletter"],
        startjuz: json["startjuz"],
        endjuz: json["endjuz"],
        startpage: json["startpage"],
        endpage: json["endpage"],
      );
}