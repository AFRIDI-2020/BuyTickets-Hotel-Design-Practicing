// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

HotelModel hotelModelFromJson(String str) =>
    HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
  int? status;
  String? msg;
  List<Value>? value;

  HotelModel({
    this.status,
    this.msg,
    this.value,
  });

  HotelModel copyWith({
    int? status,
    String? msg,
    List<Value>? value,
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
            : List<Value>.from(json["value"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "value": value == null
            ? []
            : List<dynamic>.from(value!.map((x) => x.toJson())),
      };
}

class Value {
  int? id;
  String? name;
  String? image;
  int? rating;
  String? location;
  bool? fundAble;
  int? price;

  Value({
    this.id,
    this.name,
    this.image,
    this.rating,
    this.location,
    this.fundAble,
    this.price,
  });

  Value copyWith({
    int? id,
    String? name,
    String? image,
    int? rating,
    String? location,
    bool? fundAble,
    int? price,
  }) =>
      Value(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        location: location ?? this.location,
        fundAble: fundAble ?? this.fundAble,
        price: price ?? this.price,
      );

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        rating: json["rating"],
        location: json["location"],
        fundAble: json["fund-able"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "rating": rating,
        "location": location,
        "fund-able": fundAble,
        "price": price,
      };
}
