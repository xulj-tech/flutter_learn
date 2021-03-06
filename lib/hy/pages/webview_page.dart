import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  static const routeName="/webViewPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyWebViewPage(),
    );
  }
}

class MyWebViewPage extends StatefulWidget {
  @override
  _MyWebViewPageState createState() => _MyWebViewPageState();
}

class _MyWebViewPageState extends State<MyWebViewPage> {
  var url="";
  @override
  void initState() {
    super.initState();
    CommonService.getWebUrl(Api.FC_WEB_GZLC_RK_0001,onSuccess: (value){
      setState(() {
        url=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _getWebView(),
    );
  }

  _getWebView(){
    if (url.isEmpty) {
      return CupertinoActivityIndicator();
    }
    return Column(
      children: <Widget>[
        Container(height:20, color: Theme.of(context).primaryColor,),
        Expanded(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(
                  name: 'JSMessage',
                  onMessageReceived: (JavascriptMessage message) {
                    print("参数： ${message.message}");
                  }
              ),
            ].toSet(),
          ),
        ),
      ],

    );
  }
}