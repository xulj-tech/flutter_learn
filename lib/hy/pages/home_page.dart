import 'package:flutter_learn/hy/api/api.dart';
import 'package:flutter_learn/hy/api/common_service.dart';
import 'package:flutter_learn/hy/pages/webview_page.dart';
import 'package:flutter_learn/hy/utils/GlobalConfig.dart';
import 'package:flutter_learn/hy/utils/util.dart';
import 'package:flutter_learn/hy/widget/banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/size_extension.dart';

class HomePage extends StatelessWidget{
  static const routeName="/homePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Column(
       children: <Widget>[
         BannerContent(),
         MessageContent(),
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
            padding: EdgeInsets.all(20.px),
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
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
            Image(image: AssetImage("assets/images/$_image"),width: 60.px,height: 60.px,),
              Text(_name, style:TextStyle(color:GlobalConfig.color_font,fontSize: 15)),
            ],
          )
      ),
      onTap: () {
        switch(_index){
          case 2:
            Navigator.of(context).pushNamed(WebViewPage.routeName);
            break;

          case 8:
            Util.showLogoutDialog(context, "您确认退出吗？");
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
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30.0,
            child: Text("公告",style: TextStyle(fontSize: 15,color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700),),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 30.0,
            child: Text("信息发布",style: TextStyle(fontSize: 15,color: GlobalConfig.color_font),),
          ),
        ),
      ],
    );
  }
}