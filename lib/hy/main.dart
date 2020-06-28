import 'package:flutter/services.dart';
import 'package:flutter_learn/hy/pages/login_page.dart';
import 'package:flutter_learn/hy/pages/unknown_page.dart';
import 'package:flutter_learn/hy/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/utils/size_fit.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle =
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.initialize();
    return MaterialApp(
      title: 'Flutter widget',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: LoginPage(),
      home: LoginPage(),
      routes: RouterConfig.routes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return UnKnownPage();
        });
      },
    );
  }
}

