import 'package:flutter/material.dart';
import 'package:testing01/views/homePage/providers/home_page_provider.dart';

class HotelLocation extends StatelessWidget {
  const HotelLocation({super.key, required this.containerWidth, required this.hotelLocation});

  final double containerWidth;
  final String hotelLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on),
        const SizedBox(width: 10),
        SizedBox(
          width: containerWidth,
          child: Text(
            hotelLocation,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
