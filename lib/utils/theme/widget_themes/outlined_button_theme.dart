import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class CKMOutlinedButtonTheme {
  CKMOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: CKMColors.dark,
      side: const BorderSide(color: CKMColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: CKMColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CKMSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CKMSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CKMColors.light,
      side: const BorderSide(color: CKMColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: CKMColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CKMSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CKMSizes.buttonRadius)),
    ),
  );
}
