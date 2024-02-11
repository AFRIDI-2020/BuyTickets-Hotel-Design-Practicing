import 'dart:core';
import 'dart:core';

import 'package:buy_tickets_list/widget/elevated_button_widget.dart';
import 'package:buy_tickets_list/widget/hotel_info_card.dart';
import 'package:flutter/material.dart';

class BookingRoomScreen extends StatefulWidget {
  final String hotelImage;
  final String hotelName;
  final double hotelStarRating;
  final String hotelAddress;
  final String price;

  // final String hotelImage;
  // String hotelName,
  // double hotelStarRating,
  //     String hotelAddress,
  // String price
  const BookingRoomScreen(
      {super.key,
      required this.hotelImage,
      required this.hotelName,
      required this.hotelStarRating,
      required this.hotelAddress,
      required this.price});

  @override
  State<BookingRoomScreen> createState() => _BookingRoomScreenState();
}

class _BookingRoomScreenState extends State<BookingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dhaka,Banglades"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: HotelInformationCardWidget(
                hotelImage: widget.hotelImage,
                hotelName: widget.hotelName,
                hotelStarRating: widget.hotelStarRating,
                hotelAddress: widget.hotelAddress,
                price: widget.price,
              ),
            ),
            Spacer(),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonWidget(
                  text: 'Select Room',
                  backgroundColor: Colors.red,
                  onTap: () {},
                  textColor: Colors.white,
                ))

          ],
        ),
      ),
    );
  }
}

