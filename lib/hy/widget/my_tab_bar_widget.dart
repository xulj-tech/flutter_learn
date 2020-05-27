import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/widget/webview_widget.dart';
import '../api/api.dart';

class FlutterTabBarView extends StatelessWidget {
  final TabController tabController;

  FlutterTabBarView({Key key, @required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewList = [
      MyWebView(Api.CODE_CJ),
      MyWebView(Api.CODE_SP),
      MyWebView(Api.CODE_MJ),
      MyWebView(Api.CODE_DJ),
      MyWebView(Api.CODE_GB),
      MyWebView(Api.CODE_DG),
    ];
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: viewList,
      controller: tabController,
    );
  }
}
