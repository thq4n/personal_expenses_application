import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_application/transaction.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "1",
      title: "New Shoes",
      amount: 100.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "New Hat",
      amount: 13.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: "3",
      title: "New Laptop",
      amount: 2345.89,
      date: DateTime.now(),
    ),
    Transaction(
      id: "4",
      title: "New Pants",
      amount: 43.89,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter App"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  width: double.infinity,
                  color: Colors.amber,
                  child: Text(
                    "CHART!",
                    textAlign: TextAlign.center,
                  ),
                ),
                elevation: 5,
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            "\$${tx.amount}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat("dd-MMM-yyyy | hh:mm:ss")
                                  .format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          )),
    );
  }
}
