import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              // onChanged: (value) {
              //   titleInput = value;
              // },
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Tiltle",
              ),
            ),
            TextField(
              // onChanged: (value) => amountInput = value,
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
