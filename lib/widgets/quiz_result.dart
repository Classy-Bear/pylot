import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  final String score;
  final Function onFinishedPressed;
  final Function onRetakePressed;

  QuizResult({this.score, this.onFinishedPressed, this.onRetakePressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        automaticallyImplyLeading: false, // Don't show the leading button
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 52,
            ),
            Text(
              "Your Score is",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 44,
            ),
            Text(
              score,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 32,
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                FlatButton(
                  child: Text("retake".toUpperCase()),
                  onPressed: onRetakePressed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                RaisedButton(
                  child: Text("finish".toUpperCase()),
                  onPressed: onFinishedPressed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
