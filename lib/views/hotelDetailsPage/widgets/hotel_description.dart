import 'package:flutter/material.dart';

class HotelDescription extends StatelessWidget {
  const HotelDescription({super.key, required this.hotelName});

  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return Text("$hotelName offers you a privileged experience combining comfort and conviviality. Whether you are a backpacker, a solo traveler or with your family, our hotel with top-of-the-range service will meet all your expectations. More than just a hotel, $hotelName offers you a place to live and meet people.The $hotelName hotel offers a complete experience with common areas that allow you to meet new people in a unique atmosphere. Lounge area, Ping Pong table, table soccer, darts & Boiler room: we told you, it’s not a hotel like the others, it’s a sharing hotel.");
  }
}
