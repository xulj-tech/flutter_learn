import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'first_page.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'unknown_page.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ParamsInfo()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        //命名路由
        SecondPage.routeName: (context) => SecondPage(),
        ThirdPage.routeName: (context) => ThirdPage(),
      },
      //由于FirstPage已经创建了构造器
      onGenerateRoute: (settings) {
        if (settings.name == FirstPage.routeName) {
          return MaterialPageRoute(builder: (context) {
            return FirstPage(settings.arguments);
          });
        }
        return null;
      },
      //未知路由
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return UnKnownPage();
        });
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
        child: MyContainer(),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ParamsInfo>(
        builder: (ctx, paramVm, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${paramVm.message}", style: TextStyle(fontSize: 20)),
              SizedBox(height: 30,),
              RaisedButton(
                child: Text("goto first page--"),
                onPressed: () {
                  /**
                   * 使用MaterialPageRoute
                   * Android： 从屏幕底部滑动到顶部
                   * iOS：     从屏幕右侧滑动到左侧
                   */
                  Future result = Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) {
                    return FirstPage("a home message ---first");
                  }));

                  result.then((value) {
                    print("value");
                    paramVm.setMessage(value);
                  });
                },
              ),
              RaisedButton(
                child: Text("goto first page---"),
                onPressed: () {
                  /**
                   * 使用PageRouteBuilder渐变效果
                   */
                  Future result =Navigator.of(context)
                      .push(PageRouteBuilder(pageBuilder: (ctx, anim1, anim2) {
                    return FadeTransition(
                        opacity: anim1,
                        child: FirstPage("a home message ----first"));
                  }));

                  result.then((value) {
                    print(value);
                    paramVm.setMessage(value);
                  });
                },
              ),
              RaisedButton(
                child: Text("goto second page"),
                onPressed: () {
                  Future result = gotoPage(context, SecondPage.routeName, "home message --- second");
                  result.then((value) {
                    print(value);
                    paramVm.setMessage(value);
                  });
                },
              ),
              RaisedButton(
                child: Text("goto  third  page"),
                onPressed: () {
                  Future result = gotoPage(context, ThirdPage.routeName, "home message ---  third");
                  result.then((value) {
                    print(value);
                    //paramVm.setMessage(value);
                    Provider.of<ParamsInfo>(context,listen: false).setMessage(value);
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

Future gotoPage(BuildContext context, String pageName, String param) {
  Future result = Navigator.of(context).pushNamed(pageName, arguments: param);
  return result;
}

class ParamsInfo with ChangeNotifier {
  String _message = "message";

  String get message => _message;

  void setMessage(String value) {
    _message = value;
    notifyListeners();
  }
}
