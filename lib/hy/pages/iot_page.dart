import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_learn/hy/widget/my_tab_bar_widget.dart';

class IotControlPage extends StatelessWidget {
  static const routeName="/iotControlPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
        elevation: 0,
        title: Text("物联操控"),
      ),
      body:IotContent()
    );
  }
}

TabController _tabController;
var _tabs = ['场景','视频','门禁','对讲','广播','灯光'];
var _image = [
  'contentunion_bt_scenario_off.png',
  'contentunion_bt_video_off.png',
  'contentunion_bt_lock_off.png',
  'contentunion_bt_intercom_off.png',
  'contentunion_bt_radio_off.png',
  'contentunion_bt_light_off.png'];
List<Widget> tabList;

List<Widget> getTabList() {
  return _tabs.asMap().keys.map((index) =>
    Column(
      children: <Widget>[
        Image(image: AssetImage("assets/images/${_image[index]}"),width: 20,height: 20,),
        SizedBox(height: 5,),
        Text(_tabs[index], style: TextStyle(fontSize: 15),)
      ],
    ),
  ).toList();
}

class IotContent extends StatefulWidget{
  @override
  _IotContentState createState() => _IotContentState();
}
class _IotContentState extends State<IotContent> with SingleTickerProviderStateMixin{

  var tabBar;
  @override
  void initState() {
    super.initState();
    tabBar = HomePageTabBar();
    tabList = getTabList();
    _tabController = TabController(vsync: this, length: tabList.length);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            _tapBar(),
          ];
        },
        body:FlutterTabBarView(tabController: _tabController,),
      ),
    );
  }

  Widget _tapBar() {
    return SliverPersistentHeader(
        floating: true,
        pinned: true,
        delegate: _SliverAppBarDelegate(
            maxHeight: 70.0,
            minHeight: 70.0,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: tabBar,
            )));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HomePageTabBar extends StatefulWidget {
  HomePageTabBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageTabBarState();
  }
}

class _HomePageTabBarState extends State<HomePageTabBar> {
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;
  @override
  void initState() {
    super.initState();
    selectColor = Colors.white;
    unselectedColor = Colors.white;
    selectStyle = TextStyle(fontSize: 14, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 14, color: selectColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 8.0),
      child: TabBar(
        tabs: tabList,
        isScrollable: true,
        controller: _tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectedColor,
        unselectedLabelStyle: unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}