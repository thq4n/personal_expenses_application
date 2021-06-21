import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result({Key? key, required this.totalScore, required this.resetHandler})
      : super(key: key);

  String get resultPharse {
    var resultText = "You did it!";
    if (totalScore <= 8) {
      resultText = "You'r awesome!";
    } else if (totalScore <= 9) {
      resultText = "Pretty likeable!";
    } else {
      resultText = "UNBELIEVABLE!!!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPharse,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () => resetHandler(),
            child: Text(
              "Restart Quiz!",
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.cyan),
            ),
          ),
        ],
      ),
    );
  }
}
