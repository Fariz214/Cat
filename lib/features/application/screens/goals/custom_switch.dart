import 'package:ckm/features/application/screens/add/add_screen.dart';
import 'package:ckm/features/application/screens/goals/add_goals.dart';
import 'package:flutter/material.dart';

bool isTransactionMode = true;

Container buildCustomSwitch(bool value) {
  return Container(
    width: 60.0,
    height: 30.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(
        color: value ? Colors.blue : Colors.grey,
        width: 2.0,
      ),
      color: value ? Colors.blue : Colors.transparent,
    ),
    child: AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isTransactionMode = !isTransactionMode;
          });
        },
        child: Container(
          width: 26.0,
          height: 26.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

void setState(Null Function() param0) {
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Switch Add Mode'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isTransactionMode ? 'Transaction Mode' : 'Goal Mode',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          buildCustomSwitch(isTransactionMode),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (isTransactionMode) {
                // Navigasi ke mode Transaksi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTransaction()),
                );
              } else {
                // Navigasi ke mode Tujuan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddMoneyToGoalForm()),
                );
              }
            },
            child: Text(
              isTransactionMode ? 'Add Transaction' : 'Add Goal',
            ),
          ),
        ],
      ),
    ),
  );
}
