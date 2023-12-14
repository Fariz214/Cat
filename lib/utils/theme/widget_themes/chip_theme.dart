import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CKMChipTheme {
  CKMChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: CKMColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: CKMColors.black),
    selectedColor: CKMColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CKMColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CKMColors.darkerGrey,
    labelStyle: TextStyle(color: CKMColors.white),
    selectedColor: CKMColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CKMColors.white,
  );
}
