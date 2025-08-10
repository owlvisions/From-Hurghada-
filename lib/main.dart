
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String oneSignalAppId = 'b188bee9-c63f-40fa-91b1-ebbe5b5ed43c'; // Change this

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewContainer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final String url = 'https://fromhurghada.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
