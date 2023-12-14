import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CKMSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: CKMHelperFunctions.screenWidth()*0.8,
            height: CKMHelperFunctions.screenHeight()*0.6,
            image: AssetImage(image)
          ),
          Text(title,style:  Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),  
          const SizedBox(height: CKMSizes.spaceBtwItems),
          Text(subTitle,style:  Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),  
        ],
      ),
    );
  }
}