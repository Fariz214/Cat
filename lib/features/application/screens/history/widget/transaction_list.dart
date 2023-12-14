import 'package:ckm/data/Repository/authentication/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatefulWidget {
  final String category;
  final AuthenticationRepository repository = AuthenticationRepository.instance;

  TransactionWidget({super.key, required this.category});

  @override
  TransactionWidgetState createState() => TransactionWidgetState();
}

class TransactionWidgetState extends State<TransactionWidget> {
  late String appBarTitle;

  @override
  void initState() {
    super.initState();
    appBarTitle = widget.category;
  }

  Future<void> _deleteTransaction(String transactionId) async {
    await widget.repository.deleteTransaction(widget.category, transactionId);
    // ignore: use_build_context_synchronously
    Navigator.pop(context, true); // Send signal that transaction has been deleted
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.repository.getTransactions(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No transactions available.'));
          } else {
            List<QueryDocumentSnapshot> transactions = snapshot.data!.docs;
            transactions.sort((a, b) => b['timestamp'].compareTo(a['timestamp']));

            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot transaction = transactions[index];

                final description = transaction['description'];
                final amount = transaction['amount'];
                final timestamp = transaction['timestamp'];
                final formatter = NumberFormat.currency(locale: 'id', symbol: 'Rp');
                final formattedAmount = formatter.format(amount);

                return ListTile(
                  title: Text(
                    description,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text('Amount: $formattedAmount'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(DateFormat('yyyy-MM-dd – kk:mm').format(timestamp.toDate())),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteTransaction(transaction.id); // Call function to delete transaction
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
