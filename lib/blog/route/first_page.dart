import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  static const routeName="/firstPage";

  final String _message;

  FirstPage(this._message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message, style: TextStyle(fontSize: 20),),
            RaisedButton(
              child: Text("first pop"),
              onPressed: () {
                Navigator.of(context).pop("first page back");
              },
            ),
          ],
        ),
      ),
    );
  }
}
