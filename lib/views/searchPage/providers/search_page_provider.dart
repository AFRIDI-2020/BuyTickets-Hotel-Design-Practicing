import 'package:flutter/material.dart';
import 'package:testing01/models/hotel_value.dart';

class SearchPageProvider extends ChangeNotifier {
  List _searchList = [];

  List get searchList => _searchList;

  void searchingItems(
      {required String searchText, required List<HotelValue> hotelList}) {
    _searchList.clear();
    _searchList = hotelList
        .where((element) =>
            element.name!.toLowerCase().contains(searchText) ||
            element.location!.toLowerCase().contains(searchText))
        .toList();
  }
}
