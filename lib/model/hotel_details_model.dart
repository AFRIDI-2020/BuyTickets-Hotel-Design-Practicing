// To parse this JSON data, do
//
//     final hotelDetailsModel = hotelDetailsModelFromJson(jsonString);

import 'dart:convert';

List<HotelDetailsModel> hotelDetailsModelFromJson(String str) => List<HotelDetailsModel>.from(json.decode(str).map((x) => HotelDetailsModel.fromJson(x)));

String hotelDetailsModelToJson(List<HotelDetailsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelDetailsModel {
  String countryAddress;
  List<HotelDetail> hotelDetails;

  HotelDetailsModel({
    required this.countryAddress,
    required this.hotelDetails,
  });

  factory HotelDetailsModel.fromJson(Map<String, dynamic> json) => HotelDetailsModel(
    countryAddress: json["CountryAddress"],
    hotelDetails: List<HotelDetail>.from(json["HotelDetails"].map((x) => HotelDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CountryAddress": countryAddress,
    "HotelDetails": List<dynamic>.from(hotelDetails.map((x) => x.toJson())),
  };
}

class HotelDetail {
  int id;
  String hotelName;
  String hotelImage;
  String hotelAddress;
  double hotelRatingStar;
  int price;

  HotelDetail({
    required this.id,
    required this.hotelName,
    required this.hotelImage,
    required this.hotelAddress,
    required this.hotelRatingStar,
    required this.price,
  });

  factory HotelDetail.fromJson(Map<String, dynamic> json) => HotelDetail(
    id: json["ID"],
    hotelName: json["HotelName"],
    hotelImage: json["HotelImage"],
    hotelAddress: json["HotelAddress"],
    hotelRatingStar: json["HotelRatingStar"]?.toDouble(),
    price: json["Price"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "HotelName": hotelName,
    "HotelImage": hotelImage,
    "HotelAddress": hotelAddress,
    "HotelRatingStar": hotelRatingStar,
    "Price": price,
  };
}
