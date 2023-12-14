// ignore_for_file: use_build_context_synchronously

import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:ckm/features/application/screens/add/rupiah.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  AddTransactionState createState() => AddTransactionState();
}

class AddTransactionState extends State<AddTransaction> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  String? selectedCategory;

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    List<String> categories = [
      'Makanan',
      'Hobby',
      'Shopping',
      'Travel',
      'Other',
      'Sleep'
    ]; // Add your categories here

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: TextField(
                        style:Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          RupiahInputFormatter(),
                        ],
                        decoration:  const InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Amount',
                          hintText: 'Insert Transaction Amount Here',
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    items: categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addTransaction,
              style: ElevatedButton.styleFrom(
                backgroundColor: dark? CKMColors.secondary : CKMColors.primary, // Ganti warna latar belakang sesuai keinginan
              ),
              child: const Text('Add Transaction', style: TextStyle(color: CKMColors.black),),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Future<void> addTransaction() async {
  if (selectedCategory != null &&
      descriptionController.text.trim().isNotEmpty &&
      amountController.text.trim().isNotEmpty) {
    final category = selectedCategory!;
    final description = descriptionController.text.trim();
    
    // Bersihkan dari format Rupiah dan koma sebelum parsing
    final amountString = amountController.text.replaceAll('Rp', '').replaceAll('.', '');
    final amount = double.tryParse(amountString) ?? 0.00;

    if (category.isNotEmpty && description.isNotEmpty && amount > 0) {
      try {
        // Simpan nilai yang valid ke dalam database
        await AuthenticationRepository.instance.addTransaction(
          description,
          amount,
          category,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Success Add Transaction:')),
        );
        setState(() {
          selectedCategory = null;
          descriptionController.clear();
          amountController.clear();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add transaction: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }
  }
}