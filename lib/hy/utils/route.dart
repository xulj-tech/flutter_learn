import 'package:flutter_learn/hy/pages/home_page.dart';
import 'package:flutter_learn/hy/pages/login_page.dart';
import 'package:flutter_learn/hy/pages/server_set_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/pages/webview_page.dart';

class RouterConfig {
  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (ctx) => HomePage(),
    LoginPage.routeName: (ctx) => LoginPage(),
    ServerSet.routeName: (ctx) => ServerSet(),
    WebViewPage.routeName: (ctx) => WebViewPage(),
  };
}