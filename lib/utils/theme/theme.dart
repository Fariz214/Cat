import 'package:flutter/material.dart';
import 'package:ckm/utils/theme/widget_themes/appbar_theme.dart';
import 'package:ckm/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:ckm/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:ckm/utils/theme/widget_themes/chip_theme.dart';
import 'package:ckm/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:ckm/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:ckm/utils/theme/widget_themes/text_field_theme.dart';
import 'package:ckm/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: CKMColors.grey,
    brightness: Brightness.light,
    primaryColor: CKMColors.primary,
    textTheme: CKMTextTheme.lightTextTheme,
    chipTheme: CKMChipTheme.lightChipTheme,
    scaffoldBackgroundColor: CKMColors.white,
    appBarTheme: CKMAppBarTheme.lightAppBarTheme,
    checkboxTheme: CKMCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CKMBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CKMElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CKMOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CKMTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: CKMColors.grey,
    brightness: Brightness.dark,
    primaryColor: CKMColors.primary,
    textTheme: CKMTextTheme.darkTextTheme,
    chipTheme: CKMChipTheme.darkChipTheme,
    scaffoldBackgroundColor: CKMColors.black,
    appBarTheme: CKMAppBarTheme.darkAppBarTheme,
    checkboxTheme: CKMCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CKMBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CKMElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CKMOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CKMTextFormFieldTheme.darkInputDecorationTheme,
  );
}
