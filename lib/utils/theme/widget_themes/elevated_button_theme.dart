import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class CKMElevatedButtonTheme {
  CKMElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CKMColors.light,
      backgroundColor: CKMColors.primary,
      disabledForegroundColor: CKMColors.darkGrey,
      disabledBackgroundColor: CKMColors.buttonDisabled,
      side: const BorderSide(color: CKMColors.primary),
      padding: const EdgeInsets.symmetric(vertical: CKMSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: CKMColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CKMSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CKMColors.light,
      backgroundColor: CKMColors.primary,
      disabledForegroundColor: CKMColors.darkGrey,
      disabledBackgroundColor: CKMColors.darkerGrey,
      side: const BorderSide(color: CKMColors.primary),
      padding: const EdgeInsets.symmetric(vertical: CKMSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: CKMColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CKMSizes.buttonRadius)),
    ),
  );
}
