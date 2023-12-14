
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Loaders {
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CKMHelperFunctions.isDarkMode(Get.context!) ? CKMColors.darkerGrey.withOpacity(0.9): CKMColors.grey.withOpacity(0.9),
          ),
        ),));
  }

  static succesSnackBar({required title, message =''}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: CKMColors.black,
      backgroundColor: CKMColors.white.withOpacity(0.8),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin:  const EdgeInsets.all(20),
      icon: const Icon(Iconsax.tick_circle, color: CKMColors.black,)
      );
  }

  static warningSnackBar({required title, message =''}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: CKMColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin:  const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: CKMColors.white,)
      );
  }

  static errorSnackBar({required title, message =''}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: CKMColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin:  const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: CKMColors.white,)
      );
  }
  
}