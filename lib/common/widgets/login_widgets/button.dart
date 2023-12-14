import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ButtonAuthentication extends StatelessWidget {
  const ButtonAuthentication({ 
    super.key,
    required this.onPressed,
    required this.text, // Parameter for onPressed function
  });

  final void Function() onPressed;
  final String text; // Function definition

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: dark? CKMColors.secondary: CKMColors.primary,
          shadowColor: dark? CKMColors.secondary: CKMColors.primary,
          side: BorderSide.none),
          
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark? CKMColors.black.withOpacity(0.7): CKMColors.black),),
      ),
    );
  }
}
