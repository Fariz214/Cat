import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key,required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Flexible(child: Divider(color: dark? CKMColors.secondary: CKMColors.primary, thickness: 0.5, indent: 60, endIndent: 5,)),
       Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
       Flexible(child: Divider(color: dark? CKMColors.secondary: CKMColors.primary, thickness: 0.5, indent: 5, endIndent: 60,)),
      ],
    );
  }
}