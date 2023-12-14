import 'package:ckm/features/application/screens/add/add_screen.dart';
import 'package:ckm/features/application/screens/goals/add_goals.dart';
import 'package:ckm/utils/constants/colors.dart';
import 'package:ckm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SwitchAdd extends StatefulWidget {
  const SwitchAdd({super.key});

  @override
  SwitchAddState createState() => SwitchAddState();
}

class SwitchAddState extends State<SwitchAdd> {
  bool isTransaction = true;

  @override
  Widget build(BuildContext context) {
    final dark = CKMHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 280,
              child: Column(
                children: [
                  Icon(
                    isTransaction ? Iconsax.empty_wallet_add : Iconsax.bank,
                    size: 220,
                    color: dark ? CKMColors.secondary : CKMColors.primary,
                  ),
                  Text(
                    isTransaction ? 'Transaction ' : 'Goal ',
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
Switch(
  value: isTransaction,
  onChanged: (value) {
    setState(() {
      isTransaction = value;
    });
  },
  inactiveThumbColor: Colors.grey,
  inactiveTrackColor: Colors.grey.withOpacity(0.5),
  activeTrackColor: dark? CKMColors.secondary : CKMColors.primary,
  thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.white;
    }
    return Colors.grey;
  }),
),

            const SizedBox(height: 50),
            Container(
  width: double.infinity,
  margin: const EdgeInsets.symmetric(horizontal: 50),
  decoration: BoxDecoration(
    border: Border.all(width: 0),
  ),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: dark ? CKMColors.secondary : CKMColors.primary,
      shadowColor: CKMColors.secondary,
    ),
    onPressed: () {
      if (isTransaction) {
        // Navigasi ke Transaksi
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTransaction()),
        );
      } else {
        // Navigasi ke Tujuan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddMoneyToGoalForm()),
        );
      }
    },
    child: Text(
      isTransaction ? 'Add Transaction' : 'Add Goal',
      style: TextStyle(color: dark ? CKMColors.black : CKMColors.white),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
