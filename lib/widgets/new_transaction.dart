import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController(text: "Empty!");

  DateTime? _presentDate;

  void _submitData() {
    if (_titleController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _presentDate == null ||
        _presentDate!.isAfter(DateTime.now())) {
      return;
    }

    try {
      final enteredTitle = _titleController.text;
      final enteredAmount = double.parse(_amountController.text);
      final enterDate = _presentDate;

      if (enteredAmount <= 0) {
        return;
      }

      widget.addTransaction(
        enteredTitle,
        enteredAmount,
        enterDate,
      );

      Navigator.of(context).pop();
    } catch (e) {
      return;
    }
  }

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2090),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        _presentDate = value;
        _dateController.text = DateFormat.yMMMd().format(value);
      }
      print(value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                  // onChanged: (value) {
                  //   titleInput = value;
                  // },
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                  decoration: InputDecoration(
                    labelText: "Tiltle",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                  // onChanged: (value) => amountInput = value,
                  controller: _amountController,
                  onSubmitted: (_) => _submitData(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Amount",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: _dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Date",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _presentDatePicker(context),
                      child: Text("Choose date"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber.shade400),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: ElevatedButton(
                  onPressed: _submitData,
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
