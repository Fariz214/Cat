import 'package:ckm/common/widgets/drawer/drawer_menu.dart';
import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/features/application/screens/history/widget/transaction_list.dart';
import 'package:ckm/features/personalization/screens/profile/widget/drawer_settings.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  PieChartWidgetState createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State<PieChartWidget> {
  final AuthenticationRepository repository = AuthenticationRepository.instance;
  late Map<String, double?> categoryData;

  @override
  void initState() {
    super.initState();
    categoryData = {};
    _loadTransactionsData();
  }

  Future<void> _loadTransactionsData() async {
    final categories = ['Makanan', 'Hobby', 'Shopping', 'Travel', 'Other'];
    for (var category in categories) {
      double totalAmount = await _calculateCategoryAmount(category);
      setState(() {
        categoryData[category] = totalAmount > 0 ? totalAmount : null;
      });
    }
  }

  Future<double> _calculateCategoryAmount(String category) async {
    double totalAmount = 0.0;
    final transactions = await repository.getTransactions(category).first;
    for (var transaction in transactions.docs) {
      totalAmount += transaction['amount'];
    }
    return totalAmount;
  }

  void _updatePieChart() {
    _loadTransactionsData();
  }

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context); // Assume dark mode for simplicity
    double totalValue = 0.0;
    for (var value in categoryData.values) {
      if (value != null) {
        totalValue += value;
      }
    }

    return Scaffold(
      drawer: const Drawer(child: MyDrawer()),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            toolbarHeight: 75,
            backgroundColor: dark ? CKMColors.dark : Colors.white,
            title: Text(
              'Budget',
              style: Theme.of(context).textTheme.titleLarge!.apply(color: Colors.white),
            ),
            actions: const [DrawerMenu()],
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 200,
              maxHeight: 200,
              child: Container(
                color: dark ? CKMColors.black : CKMColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: PieChart(
                    PieChartData(
                      sections: _generatePieChartSections(),
                      startDegreeOffset: 0,
                      centerSpaceRadius: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverList(
            delegate: SliverChildListDelegate(
              categoryData.entries.where((entry) => entry.value != null).map((entry) {
                double value = entry.value!;
                double categoryPercentage = value / totalValue;
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: dark ? Colors.grey[800]! : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: dark ? Colors.black.withOpacity(0.4) : Colors.grey.withOpacity(0.4),
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          height: 80,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(entry.key),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  entry.key,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Total amount :\nRp${_formatCurrency(entry.value!)}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.history),
                                  onPressed: () {
                                    Get.to(TransactionWidget(category: entry.key))?.then((value) {
                                      if (value != null && value is bool && value) {
                                        _updatePieChart();
                                      }
                                    });
                                  },
                                ),
                                tileColor: dark ? Colors.grey[800]! : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: LinearProgressIndicator(
                                  value: categoryPercentage,
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(_getCategoryColor(entry.key)),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _generatePieChartSections() {
    List<PieChartSectionData> pieChartSections = [];
    categoryData.forEach((category, amount) {
      if (amount != null) {
        final section = PieChartSectionData(
          title: '',
          value: amount,
          color: _getCategoryColor(category),
          radius: 100,
        );
        pieChartSections.add(section);
      }
    });
    return pieChartSections;
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Makanan':
        return Colors.red;
      case 'Hobby':
        return Colors.green;
      case 'Shopping':
        return Colors.blue;
      case 'Travel':
        return Colors.orange;
      case 'Other':
        return Colors.purple;
      default:
        return Colors.white;
    }
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 2);
    return formatter.format(amount);
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
