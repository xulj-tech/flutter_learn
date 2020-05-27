import 'package:flutter_learn/hy/pages/iot_page.dart';
import 'package:flutter_learn/hy/pages/knowledge_page.dart';
import 'package:flutter_learn/hy/pages/person_page.dart';
import 'package:flutter_learn/hy/pages/setting_page.dart';
import 'package:flutter_learn/hy/pages/webview_page.dart';
import 'package:flutter_learn/hy/utils/GlobalConfig.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'package:flutter_learn/hy/widget/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/hy/utils/size_fit.dart';

import 'alarm_page.dart';

class HomePage extends StatelessWidget{
  static const routeName="/homePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Column(
       children: <Widget>[
         BannerContent(),
         MessageContent(),
         Container(height: 12, color: Colors.grey[300],),
         Expanded(
            child: HomeContent(),
        )
       ],
     )
    );
  }
}

//banner
class BannerContent extends StatefulWidget {

  @override
  _BannerContentState createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  final bannerList=["assets/images/u26.png","assets/images/u27.png"];

  @override
  Widget build(BuildContext context) {
    return BannerWidget(bannerList: bannerList);
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Util.getImages(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        if (snapshot.error != null) return Center(child: Text("请求失败"),);
        final images = snapshot.data;
        final names=Util.getMenuName();
        return GridView.builder(
            padding: EdgeInsets.all(ScreenUtil.px(20)),
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: ScreenUtil.px(20),
                mainAxisSpacing: ScreenUtil.px(20),
                childAspectRatio: 1
            ),
            itemBuilder: (ctx, index) {
              return HomeMenuItem(images[index],names[index],index);
            }
        );
      },
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String _image;
  final String _name;
  final int _index;
  HomeMenuItem(this._image,this._name,this._index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image(image: AssetImage("assets/images/$_image"),width: ScreenUtil.px(60),height: ScreenUtil.px(60),),
              Text(_name, style:TextStyle(color:GlobalConfig.colorFont,fontSize: 15)),
            ],
          )
      ),
      onTap: () {
        switch(_index){
          case 0:
            Navigator.of(context).pushNamed(IotControlPage.routeName);
            break;
          case 1:
            Navigator.of(context).pushNamed(AlarmPage.routeName);
            break;
          case 2:
            Navigator.of(context).pushNamed(WebViewPage.routeName);
            break;
          case 6:
            Navigator.of(context).pushNamed(KnowledgePage.routeName);
            break;
          case 7:
            Navigator.of(context).pushNamed(PersonPage.routeName);
            break;
          case 8:
            Navigator.of(context).pushNamed(SettingPage.routeName);
            break;
          default:
            break;
        }
      },
    );
  }
}

class MessageContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text("公告",style: TextStyle(fontSize: 15,color: GlobalConfig.colorPrimary,fontWeight: FontWeight.bold),),
        ),
        Container(width:2,height: 20,child: VerticalDivider(color: Colors.grey)),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10,),
            alignment: Alignment.centerLeft,
            height:30,
            child: Text("信息发布",style: TextStyle(fontSize: 15,color: GlobalConfig.colorFont),),
          ),
        ),
      ],
    );
  }
}