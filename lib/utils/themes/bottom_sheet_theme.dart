import 'package:flutter/material.dart';

class BottomSheetTheme {
  BottomSheetTheme._();

  /*-----------------> Light Theme Setup <----------------*/
  static BottomSheetThemeData lightBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  /*-----------------> Dark Theme Setup <----------------*/
  static BottomSheetThemeData darkBottomSheet = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}