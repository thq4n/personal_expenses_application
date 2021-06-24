import 'package:flutter/cupertino.dart';
import 'package:personal_expenses_application/models/transaction.dart';
import 'package:personal_expenses_application/widgets/new_transaction.dart';
import 'package:personal_expenses_application/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "1",
      title: "New Shoes",
      amount: 100.88,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "New Hat",
      amount: 13.89,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
      print(_userTransaction.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
