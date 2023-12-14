import 'package:ckm/common/widgets/appbar_widget/appbar.dart';
import 'package:ckm/common/widgets/drawer/drawer_menu.dart';
import 'package:ckm/common/widgets/header_widget/header_design.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

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
                      children: [
                        Text('Budget',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .apply(color: CKMColors.grey)),
                      ],
                    ),
                    actions: const [DrawerMenu()],
                  ),
                  const SizedBox(
                    height: CKMSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
