import 'package:flutter_learn/hy/pages/unknown_page.dart';
import 'package:flutter_learn/utils/size_fit.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'utils/route.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.initialize();
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      routes: RouterConfig.routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return UnKnownPage();
        });
      },
    );
  }
}

