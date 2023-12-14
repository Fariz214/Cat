import 'package:flutter/material.dart';
import 'package:ckm/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class CKMTextFormFieldTheme {
  CKMTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CKMColors.darkGrey,
    suffixIconColor: CKMColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: CKMSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CKMSizes.fontSizeMd, color: CKMColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: CKMSizes.fontSizeSm, color: CKMColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: CKMColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CKMColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: CKMColors.darkGrey,
    suffixIconColor: CKMColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: CKMSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CKMSizes.fontSizeMd, color: CKMColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: CKMSizes.fontSizeSm, color: CKMColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: CKMColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CKMColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CKMSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CKMColors.warning),
    ),
  );
}
