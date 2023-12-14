import 'package:flutter/material.dart';
import 'package:ckm/common/widgets/layout/grid_layout.dart';
import 'package:ckm/common/widgets/common_widget/circular_image.dart';
import 'package:ckm/features/application/screens/add/name_category.dart';
import 'package:ckm/features/application/screens/budget/widget/round_container.dart';
import 'package:ckm/utils/constants/enums.dart';
import 'package:ckm/utils/constants/image_strings.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/common/widgets/appbar_widget/appbar.dart';
import 'package:ckm/common/widgets/drawer/drawer_menu.dart';
import 'package:ckm/common/widgets/header_widget/header_design.dart';
import 'package:ckm/features/personalization/screens/settings/drawer_settings.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';

class Not extends StatelessWidget {
  const Not({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                toolbarHeight: 80,
                flexibleSpace: HeaderDesign(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CATAppBar(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'History',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: CKMColors.white),
                            ),
                          ],
                        ),
                        actions: const [DrawerMenu()],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  child: GridLayout(
                    itemCount: 20,
                    mainAxiExtent: 80,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: RoundedContainer(
                          padding: const EdgeInsets.all(CKMSizes.sm),
                          showBorder: true,
                          backgroundColor: Colors.transparent,
                          child: Row(
                            children: [
                              Flexible(
                                child: CircularImage(
                                  isNetworkImage: false,
                                  image: CKMImages.acerlogo,
                                  backgroundColor: Colors.transparent,
                                  overlayColor: CKMHelperFunctions.isDarkMode(context)
                                      ? CKMColors.white
                                      : CKMColors.black,
                                ),
                              ),
                              const SizedBox(width: CKMSizes.spaceBtwItems / 2),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const NameCategory(
                                      title: 'Food',
                                      categoryTextSize: TextSizes.large,
                                    ),
                                    Text(
                                      'Makananaaaaaaaaaaa',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ];
          },
          body: Container(), // Placeholder for the body content
        ),
        drawer: const Drawer(child: MyDrawer()), // Replace with your Drawer content
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 200.0; // Adjust this value as needed

  @override
  double get minExtent => 80.0; // Adjust this value as needed

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
