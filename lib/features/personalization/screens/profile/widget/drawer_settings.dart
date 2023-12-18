import 'package:ckm/common/widgets/header_widget/section_heading.dart';
import 'package:ckm/features/personalization/screens/profile/profile.dart';
import 'package:ckm/features/personalization/screens/settings/widget/logout_controller.dart';
import 'package:ckm/features/personalization/screens/settings/widget/settings_menu.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Drawer(
      // Set the background color for the entire drawer
      child: Container(
        color: dark? CKMColors.dark: CKMColors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: dark? CKMColors.secondary.withOpacity(0.8): CKMColors.primary, border: Border.all(width: 0)
                ),
                padding: const EdgeInsets.all(CKMSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Settings', style: Theme.of(context).textTheme.headlineMedium!.apply(color: CKMColors.white)),
                    
                    ListTile(leading: const Icon(Iconsax.user,size: 30,color: CKMColors.white),
                      title: Text('BlueBot',style: Theme.of(context).textTheme.headlineSmall!.apply(color: CKMColors.white),overflow: TextOverflow.ellipsis),
                      subtitle: Text('BlueBot123',style: Theme.of(context).textTheme.bodyMedium!.apply(color: CKMColors.white),overflow: TextOverflow.ellipsis),
                      trailing: IconButton(onPressed: () => Get.to(() => const ProfileScreen()),
                      icon: const Icon(Iconsax.edit, color: CKMColors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(CKMSizes.defaultSpace),
                child: Column(
                  children: [
                    const SectionHeading(title: 'Settings'),
                    const SizedBox(height: CKMSizes.spaceBtwItems),
                    SettingsMenu(icon: Iconsax.activity,title: 'Test',subTitle: 'TESTING',onTap: () {},),
                    SettingsMenu(icon: Iconsax.activity,title: 'Logout',subTitle: 'Logout Account',onTap: () => LogoutController.instance.logout(),trailing: Iconsax.logout, color: CKMColors.warning,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
