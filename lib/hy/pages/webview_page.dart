import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: CommonService.getWebUrl(Api.FC_WEB_GZLC_RK_0001),
        builder: (ctx, snapshot) {
           if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
           if (snapshot.error != null) return Center(child: Text("请求失败"),);
           final url=snapshot.data;
           print(url);
           return WebView(
             initialUrl: url,
             javascriptMode: JavascriptMode.unrestricted,
           );
        }
    );
  }

}