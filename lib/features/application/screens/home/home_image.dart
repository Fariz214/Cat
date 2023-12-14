import 'package:carousel_slider/carousel_slider.dart';
import 'package:ckm/common/widgets/common_widget/circular_container.dart';
import 'package:ckm/common/widgets/common_widget/rounded_image.dart';
import 'package:ckm/features/application/controller/home_controller.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key, 
    this.color1,
    this.color2,
  });

  final Color? color1;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final dark = CKMHelperFunctions.isDarkMode(context);

    // Deklarasi Color1 dan Color2 berdasarkan kondisi dark
    final Color color1 = dark ? CKMColors.secondary : CKMColors.primary;
    final Color color2 = dark ? Colors.white : Colors.grey;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: const [
            RoundedImage(imageUrl: CKMImages.darkAppLogo),
            RoundedImage(imageUrl: CKMImages.lightAppLogo),
            RoundedImage(imageUrl: CKMImages.darkAppLogo),
          ],
        ),
        const SizedBox(height: CKMSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++) 
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 15),
                    backgroundColor: controller.carousalCurrentIndex.value == i ? color1 : color2,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
