import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:testing01/models/hotel_value.dart';
import 'package:testing01/views/homePage/widgets/hotel_image.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/booking_button.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_data.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_image.dart';
import 'package:testing01/views/hotelDetailsPage/widgets/hotel_rating.dart';

class HotelDetailsPageView extends StatelessWidget {
  const HotelDetailsPageView({super.key, required this.hotelValue});

  final HotelValue hotelValue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hotelImage(screenSize, hotelValue.image!),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelValue.name!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(hotelValue.location!),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    hotelData(
                        title: 'Price', value: hotelValue.price!.toString()),
                    rating(hotelValue.rating!.toDouble()),
                    bookingButton()
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: screenSize.width,
            child: bookingButton(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
