import 'package:ckm/common/widgets/login_widgets/login_divider.dart';
import 'package:ckm/features/application/screens/add/rupiah.dart';
import 'package:ckm/features/personalization/screens/profile/widget/drawer_settings.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/constants/sizes.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GoalWidget extends StatelessWidget {
  const GoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Scaffold(
      drawer:  const Drawer(child: MyDrawer()),
      appBar: AppBar(
        title: const Text('Goals'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      body: GoalsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddGoalPage());
        },
        backgroundColor: dark? CKMColors.secondary : CKMColors.primary,
        child: const Icon(Icons.add,color: CKMColors.black),
      ),
    );
  }
}

class GoalsList extends StatelessWidget {
  final AuthenticationRepository authRepository = AuthenticationRepository.instance;

  GoalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Your Goals:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder(
              stream: authRepository.getUserGoals(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final goals = snapshot.data?.docs ?? [];
                  if (goals.isEmpty) {
                    return const Center(
                      child: Text('No goals available.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      final goal = goals[index];
                      final goalData = {
                        ...goal.data() as Map<String, dynamic>,
                        'goalId': goal.id,
                      };
                      final targetAmount = goalData['targetAmount'] ?? 0.0;
                      final currentAmount = goalData['currentAmount'] ?? 0.0;
                      double progress = (currentAmount / targetAmount).clamp(0.0, 1.0);

                      final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp');
                      final formattedTargetAmount = formatter.format(targetAmount);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GoalDetailPage(goalData),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(goalData['goalName']),
                              subtitle: Text('Target: $formattedTargetAmount'),
                              trailing: Text('Progress: ${(progress * 100).toStringAsFixed(0)}%'),
                            ),
                            LinearProgressIndicator(value: progress),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


class GoalDetailPage extends StatelessWidget {
  final Map<String, dynamic> goalData;

  const GoalDetailPage(this.goalData, {super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp');
    final double progress = (goalData['currentAmount'] / goalData['targetAmount']).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Icon(
              progress == 1.0 ? Icons.check_circle : Icons.flag,
              size: 80,
              color: progress == 1.0 ? Colors.green : Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              goalData['goalName'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Target Amount: ${formatter.format(goalData['targetAmount'])}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Current Amount: ${formatter.format(goalData['currentAmount'])}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: CKMSizes.spaceBtwSections,),
                
                Column(
  children: [
    if (progress == 1.0) ...[
      const LoginDivider(dividerText: 'Delete Goals'),
      IconButton(
        onPressed: () async {
          try {
            await AuthenticationRepository.instance.deleteGoal(goalData['goalId']);
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Goal Deleted!'),
              ),
            );
            Get.back();
          } catch (e) {
            Get.snackbar('Error deleting goal', '$e');
          }
        },
        iconSize: 40,
        icon: const Icon(Icons.delete),
        color: Colors.red,
      ),
    ],
  ],
)

              ],
            ),
          ],
        ),
      ),
    );
  }
}



class AddGoalPage extends StatelessWidget {
  final TextEditingController _goalNameController = TextEditingController();
  final TextEditingController _targetAmountController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final AuthenticationRepository authRepository = AuthenticationRepository.instance;

  AddGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _goalNameController,
              decoration: const InputDecoration(labelText: 'Goal Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _targetAmountController,
              decoration: const InputDecoration(labelText: 'Target Amount'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RupiahInputFormatter(),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _deadlineController,
              decoration: const InputDecoration(labelText: 'Deadline (YYYY-MM-DD)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _addGoal();
              },
              child: const Text('Add Goal'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addGoal() async {
    final goalName = _goalNameController.text;
    final targetAmount = double.tryParse(_targetAmountController.text.replaceAll('Rp', '').replaceAll('.', '')) ?? 0.0;
    final deadline = DateTime.parse(_deadlineController.text);

    if (goalName.isNotEmpty && targetAmount > 0) {
      try {
        await authRepository.addGoal(goalName, targetAmount, deadline);
        _goalNameController.clear();
        _targetAmountController.clear();
        _deadlineController.clear();
        Get.back();
      } catch (e) {
        Get.snackbar('Error adding goal', '$e');
      }
    } else {
      Get.snackbar('Invalid Input', 'Please provide valid information for the goal.');
    }
  }
}
