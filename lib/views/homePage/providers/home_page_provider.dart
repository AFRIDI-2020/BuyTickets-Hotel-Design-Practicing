import 'package:flutter/foundation.dart';
import 'package:testing01/controllers/data/data_handle.dart';
import 'package:testing01/models/appbar_files_model.dart';
import 'package:testing01/models/hotel_model.dart';

class HomePageProvider extends ChangeNotifier {
  final _appBarFile = AppbarFilesModel(
    location: 'DUBAI, UNITED ARAB EMIRATES',
    bookingDate: '2 Feb',
    adultCount: 2,
    roomCount: 1,
    durationStaying: '24 - 15 Feb, 24',
    nightCount: 10,
  );

  bool _dataLoading = true;

  HotelModel hotels = HotelModel();

  bool get dataLoading => _dataLoading;

  AppbarFilesModel get appbarFilesModel => _appBarFile;

  // ==================>
  // Fetching Data From DataHandler
  // ==================>
  Future<void> setHotelsModel() async {
    hotels = await DataHandle.fetchData();
    _dataLoading = false;
    notifyListeners();
  }
}
