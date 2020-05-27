import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/utils/GlobalConfig.dart';
import 'package:flutter_learn/hy/utils/route.dart';
import 'package:flutter_learn/hy/utils/size_fit.dart';

class PersonPage extends StatelessWidget {
  static const routeName="/personPage";
  BuildContext _context;
  @override
  Widget build(BuildContext  context) {

    _context = context;

    final List <Widget> list1=[listItem("语音控制","ic_audio",0), listItem("门禁控制","ic_door",1),
      listItem("视频会议","ic_meeting",2),Expanded(flex: 1, child:Container())];
    final List <Widget> list2=[listItem("场景管理","ic_screen",3), listItem("访客预约","ic_visitor",4),
      listItem("生日祝福","ic_birthday",5),listItem("广播点播","ic_broadcast",6)];

    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start ,
        children: <Widget>[
          headContent(context),
          buildContainer("基础应用"),
          menuContainer(list1),
          Container(height: 12, color: Colors.grey[300],),
          buildContainer("常用应用"),
          menuContainer(list2),
        ],
      ),
    );
  }

  Widget listItem(String name,String image,index){
    return Expanded(
      flex: 1,
      child: menuItem(name,image,index),
    );
  }

  Widget menuItem(String name, String imageName,int index){
    return GestureDetector(
      child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              Image(image: AssetImage("assets/images/$imageName.png"),width: ScreenUtil.px(32),height: ScreenUtil.px(32),),
              SizedBox(height: 5,),
              Text(name, style:TextStyle(color:GlobalConfig.colorFont,fontSize: 15)),
            ],
          )
      ),
      onTap: (){
        switch (index) {
          case 0:
            break;
          case 3:
            RouterConfig.openWeb(_context, "场景管理",Api.FC_Web_ZHHY_VIPCJ_0001);
            break;
          case 4:
            RouterConfig.openWeb(_context, "访客预约",Api.FC_Web_ZHHY_FKAPPYY_0001);
            break;
          case 5:
            RouterConfig.openWeb(_context, "生日祝福",Api.FC_Web_ZHHY_SRCJ_0001);
            break;
          case 6:
            RouterConfig.openWeb(_context, "广播点播",Api.FC_Web_ZHHY_ZHGBDB_0001);
            break;
          default:
            break;
        }
      },
    );
  }

}

Container buildContainer(String name) {
  return Container(
      padding: EdgeInsets.only(left: 15,top: 15),
      alignment:Alignment.centerLeft,
      child: Text(name,style:TextStyle(color:GlobalConfig.colorFont,fontSize: 15,fontWeight: FontWeight.bold)));
}

//头部
Widget headContent(BuildContext context){
  return Container(
    height: ScreenUtil.px(200),
    child: Stack(
      alignment:Alignment.center,
      children: <Widget>[
          Image(image: AssetImage("assets/images/head_bg.png"),fit: BoxFit.cover,height: ScreenUtil.px(230)),
          Container(
            padding: EdgeInsets.only(top: 40),
            child: ListTile(
              leading: Image(image: AssetImage("assets/images/person_circle.png"),height: 40,),
              title: Text("admin",style: TextStyle(color: Colors.white)),
              subtitle: Text("产品规划部",style: TextStyle(color: Colors.white),),
              trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
                child: Image(image: AssetImage("assets/images/btn_back_normal.png"),height: 35,),
                onTap: (){
                  Navigator.of(context).pop();
                },
            ),
          )
      ],
    ),
  );
}

Widget menuContainer(List<Widget>list){
  return Padding(
    padding: EdgeInsets.all(15),
    child: SizedBox(
      height: ScreenUtil.px(140),
      child: Flex(
        direction: Axis.horizontal,
        children: list
      ),
    )
  );
}

