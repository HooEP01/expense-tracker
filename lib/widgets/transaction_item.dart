import 'package:flutter/material.dart';

import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction userTransaction;
  final Function deleteTx;

  const TransactionItem({
    super.key,
    required this.userTransaction,
    required this.deleteTx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text('RM ${userTransaction.amount}'),
              ),
            ),
          ),
          title: Text(
            userTransaction.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle:
              Text(DateFormat("yyyy-MM-dd, H:m").format(userTransaction.date)),
          trailing: MediaQuery.of(context).size.width > 400
              ? TextButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  onPressed: () {
                    deleteTx(userTransaction.id);
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    deleteTx(userTransaction.id);
                  },
                )),
    );
  }
}
