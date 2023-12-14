import 'package:ckm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpCheckBox extends StatelessWidget {
  const SignUpCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.checkbox.value,
              onChanged: (value) => controller.checkbox.value = !controller.checkbox.value,
              activeColor: dark ? CKMColors.secondary : CKMColors.primary),
          ),
        ),
        const SizedBox(width: CKMSizes.spaceBtwItems),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${CKMTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: CKMTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? CKMColors.white : CKMColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? CKMColors.white : CKMColors.primary,
                      ),
                ),
                TextSpan(text: ' ${CKMTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: CKMTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? CKMColors.white : CKMColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? CKMColors.white : CKMColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
