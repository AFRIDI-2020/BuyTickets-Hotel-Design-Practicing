import 'package:flutter/material.dart';

Column hotelData({required String title, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
      Text(
        'BDT $value',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
