import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? CKMImages.lightAppLogo: CKMImages.darkAppLogo),
          ),
        Text(CKMTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: CKMSizes.sm,),
        Text(CKMTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}