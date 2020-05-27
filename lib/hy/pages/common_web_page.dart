import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebViewPage extends StatelessWidget {
  static const routeName="/commonWebViewPage";

  final String _title;
  final String _code;

  CommonWebViewPage(this._title,this._code);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.getAppBar(context, _title),
      body: MyWebViewPage(_code),
    );
  }
}

class MyWebViewPage extends StatefulWidget {

  final String code;
  MyWebViewPage(this.code);

  @override
  _MyWebViewPageState createState() => _MyWebViewPageState();
}

class _MyWebViewPageState extends State<MyWebViewPage> {
  var url="";
  @override
  void initState() {
    super.initState();
    CommonService.getWebUrl(widget.code,onSuccess: (value){
      setState(() {
        url=value;
        print(url);
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
        Expanded(
          child: WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ],

    );
  }
}