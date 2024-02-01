// To parse this JSON data, do
//
//     final appbarFilesModel = appbarFilesModelFromJson(jsonString);

import 'dart:convert';

AppbarFilesModel appbarFilesModelFromJson(String str) =>
    AppbarFilesModel.fromJson(json.decode(str));

String appbarFilesModelToJson(AppbarFilesModel data) =>
    json.encode(data.toJson());

class AppbarFilesModel {
  String? location;
  String? bookingDate;
  String? durationStaying;
  int? roomCount;
  int? adultCount;
  int? nightCount;

  AppbarFilesModel({
    this.location,
    this.bookingDate,
    this.durationStaying,
    this.roomCount,
    this.adultCount,
    this.nightCount,
  });

  AppbarFilesModel copyWith({
    String? location,
    String? bookingDate,
    String? durationStaying,
    int? roomCount,
    int? adultCount,
    int? nightCount,
  }) =>
      AppbarFilesModel(
        location: location ?? this.location,
        bookingDate: bookingDate ?? this.bookingDate,
        durationStaying: durationStaying ?? this.durationStaying,
        roomCount: roomCount ?? this.roomCount,
        adultCount: adultCount ?? this.adultCount,
        nightCount: nightCount ?? this.nightCount,
      );

  factory AppbarFilesModel.fromJson(Map<String, dynamic> json) =>
      AppbarFilesModel(
        location: json["location"],
        bookingDate: json["bookingDate"],
        durationStaying: json["durationStaying"],
        roomCount: json["roomCount"],
        adultCount: json["adultCount"],
        nightCount: json["nightCount"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "bookingDate": bookingDate,
        "durationStaying": durationStaying,
        "roomCount": roomCount,
        "adultCount": adultCount,
        "nightCount": nightCount,
      };
}
