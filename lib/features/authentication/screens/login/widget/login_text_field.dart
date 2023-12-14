import 'package:ckm/common/widgets/login_widgets/button.dart';
import 'package:ckm/features/authentication/controllers/login/login_controller.dart';
import 'package:ckm/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ckm/features/authentication/screens/signup/signup_screen.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:ckm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CKMLoginTextField extends StatelessWidget {
  const CKMLoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => CKMValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right), 
              labelText: CKMTexts.email),
          ),

          const SizedBox(height: CKMSizes.spaceBtwInputFields),

          // Password
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

          const SizedBox(height: CKMSizes.spaceBtwInputFields/2),

          /// Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                  value: controller.checkbox.value,
                  onChanged: (value) => controller.checkbox.value = !controller.checkbox.value,
                  activeColor: dark ? CKMColors.secondary : CKMColors.primary,
                  )),
                  const Text(CKMTexts.rememberMe),
                ],
              ),
            
              TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(CKMTexts.forgetPassword))
            ],
          ),

          const SizedBox(height: CKMSizes.spaceBtwItems),
          /// Sign In Button
              ButtonAuthentication(onPressed: () => controller.login(), text: 'Sign In',),
              const SizedBox(height: CKMSizes.spaceBtwItems),
              /// Create Account Button
              ButtonAuthentication(onPressed: () => Get.to(() => const SignUpScreen()), text: 'Create Account',),
              const SizedBox(height: CKMSizes.spaceBtwItems),
        ],
      ),
    );
  }
}

