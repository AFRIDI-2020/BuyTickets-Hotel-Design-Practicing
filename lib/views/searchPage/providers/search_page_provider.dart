import 'package:flutter/foundation.dart';
import 'package:testing01/models/hotel_value.dart';

class SearchPageProvider extends ChangeNotifier {
  List<HotelValue> _searchList = [];

  List<HotelValue> get searchList => _searchList;

  void setSearchValues({required List<HotelValue> hotels}) {
    _searchList.clear();
    _searchList = hotels;
    notifyListeners();
  }

  void setSearchValuesWhileSearching({required HotelValue value}) {
    _searchList.add(value);
    notifyListeners();
  }

  void clearSearchItems() {
    _searchList.clear();
    notifyListeners();
  }
}
