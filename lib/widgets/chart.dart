import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_application/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 2),
        "amount": totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Row(
          children: groupedTransactionsValues.map((data) {
            return Text("${data["day"]}: ${data["amount"]}");
          }).toList(),
        ),
      ),
    );
  }
}
