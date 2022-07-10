// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


class DataResponse {
  DataResponse({
    this.success,

    this.msg,

  });

  bool success;

  String msg;


  factory DataResponse.fromJson(Map<String, dynamic> json) => DataResponse(
    success: json["success"],
    msg: json["msg"],

  );

  Map<String, dynamic> toJson() => {
    "success": success,

    "msg": msg,

  };
}

class Data {
  Data({
    this.name,
    this.phoneNumber,
    this.startTime,
    this.endTime,
    this.date,
    this.id,
    this.v,
  });

  String name;
  String phoneNumber;
  String startTime;
  String endTime;
  String date;
  String id;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    date: json["date"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phoneNumber": phoneNumber,
    "startTime": startTime,
    "endTime": endTime,
    "date": date,
    "_id": id,
    "__v": v,
  };
}
