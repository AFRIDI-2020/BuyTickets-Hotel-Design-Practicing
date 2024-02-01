import 'package:flutter/material.dart';

import '../providers/home_page_provider.dart';

Padding totalHotelNumber(HomePageProvider homePageProvider) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 3),
    child: Text('${homePageProvider.hotels.value!.length} Available Hotels'),
  );
}
