import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/utils/util.dart';

class SettingPage extends StatelessWidget{
  static const routeName="/settingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.getAppBar(context, "系统配置"),
      body: settingContent(context),
    );
  }
}

Widget settingContent(BuildContext context){
  return Column(
    children: <Widget>[
      ListTile(
        leading:Image(image: AssetImage("assets/images/set_ic_update.png"),width: 20),
        title: Text("版本更新"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      Divider(height: 1.0,indent:15,color: Colors.grey[400],),
      ListTile(
        leading:Image(image: AssetImage("assets/images/set_ic_about.png"),width: 20,),
        title: Text("关于"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      Divider(height: 1.0,indent:15,color: Colors.grey[400],),
      ListTile(
        leading:Image(image: AssetImage("assets/images/set_ic_exit.png"),width: 20,),
        title: Text("退出登录"),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Util.showLogoutDialog(context, "您确认退出吗？");
        },
      ),
      Divider(height: 1.0,color: Colors.grey[400],),
    ],
  );

}