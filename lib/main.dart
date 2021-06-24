import 'package:flutter/material.dart';
import 'package:personal_expenses_application/widgets/user_transaction.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  // String? titleInput;
  // String? amountInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
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
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
