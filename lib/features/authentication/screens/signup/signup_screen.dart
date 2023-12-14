import 'package:ckm/common/widgets/login_widgets/login_divider.dart';
import 'package:ckm/common/widgets/login_widgets/login_with_sosial.dart';
import 'package:ckm/features/authentication/screens/signup/widget/signup_form.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CKMSizes.defaultSpace),
          child: Column(
            children: [
              /// Tittle
              Text(CKMTexts.signupTitle, style:  Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: CKMSizes.spaceBtwSections,),

              /// Form
              const SignUpForm(),

              /// Divider
              LoginDivider(dividerText: CKMTexts.orSignUpWith.capitalize!),
              const SizedBox(height: CKMSizes.spaceBtwSections),

              /// Sign Up With Social
              const LoginWithSocial(),
           ],
          ),
        ),
      ),
    );
  }
}
