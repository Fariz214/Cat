
import 'package:ckm/features/authentication/controllers/onboarding/controller_onboarding.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/device/device_utility.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardIndicator extends StatelessWidget {
  const OnboardIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = CKMHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: CKMDeviceUtils.getBottomNavigationBarHeight() +25,
      left: CKMSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick, 
        effect: ExpandingDotsEffect(activeDotColor: dark ? CKMColors.secondary: CKMColors.primary, 
        dotHeight:6))
        ,);
  }
}

