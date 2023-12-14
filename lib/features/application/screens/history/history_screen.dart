import 'package:ckm/features/application/screens/history/widget/transaction_list.dart';
import 'package:ckm/features/personalization/screens/settings/drawer_settings.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required String category});

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: dark? CKMColors.dark : CKMColors.white,
                title: const Text('History'),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: CKMHelperFunctions.isDarkMode(context)
                      ? CKMColors.secondary
                      : CKMColors.primary,
                  labelColor: CKMHelperFunctions.isDarkMode(context)
                      ? CKMColors.secondary
                      : CKMColors.primary,
                  tabs: const [
                    Tab(child: Text('Food & Drink')),
                    Tab(child: Text('Hobby')),
                    Tab(child: Text('Shopping')),
                    Tab(child: Text('Travel Expenses')),
                    Tab(child: Text('Other')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TransactionWidget(category: 'Makanan'), // Ganti dengan kategori yang sesuai
              TransactionWidget(category: 'Hobby'),
              TransactionWidget(category: 'Shopping'),
              TransactionWidget(category: 'Travel'),
              TransactionWidget(category: 'Other'),
            ],
          ),
        ),
        drawer: const Drawer(child: MyDrawer()),
      ),
    );
  }
}
