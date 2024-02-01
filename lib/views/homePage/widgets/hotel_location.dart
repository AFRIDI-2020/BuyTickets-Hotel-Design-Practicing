import 'package:flutter/material.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';

Row hotelLocation(
    Size screenSize, HomePageProvider homePageProvider, int index) {
  return Row(
    children: [
      const Icon(Icons.location_on),
      const SizedBox(width: 10),
      SizedBox(
        width: screenSize.width * .75,
        child: Text(
          homePageProvider.hotels.value![index].location!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}