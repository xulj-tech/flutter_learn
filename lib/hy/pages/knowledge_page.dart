import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/utils/GlobalConfig.dart';
import 'package:flutter_learn/hy/widget/webview_widget.dart';

class KnowledgePage extends StatelessWidget {
  static const routeName="/knowledgePage";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            centerTitle: true,
            title: Text("知识查阅"),
            bottom: PreferredSize(
              preferredSize:  Size.fromHeight(40),
              child: Material(
                color: Colors.white,
                child: TabBar(
                    labelColor: GlobalConfig.colorPrimary,
                    tabs: <Widget>[
                      Padding(padding:EdgeInsets.all(10),child: Text("标准知识库",style: TextStyle(fontSize: 16))),
                      Text("本级知识库",style: TextStyle(fontSize: 16))
                    ],

                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MyWebView(Api.FC_Web_Knowledge_Standard),
              MyWebView(Api.FC_Web_Knowledge_Level),
            ],
          ),
        ),
      ),

    );
  }
}
