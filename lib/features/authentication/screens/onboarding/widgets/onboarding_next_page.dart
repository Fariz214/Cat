import 'package:ckm/features/authentication/controllers/onboarding/controller_onboarding.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/device/device_utility.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Positioned(
      right: CKMSizes.defaultSpace,
      bottom: CKMDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark? CKMColors.secondary : CKMColors.primary,side: BorderSide.none),
        child: Icon(Iconsax.arrow_right_3, color: dark? CKMColors.black: CKMColors.white),
      ) 
    );
  }
}

