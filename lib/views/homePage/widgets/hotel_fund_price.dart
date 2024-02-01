import 'package:flutter/material.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';

Row hotelFundAndPrice(HomePageProvider homePageProvider, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        homePageProvider.hotels.value![index].fundAble!
            ? "Refundable"
            : "Non Refundable",
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        'BDT ${homePageProvider.hotels.value![index].price}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      )
    ],
  );
}
