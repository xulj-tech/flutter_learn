import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  static const routeName = "/thirdPage";

  @override
  Widget build(BuildContext context) {
    final _message = ModalRoute.of(context).settings.arguments as String;
    return WillPopScope(
      onWillPop: () {
        // 当返回为true时,flutter自动帮助我们执行返回操作
        // 当返回为false时, 自行写返回代码
        Navigator.of(context).pop("third page back");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("third page"),
//          leading: IconButton(
//            icon: Icon(Icons.arrow_back_ios),
//            onPressed: () {
//              Navigator.of(context).pop("third pop");
//            },
//          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _message,
                style: TextStyle(fontSize: 20),
              ),
              RaisedButton(
                child: Text("third pop"),
                onPressed: () {
                  Navigator.of(context).pop("third page back");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
