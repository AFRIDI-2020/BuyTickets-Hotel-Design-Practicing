import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelRating extends StatelessWidget {
  const HotelRating({super.key, required this.title, required this.rate});

  final String title;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
        RatingBar.builder(
          itemSize: 20,
          itemCount: 5,
          initialRating: rate,
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
