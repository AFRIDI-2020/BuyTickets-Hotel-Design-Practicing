import 'package:flutter/material.dart';

class HotelValue {
  int? id;
  String? name;
  String? image;
  int? rating;
  String? location;
  bool? fundAble;
  int? price;

  HotelValue({
    this.id,
    this.name,
    this.image,
    this.rating,
    this.location,
    this.fundAble,
    this.price,
  });

  HotelValue copyWith({
    int? id,
    String? name,
    String? image,
    int? rating,
    String? location,
    bool? fundAble,
    int? price,
  }) =>
      HotelValue(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        location: location ?? this.location,
        fundAble: fundAble ?? this.fundAble,
        price: price ?? this.price,
      );

  factory HotelValue.fromJson(Map<String, dynamic> json) => HotelValue(
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
