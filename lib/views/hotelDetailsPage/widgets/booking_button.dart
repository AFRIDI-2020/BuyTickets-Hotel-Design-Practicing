import 'package:flutter/material.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({super.key, required this.title, required this.bookingPressed});

  final String title;
  final Function() bookingPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: bookingPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
