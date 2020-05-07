import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static const routeName="/secondPage";

  @override
  Widget build(BuildContext context) {
    final _message = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message, style: TextStyle(fontSize: 20),),
            RaisedButton(
              child: Text("second pop"),
              onPressed: () {
                Navigator.of(context).pop("second page back");
              },
            ),
          ],
        ),
      ),
    );
  }
}
