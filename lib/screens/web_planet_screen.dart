import 'package:flutter/material.dart';
import 'package:pylot/models/screen_arguments.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPlanetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        initialUrl: args.message,
      ),
    );
  }
}
