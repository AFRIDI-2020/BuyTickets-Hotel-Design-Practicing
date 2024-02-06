import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';

class HotelNameAndRate extends StatelessWidget {
  const HotelNameAndRate({super.key, required this.hotelName, required this.rateValue});

  final String hotelName;
  final double rateValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          hotelName,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        RatingBar.builder(
          itemSize: 20,
          itemCount: 5,
          initialRating: rateValue,
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
}

