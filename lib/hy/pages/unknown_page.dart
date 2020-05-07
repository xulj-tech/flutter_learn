import 'package:flutter/material.dart';

class UnKnownPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("错误页面", style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
