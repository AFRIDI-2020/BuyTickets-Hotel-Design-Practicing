import 'package:flutter/material.dart';

class AppsIconTheme {
  AppsIconTheme._();

  /*-----------------------> Apps Light Icon Theme <----------------------*/
  static final lightIconTheme = const IconThemeData().copyWith(
    size: 30,
    color: Colors.black,
  );

  /*-----------------------> Apps Dark Icon Theme <----------------------*/
  static final darkIconTheme = const IconThemeData().copyWith(
    size: 30,
    color: Colors.white,
  );
}