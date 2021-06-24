import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  void submitData() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      return;
    }

    try {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if (enteredAmount <= 0) {
        return;
      }

      addTransaction(
        enteredTitle,
        enteredAmount,
      );
    } catch (e) {
      return;
    }
  }

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
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: "Tiltle",
              ),
            ),
            TextField(
              // onChanged: (value) => amountInput = value,
              controller: amountController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
