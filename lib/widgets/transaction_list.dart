import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_application/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: <Widget>[
                Container(
                  height: constraint.maxHeight * 0.08,
                  child: FittedBox(
                    child: Text(
                      "No transactions added yet!",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.07,
                ),
                Container(
                  height: constraint.maxHeight * 0.85,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         padding: EdgeInsets.all(10),
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Colors.black,
              //           ),
              //         ),
              //         child: Text(
              //           "\$${transactions[index].amount.toStringAsFixed(2)}",
              //           style: Theme.of(context).textTheme.headline6,
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transactions[index].title,
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             DateFormat("dd-MMM-yyyy | hh:mm:ss")
              //                 .format(transactions[index].date),
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // );
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                        child:
                            Text("\$${transactions[index].amount.toString()}")),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever),
                  color: Theme.of(context).errorColor,
                  onPressed: () => deleteTransaction(transactions[index]),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
