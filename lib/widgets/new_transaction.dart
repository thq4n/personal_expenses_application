import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

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

      widget.addTransaction(
        enteredTitle,
        enteredAmount,
      );

      Navigator.of(context).pop();
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
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    // onChanged: (value) => amountInput = value,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Date",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => null,
                  child: Text("Choose date"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber.shade400),
                  ),
                )
              ],
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
