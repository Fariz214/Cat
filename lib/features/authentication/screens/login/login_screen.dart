import 'package:ckm/common/styles/spacing_style.dart';
import 'package:ckm/common/widgets/login_widgets/login_divider.dart';
import 'package:ckm/features/authentication/screens/login/widget/login_text_field.dart';
import 'package:ckm/common/widgets/login_widgets/login_with_sosial.dart';
import 'package:ckm/features/authentication/screens/login/widget/logo_section.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen  extends StatelessWidget {
  const LoginScreen ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CKMSpacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title & Subtitle
              const LogoSection(),
              const SizedBox(height: CKMSizes.spaceBtwSections,),

              /// Form
              const CKMLoginTextField(),
              
              /// Divider
              LoginDivider(dividerText: CKMTexts.orSignInWith.capitalize!),
              const SizedBox(height: CKMSizes.spaceBtwItems,),

              /// Footer
              const LoginWithSocial()
            ],
          ),
        ),
      ),
    );
  }
}





