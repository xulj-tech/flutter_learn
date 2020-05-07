import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  static const routeName="/webViewPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyWebView(),
    );
  }
}

class MyWebView extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context).settings.arguments as String;
    print(url);
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }

}