
import 'package:ckm/features/authentication/controllers/onboarding/controller_onboarding.dart';
import 'package:ckm/features/authentication/screens/onboarding/widgets/onboarding_indicator.dart';
import 'package:ckm/features/authentication/screens/onboarding/widgets/onboarding_next_page.dart';
import 'package:flutter/material.dart';
import 'package:ckm/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ckm/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Page Scroll
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: CKMImages.onBoardingImage1, 
                title: CKMTexts.onBoardingTitle1, 
                subTitle: CKMTexts.onBoardingSubTitle1
              ),
              OnboardingPage(
                image: CKMImages.onBoardingImage2, 
                title: CKMTexts.onBoardingTitle2, 
                subTitle: CKMTexts.onBoardingSubTitle2
              ),
              OnboardingPage(
                image: CKMImages.onBoardingImage3, 
                title: CKMTexts.onBoardingTitle3, 
                subTitle: CKMTexts.onBoardingSubTitle3
              ),
              
            ],
          ),
          
          /// Tombol Skip
          const OnboardSkip(),
          
          /// Dot Navigasi
          const OnboardIndicator(),

          /// Tombol Next
          const OnboardingNextButton(),
        
          
        ],
      ),
    );
  }
}

