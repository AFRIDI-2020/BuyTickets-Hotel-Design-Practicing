import 'package:flutter/foundation.dart';
import 'package:testing01/controllers/data/data_handle.dart';
import 'package:testing01/models/appbar_files_model.dart';
import 'package:testing01/models/hotel_model.dart';

class HomePageProvider extends ChangeNotifier {
  /*---------------> Setting up the variables <------------------*/
  final _appBarFile = AppbarFilesModel(
    location: 'DUBAI, UNITED ARAB EMIRATES',
    bookingDate: '2 Feb',
    adultCount: 2,
    roomCount: 1,
    durationStaying: '24 - 15 Feb, 24',
    nightCount: 10,
  );

  String _localeId = 'en';

  bool _darkTheme = false;

  bool _dataLoading = true;

  HotelModel hotels = HotelModel();

  /*---------------> Returning the variables <------------------*/

  String get localeId => _localeId;

  bool get darkTheme => _darkTheme;

  bool get dataLoading => _dataLoading;

  AppbarFilesModel get appbarFilesModel => _appBarFile;

  /*---------------> Assigning the variables <------------------*/

  void setLocale({required String value}) {
    _localeId = value;
    notifyListeners();
  }

  Future<void> setHotelsModel() async {
    hotels = await DataHandle.fetchData();
    _dataLoading = false;
    notifyListeners();
  }

  void setTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }
}
