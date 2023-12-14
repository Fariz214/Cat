import 'package:ckm/common/styles/spacing_style.dart';
import 'package:ckm/common/widgets/login_widgets/button.dart';
import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image,title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CKMSpacingStyle.paddingwithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(height: CKMSizes.spaceBtwItems),

              // Title & Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwItems,),
              Text(subTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwSections,),
              
              // Button
              ButtonAuthentication(onPressed: () => AuthenticationRepository.instance.screenRedirect() , text: 'Continue',),
              const SizedBox(height: CKMSizes.spaceBtwSections),
            
            ],
          )
        ),
      ),
    );
  }
}