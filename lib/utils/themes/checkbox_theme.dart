import 'package:flutter/material.dart';

class AppsCheckBoxTheme {
  AppsCheckBoxTheme._();

  /*-----------------------> Light Theme Data <---------------------*/
  static CheckboxThemeData lightCheckBoxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.red;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /*-----------------------> Dark Theme Data <---------------------*/
  static CheckboxThemeData darkCheckBoxThemeData = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.red;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
