import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Column rating(double rate) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Rating',
        style: TextStyle(color: Colors.grey),
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
