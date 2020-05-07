import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyContainer1(),
          ],
        ),
        ),
      );
  }
}

class MyContainer1 extends StatefulWidget{

  @override
  _MyContainer1State createState() => _MyContainer1State();
}

class _MyContainer1State extends State<MyContainer1> with SingleTickerProviderStateMixin {
  // 创建AnimationController
  AnimationController _controller;
  Animation _animation;
  Animation<Color> _colorAnim;
  Animation<double> _sizeAnim;
  Animation<double> _rotationAnim;
  Animation _opacityAnim;


  @override
  void initState() {
    super.initState();

    // 1.创建AnimationController
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );

    // 2.设置Curve的值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // 3.设置值变化
    _colorAnim = ColorTween(begin: Colors.orange, end: Colors.red).animate(_controller);
    _sizeAnim = Tween(begin: 50.0, end: 150.0).animate(_controller);
    _rotationAnim = Tween(begin: 0.0, end: 2*pi).animate(_animation);
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);

    //监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (ctx,child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Opacity(
                opacity: _opacityAnim.value,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(_rotationAnim.value),
                  child: Icon(Icons.brightness_1,
                      color:_colorAnim.value,
                      size:_sizeAnim.value
                  ),
                ),
              ),
              SizedBox(height: 40,),
              IconButton(
                icon:Icon(Icons.play_circle_outline,color:Colors.blue,size: 50,),
                onPressed: (){
                  _controller.forward();
                },
                ),
            ],
          );
        },
      ),
    );
  }
}
