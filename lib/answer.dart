import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHanlder;
  final String answerText;

  Answer(this.selectHanlder, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () => selectHanlder(),
        child: Text(answerText),
      ),
    );
  }
}
