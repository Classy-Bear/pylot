import 'package:flutter/material.dart';

class LoadFailure extends StatelessWidget {
  final onPressed;

  LoadFailure({this.onPressed}) : assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("Error", style: Theme.of(context).textTheme.headline3),
            SizedBox(
              height: 16,
            ),
            Text(
              "Oops! Something went wrong, please try again.",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 32,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: onPressed,
                  child: Text("Try again".toUpperCase()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                )
              ] ,
            )
          ],
        ),
      ),
    );
  }
}
