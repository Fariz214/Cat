import 'package:ckm/common/widgets/appbar_widget/appbar.dart';
import 'package:ckm/common/widgets/header_widget/header_design.dart';
import 'package:ckm/common/widgets/header_widget/section_heading.dart';
import 'package:ckm/features/personalization/screens/profile/profile.dart';
import 'package:ckm/features/personalization/screens/settings/widget/logout_controller.dart';
import 'package:ckm/features/personalization/screens/settings/widget/settings_menu.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  Header
            HeaderDesign(
                child: Column(
                  children: [
                    /// AppBar
                    CATAppBar(
                      title: 
                          Text('Settings',style: Theme.of(context).textTheme.headlineMedium!.apply(color: CKMColors.white)),
                    ),
                    
                    /// User Profile Card
                    ListTile(
                      leading: const Icon(Iconsax.user,size: 30,color: CKMColors.white),
                      title: Text('BlueBot',style: Theme.of(context).textTheme.headlineSmall!.apply(color: CKMColors.white)),
                      subtitle: Text('BlueBot123',style: Theme.of(context).textTheme.bodyMedium!.apply(color: CKMColors.white)),
                      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()), icon: const Icon(Iconsax.edit, color: CKMColors.white),),
                    ),

                     const SizedBox(height: CKMSizes.spaceBtwSections),
              ],
            )),
            /// Body
            Padding(
              padding: const EdgeInsets.all(CKMSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(title: 'Settings'),
                  const SizedBox(height: CKMSizes.spaceBtwItems,),
                  SettingsMenu(icon: Iconsax.activity,title: 'Test',subTitle: 'TESTING',onTap: (){},),
                  SettingsMenu(icon: Iconsax.activity,title: 'Test',subTitle: 'TESTING',onTap: (){},),
                  SettingsMenu(icon: Iconsax.activity,title: 'Test',subTitle: 'TESTING',onTap: (){},),
                  SettingsMenu(icon: Iconsax.activity,title: 'Logout',subTitle: 'Logout Account',onTap: () => LogoutController.instance.logout(),trailing: Iconsax.logout, color: CKMColors.warning,),
                ],
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
