// ignore_for_file: use_build_context_synchronously

import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/features/application/screens/add/rupiah.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMoneyToGoalForm extends StatefulWidget {
  const AddMoneyToGoalForm({super.key});

  @override
  AddMoneyToGoalFormState createState() => AddMoneyToGoalFormState();
}

class AddMoneyToGoalFormState extends State<AddMoneyToGoalForm> {
  final TextEditingController _goalNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final AuthenticationRepository authRepository = AuthenticationRepository.instance;

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Money to Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount to Add'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    RupiahInputFormatter(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _goalNameController,
              decoration: const InputDecoration(labelText: 'Goal Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: dark? CKMColors.secondary : CKMColors.primary, // Ganti warna latar belakang sesuai keinginan
              ),
              onPressed: () async {
                String goalName = _goalNameController.text;
                // Ambil nilai masukan, bersihkan format Rupiah dan koma sebelum parsing
                final amountString =
                    _amountController.text.replaceAll('Rp', '').replaceAll('.', '');
                double amountToAdd = double.tryParse(amountString) ?? 0.00;

                if (goalName.isNotEmpty && amountToAdd > 0) {
                  try {
                    await authRepository.addMoneyToGoalByName(goalName, amountToAdd);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added $amountToAdd to goal $goalName'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                    _goalNameController.clear();
                    _amountController.clear();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $e'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter valid goal name and amount.'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: const Text('Add Money to Goal', style: TextStyle(color: CKMColors.black),),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _goalNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
