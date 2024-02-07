import 'package:flutter/material.dart';

class AppsAppBarTheme {
  AppsAppBarTheme._();

  /*-----------------> Light Theme Setup <----------------*/
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.red,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
  );

  /*-----------------> Dark Theme Setup <----------------*/
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.red.withOpacity(0.5),
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
  );
}