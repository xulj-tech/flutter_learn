import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_learn/blog/model/home_entity.dart';
import 'package:flutter_learn/blog/home/home_list_item.dart';
import 'package:flutter_learn/blog/home/swiper_widget.dart';
import 'package:flutter_learn/blog/model/banner_entity.dart';
import 'package:flutter_learn/blog/net/home_request.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Column(
          children: <Widget>[
            BannerContent(),
            Expanded(
              child:HomePageContent(),
            ),
          ],
        ));
  }
}

//banner
class BannerContent extends StatefulWidget {
  @override
  _BannerContentState createState() => _BannerContentState();
}

class _BannerContentState extends State<BannerContent> {
  final List<BannerData> bannerList = [];

  @override
  void initState() {
    super.initState();
    HomeRequest.requestBannerList().then((BannerEntity entity) {
      setState(() {
        if (entity.errorCode == 0) {
          bannerList.addAll(entity.data);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerWidget(bannerList: bannerList);
  }
}

//列表list
class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  final List<HomeDataData> homeDataList = [];
  var pageIndex=1;
  @override
  void initState() {
    super.initState();
    getData(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      child: ListView.builder(
        itemCount: homeDataList.length,
        itemBuilder: (ctx, index) {
          return HomeListItem(homeDataList[index]);
        },
      ),
      onRefresh: () async {
        pageIndex=1;
        homeDataList.clear();
        getData(pageIndex);
      },
      onLoad: () async {
        pageIndex++;
        getData(pageIndex);
      },
    );
  }

  getData(index){
    HomeRequest.requestHomeList(index).then((HomeEntity entity) {
      setState(() {
        if (entity.errorCode == 0) {
          homeDataList.addAll(entity.data.datas);
        }
      });
    });
  }

}
