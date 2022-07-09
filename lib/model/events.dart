// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';



class DataModel {
  DataModel({
    this.success,
    this.data,
    this.msg,
    this.errors,
  });

  bool success;
  List<Datum> data;
  String msg;
  List<dynamic> errors;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    msg: json["msg"],
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {

    "data": List<dynamic>.from(data.map((x) => x.toJson())),


  };
}

class Datum {
  Datum({

    this.name,
    this.phoneNumber,
    this.startTime,
    this.endTime,
    this.date,
  });


  String name;
  String phoneNumber;
  String startTime;
  String endTime;
  String date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(

    name: json["name"],
    phoneNumber: json["phoneNumber"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {

    "name": name,
    "phoneNumber": phoneNumber,
    "startTime": startTime,
    "endTime": endTime,
    "date": date,
  };
}
