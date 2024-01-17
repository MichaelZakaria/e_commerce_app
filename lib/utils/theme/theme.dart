import 'package:flutter/material.dart';
import 'custom_theme/my_appbar_theme.dart';
import 'custom_theme/my_bottom_sheet_theme.dart';
import 'custom_theme/my_check_box_theme.dart';
import 'custom_theme/my_chip_theme.dart';
import 'custom_theme/my_elevated_button_theme.dart';
import 'custom_theme/my_outlined_button.dart';
import 'custom_theme/my_text_field_theme.dart';
import 'custom_theme/my_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MYAppbarTheme.lightAppbarTheme,
    bottomSheetTheme: MYBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: MyCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.lightTextFormFieldTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MYAppbarTheme.darkAppbarTheme,
    bottomSheetTheme: MYBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: MyCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkTextFormFieldTheme,
  );

}