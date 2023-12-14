import 'package:flutter/material.dart';
import 'package:ckm/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class CKMAppBarTheme{
  CKMAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: CKMColors.black, size: CKMSizes.iconMd),
    actionsIconTheme: IconThemeData(color: CKMColors.black, size: CKMSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: CKMColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: CKMColors.black, size: CKMSizes.iconMd),
    actionsIconTheme: IconThemeData(color: CKMColors.white, size: CKMSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: CKMColors.white),
  );
}