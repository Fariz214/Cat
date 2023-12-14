import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginWithSocial extends StatelessWidget {
  const LoginWithSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border:  Border.all(color: CKMColors.grey), borderRadius: BorderRadius.circular(100)),
          child:  IconButton(
            onPressed: (){},
            icon:  const Image(
              width: CKMSizes.iconMd,
              height: CKMSizes.iconMd,
              image: AssetImage(CKMImages.google)),
          ),
        ),
        const SizedBox(width: CKMSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border:  Border.all(color: CKMColors.grey), borderRadius: BorderRadius.circular(100)),
          child:  IconButton(
            onPressed: (){},
            icon:  const Image(
              width: CKMSizes.iconMd,
              height: CKMSizes.iconMd,
              image: AssetImage(CKMImages.facebook)),
          ),
        ),
      ],
    );
  }
}