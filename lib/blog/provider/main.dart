import 'package:flutter_learn/blog/provider/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx)=>MyCounter()),
      ChangeNotifierProvider(create: (ctx)=>MySubtract()),
    ],
    child: MyApp(),
  )
);

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
            SizedBox(height: 30),
            MyContainer2()
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

class _MyContainer1State extends State<MyContainer1> {
  @override
  Widget build(BuildContext context) {
    final String name1=Provider.of<MyCounter>(context).userInfo.name;
    final int age1=Provider.of<MyCounter>(context).userInfo.age;

    final String name2=Provider.of<MySubtract>(context).userInfo.name;
    final int age2=Provider.of<MySubtract>(context).userInfo.age;

    return Column(
      children: <Widget>[
        Text("Container1 name1=$name1  age1=$age1",style: myTextStyle1()),
        Text("Container1 name2=$name2  age2=$age2",style: myTextStyle2()),
      ],
    );
  }
}

TextStyle myTextStyle1(){
  return TextStyle(fontSize: 20,color: Colors.blue);
}

TextStyle myTextStyle2(){
  return TextStyle(fontSize: 20,color: Colors.green);
}

class MyContainer2 extends StatefulWidget{

  @override
  _MyContainer2State createState() => _MyContainer2State();
}

class _MyContainer2State extends State<MyContainer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer2<MyCounter,MySubtract>(
       builder: (ctx,counterVM,subtractVM,child){
         return Column(
           children: <Widget>[
             Text("Container2 name1=${counterVM.userInfo.name}  age1=${counterVM.userInfo.age}",style:myTextStyle1()),
             Text("Container2 name2=${subtractVM.userInfo.name}  age2=${subtractVM.userInfo.age}",style:myTextStyle2()),
             SizedBox(height: 30,),
             RaisedButton(
               child:Text("点 击"),
               onPressed: (){
                 counterVM.add();
                 subtractVM.sub();
               },
             ),
           ],
         );
       },
      ),
    );
  }
}