import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';

Row hotelNameAndRate(HomePageProvider homePageProvider, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        homePageProvider.hotels.value![index].name!,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      RatingBar.builder(
        itemSize: 20,
        itemCount: 5,
        initialRating: homePageProvider.hotels.value![index].rating!.toDouble(),
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star,
            color: Colors.red,
            size: 15,
          );
        },
        onRatingUpdate: (double value) {},
      ),
    ],
  );
}
