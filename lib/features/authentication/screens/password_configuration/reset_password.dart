import 'package:ckm/features/authentication/screens/login/login_screen.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CKMSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage(CKMImages.deliveredEmailIllustration), width: CKMHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: CKMSizes.spaceBtwItems),

              // Title & Subtitle
              Text(CKMTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwItems,),
              Text(CKMTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwSections,),
              
              // Button
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(onPressed: (){}, child: const Text(CKMTexts.done))),
              const SizedBox(height: CKMSizes.spaceBtwItems),
              // Resend Email
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(CKMTexts.resendEmail))),
            
            ],
          ),
        ),
      ),
    );
  }
}