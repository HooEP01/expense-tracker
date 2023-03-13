import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;

  const TransactionList(this.userTransaction, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ]);
            })
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return TransactionItem(
                  key: ValueKey(userTransaction[index].id),
                  userTransaction: userTransaction[index],
                  deleteTx: deleteTx,
                );

                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).colorScheme.primary,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         child: Text(
                //           "RM ${userTransaction[index].amount.toStringAsFixed(2)}",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).colorScheme.primary,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Padding(
                //             padding: const EdgeInsets.only(bottom: 3),
                //             child: Text(
                //               userTransaction[index].title,
                //               style: Theme.of(context).textTheme.titleMedium,
                //             ),
                //           ),
                //           Text(
                //             DateFormat("yyyy-MM-dd, H:m")
                //                 .format(userTransaction[index].date),
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.grey.shade500,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
