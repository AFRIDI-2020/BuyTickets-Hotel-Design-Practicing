import 'package:flutter/material.dart';

ElevatedButton bookingButton() {
  return ElevatedButton(
    style: const ButtonStyle().copyWith(
        backgroundColor: const MaterialStatePropertyAll(Colors.blue)),
    onPressed: () {},
    child: const Text(
      'Book',
      style: TextStyle(color: Colors.white),
    ),
  );
}
