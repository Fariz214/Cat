import 'package:ckm/common/widgets/login_widgets/button.dart';
import 'package:ckm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ckm/features/authentication/screens/signup/widget/signup_checkbox.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
         Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => CKMValidator.validateEmptyText('First Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: CKMTexts.firstName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: CKMSizes.spaceBtwInputFields,),
            
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => CKMValidator.validateEmptyText('Last Name', value),
                expands: false,
                decoration: const InputDecoration(labelText: CKMTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(height: CKMSizes.spaceBtwInputFields,),

        ///Username
        TextFormField(
          controller: controller.username,
          validator: (value) => CKMValidator.validateEmptyText('Username', value),
          expands: false,
          decoration: const InputDecoration(labelText: CKMTexts.username, 
          prefixIcon: Icon(Iconsax.user)),
        ),
        const SizedBox(height: CKMSizes.spaceBtwInputFields,),

        /// Email
        TextFormField(
          controller: controller.email,
          validator: (value) => CKMValidator.validateEmail(value),
          expands: false,
          decoration: const InputDecoration(labelText: CKMTexts.email, 
          prefixIcon: Icon(Iconsax.user)),
        ),
        const SizedBox(height: CKMSizes.spaceBtwInputFields,),

        /// Phone Number
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => CKMValidator.validatePhoneNumber(value),
          decoration: const InputDecoration(
          labelText: CKMTexts.phoneNo, 
          prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: CKMSizes.spaceBtwInputFields,),

        /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => CKMValidator.validatePassword(value),
              obscureText: controller.hidepassword.value,
              decoration: InputDecoration(
                labelText: CKMTexts.password, 
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton
                (onPressed:() => controller.hidepassword. value = !controller.hidepassword.value, 
                icon: Icon (controller.hidepassword.value ? Iconsax.eye_slash : Iconsax.eye))),
              ),
          ),
          
        const SizedBox(height: CKMSizes.spaceBtwSections,),

        const SignUpCheckBox(),
        const SizedBox(height: CKMSizes.spaceBtwSections),

        /// Button
        ButtonAuthentication(onPressed: () => controller.signup(), text: 'Create Account',),
        const SizedBox(height: CKMSizes.spaceBtwSections),

        ],
      ),
    );
  }
}
