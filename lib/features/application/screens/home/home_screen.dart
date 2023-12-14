import 'package:ckm/common/widgets/appbar_widget/appbar.dart';
import 'package:ckm/common/widgets/drawer/drawer_menu.dart';
import 'package:ckm/common/widgets/header_widget/header_design.dart';
import 'package:ckm/features/application/screens/home/home_image.dart';
import 'package:ckm/features/personalization/screens/settings/drawer_settings.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderDesign(
              /// AppBar
              child: Column(
                children: [
                  CATAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(CKMTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: CKMColors.white)),
                        Text(CKMTexts.homeAppbarSubTitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: CKMColors.white)),
                      ],
                    ),
                    actions: const [ DrawerMenu()],
                  ),
                  const SizedBox(
                    height: CKMSizes.spaceBtwSections),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(CKMSizes.defaultSpace),
              child: HomeImage()   
            ),
          ],
        ),
      ),
      drawer:  const Drawer(child: MyDrawer()),
    );
  }
}




