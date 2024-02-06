import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:testing01/models/hotel_model.dart';

class DataHandle {
  // ===================>
  // Fetching Data From Json File
  // ===================>
  static Future<HotelModel> fetchData() async {
    var jsonData = await rootBundle.loadString('assets/json/hotels_json.json');
    var data = await json.decode(jsonData);
    HotelModel hotelModel = HotelModel.fromJson(data);
    return hotelModel;
  }
}
