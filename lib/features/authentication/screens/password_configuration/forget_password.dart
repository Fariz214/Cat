import 'package:ckm/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CKMSizes.defaultSpace),
        child: Column(
          children: [
            //heading
            Text(CKMTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: CKMSizes.spaceBtwItems),
            Text(CKMTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height:  CKMSizes.spaceBtwSections*2),

            TextFormField(
              decoration: const InputDecoration(labelText: CKMTexts.email,prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: CKMSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(() => const ResetPassword()), child: const Text(CKMTexts.submit)),
            )

          ],
        ),
      ),
    );
  }
}