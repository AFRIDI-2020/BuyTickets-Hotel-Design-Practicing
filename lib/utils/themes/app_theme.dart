import 'package:flutter/material.dart';
import 'package:testing01/utils/themes/icon_theme.dart';
import 'package:testing01/utils/themes/text_theme.dart';

import 'appbar_theme.dart';
import 'bottom_sheet_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'elevated_button_theme.dart';
import 'input_decoration_theme.dart';
import 'outlined_ button_theme.dart';

class AppBaseTheme {
  AppBaseTheme._();

  /*-----------------> Light Theme Setup <----------------*/
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'ProtestGuerrilla',
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppsAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: BottomSheetTheme.lightBottomSheet,
    checkboxTheme: AppsCheckBoxTheme.lightCheckBoxThemeData,
    chipTheme: AppsChipTheme.lightChipTheme,
    elevatedButtonTheme: AppsElevatedButtonTheme.lightElevatedButtonThemeData,
    inputDecorationTheme: AppsInputDecorationTheme.lightInputDecorationThemeData,
    outlinedButtonTheme: AppsOutlinedButtonTheme.lightOutlinedButtonTheme,
    iconTheme: AppsIconTheme.lightIconTheme,
  );

  /*-----------------> Dark Theme Setup <----------------*/
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'ProtestGuerrilla',
    textTheme: AppTextTheme.darkTextTheme,
    appBarTheme: AppsAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: BottomSheetTheme.darkBottomSheet,
    checkboxTheme: AppsCheckBoxTheme.darkCheckBoxThemeData,
    chipTheme: AppsChipTheme.darkChipTheme,
    elevatedButtonTheme: AppsElevatedButtonTheme.darkElevatedButtonThemeData,
    inputDecorationTheme: AppsInputDecorationTheme.darkInputDecorationThemeData,
    outlinedButtonTheme: AppsOutlinedButtonTheme.darkOutlinedButtonTheme,
    iconTheme: AppsIconTheme.darkIconTheme,
  );
}
