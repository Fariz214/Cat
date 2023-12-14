import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width =56,
    this.height =56,
    this.overlayColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.isNetworkImage = false,
    this.padding = CKMSizes.sm,
  });

  final double padding, width, height;
  final String image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: CKMHelperFunctions.isDarkMode(context) ? CKMColors.dark: CKMColors.light,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
          
      ),
    );
  }
}
