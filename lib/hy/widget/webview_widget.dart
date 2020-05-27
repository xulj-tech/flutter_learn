import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget{
  final String _code;

  MyWebView(this._code,{Key key}):super(key:key);

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> with AutomaticKeepAliveClientMixin {
  var url="";
  @override
  void initState() {
    super.initState();
    CommonService.getWebUrl(widget._code,onSuccess: (value){
      setState(() {
        url=value;
      });
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Center(
      child: _getWebView(),
    );
  }

  _getWebView(){
    if (url.isEmpty) {
      return CupertinoActivityIndicator();
    }
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  bool get wantKeepAlive => true;
}