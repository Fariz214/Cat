import 'package:ckm/features/application/screens/budget/budget_screen.dart';
import 'package:ckm/features/application/screens/goals/goals_screen.dart';
import 'package:ckm/features/application/screens/goals/switch.dart';
import 'package:ckm/features/application/screens/history/history_screen.dart';
import 'package:ckm/features/application/screens/home/home_screen.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        backgroundColor: dark? CKMColors.black: Colors.white,
        indicatorColor: dark? CKMColors.secondary.withOpacity(0.1): CKMColors.primary.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home_2), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.graph), label: 'Budget'),
          NavigationDestination(icon: Icon(Iconsax.add_square5), label: '',),
          NavigationDestination(icon: Icon(Iconsax.task), label: 'Goals'),
          NavigationDestination(icon: Icon(Iconsax.receipt_text), label: 'Transaksi'),
        ]
        ),
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const PieChartWidget(),
    const SwitchAdd(),
    const GoalWidget(),
    const HistoryScreen(category:''),
    ];
}