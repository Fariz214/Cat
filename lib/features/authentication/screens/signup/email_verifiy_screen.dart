import 'package:ckm/common/widgets/login_widgets/button.dart';
import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))

        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CKMSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(CKMImages.deliveredEmailIllustration), 
                width: CKMHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: CKMSizes.spaceBtwItems),

              // Title & Subtitle
              Text(CKMTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwItems,),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwItems,),
              Text(CKMTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: CKMSizes.spaceBtwSections,),
              
              // Button
              ButtonAuthentication(
                onPressed: () => controller.checkEmailVerificationStatus(), 
                text: 'Continue',),
                const SizedBox(height: CKMSizes.spaceBtwItems),

              // Resend Email
              ButtonAuthentication(onPressed: () => controller.sendEmailVerification(), text: 'Resend Email',),
              const SizedBox(height: CKMSizes.spaceBtwSections),
            ],
          )
        ),
      ),
    );
  }
}