// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

import 'hotel_value.dart';

HotelModel hotelModelFromJson(String str) =>
    HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
  int? status;
  String? msg;
  List<HotelValue>? value;

  HotelModel({
    this.status,
    this.msg,
    this.value,
  });

  HotelModel copyWith({
    int? status,
    String? msg,
    List<HotelValue>? value,
  }) =>
      HotelModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        value: value ?? this.value,
      );

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        status: json["status"],
        msg: json["msg"],
        value: json["value"] == null
            ? []
            : List<HotelValue>.from(json["value"]!.map((x) => HotelValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "value": value == null
            ? []
            : List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

