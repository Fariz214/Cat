import 'package:ckm/features/authentication/controllers/onboarding/controller_onboarding.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/device/device_utility.dart';
import 'package:flutter/material.dart';


class OnboardSkip extends StatelessWidget {
  const OnboardSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(

      top: CKMDeviceUtils.getAppBarHeight(),
      right: CKMSizes.defaultSpace, 
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
        )
    );
  }
}